#!/bin/bash
# Activate Qiime2 environment
source ~/.bashrc
conda activate qiime2-amplicon-2024.5

# Import raw FASTQ files into Qiime2 artifact
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path manifest.tsv \
  --output-path paired-end-demux.qza \
  --input-format PairedEndFastqManifestPhred33V2

# Summarize demultiplexed sequences
qiime demux summarize \
--i-data paired-end-demux.qza \
--o-visualization demux.qzv

# Create subdirectories
mkdir -p dada2 phylogeny diversity taxonomy visualizations exported

# DADA2 denoising
qiime dada2 denoise-paired \
  --i-demultiplexed-seqs ./paired-end-demux.qza \
  --p-trim-left-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-f 230 \
  --p-trunc-len-r 210 \
  --o-table dada2/table.qza \
  --o-representative-sequences dada2/rep-seqs.qza \
  --o-denoising-stats dada2/stats.qza

# Visualization
qiime metadata tabulate \
  --m-input-file dada2/stats.qza \
  --o-visualization dada2/stats.qzv

qiime feature-table summarize \
  --i-table dada2/table.qza \
  --o-visualization visualizations/table.qzv \
  --m-sample-metadata-file metadata.tsv

qiime feature-table tabulate-seqs \
  --i-data dada2/rep-seqs.qza \
  --o-visualization visualizations/rep-seqs.qzv

# Create Phylogenetic tree
qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences dada2/rep-seqs.qza \
  --o-alignment phylogeny/aligned-rep-seqs.qza \
  --o-masked-alignment phylogeny/masked-aligned-rep-seqs.qza \
  --o-tree phylogeny/unrooted-tree.qza \
  --o-rooted-tree phylogeny/rooted-tree.qza

# Core diversity metrics
qiime diversity core-metrics-phylogenetic \
  --i-phylogeny phylogeny/rooted-tree.qza \
  --i-table dada2/table.qza \
  --p-sampling-depth 1000 \
  --m-metadata-file metadata.tsv \
  --output-dir diversity

# Alpha rarefraction
qiime diversity alpha-rarefaction \
  --i-table dada2/table.qza \
  --i-phylogeny phylogeny/rooted-tree.qza \
  --p-max-depth 5000 \
  --m-metadata-file metadata.tsv \
  --o-visualization visualizations/alpha-rarefaction.qzv

# Taxonomy
qiime feature-classifier classify-sklearn \
  --i-classifier suboptimal-16S-rRNA-classifier.qza\
  --i-reads dada2/rep-seqs.qza \
  --o-classification taxonomy/taxonomy.qza

qiime metadata tabulate \
  --m-input-file taxonomy/taxonomy.qza \
  --o-visualization visualizations/taxonomy.qzv

# Taxonomy barplots
qiime taxa barplot \
  --i-table dada2/table.qza \
  --i-taxonomy taxonomy/taxonomy.qza \
  --m-metadata-file metadata.tsv\
  --o-visualization visualizations/taxa-bar-plots.qzv

# Export
qiime tools export \
  --input-path dada2/table.qza \
  --output-path exported/feature-table

qiime tools export \
  --input-path dada2/rep-seqs.qza \
  --output-path exported/rep-seqs

qiime tools export \
  --input-path phylogeny/rooted-tree.qza \
  --output-path exported/rooted-tree

qiime tools export \
  --input-path taxonomy/taxonomy.qza \
  --output-path exported/taxonomy

