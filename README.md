# GEN711 Final Project
## By: 
Taylor Hartley
## Background
qiime2_microbiome_project
- Gut to soil Axis
- To study the microbiome composition of duckweeds, samples were collected directly from pond water and from duckweed scimmed off the surface of a pond. 
- The data used is Illumina HiSeq 2500, paired-end, 250 bp sequencing reads.
- The goal is to align 16s regions, classify microbes, create a phylogenetic tree visualization of microbe relationships, and create diversity metrics of the dataset.
## Methods 
- The data was collected from two different ponds by a grad student at UNH. The data is Illumina HiSeq 2500, paired-end, 250 bp sequencing reads.
The analysis was performed using a laptop on the UNH RON server. 
- The program DADA2 was first used to remove low-quality bases, correct sequencing errors, and used the reads to create Amplicon Sequence Variants (ASV). This output a feature table. This feature table inclued the amount of ASV in each sample, the ASV sequences, and the denoising statistics. From this, high quality sequences were obtained to be used for downstream analysis (1).  
- A phylogenetic tree was created using the programs MAFFT and FastTree. This program aligned the sequences and created both rooted and unrooted phylogenetic trees. These tress are useful for analyzing evolutionary relationships between the sequence variants (1).
- Taxonomy classification was determined using the Qiime2 feature-classifier program. This program produced a taxonomy file and assigned a classification to each ASV (1).
- Lastly, to export the files the qiime tools export program was used. This allowed for visualization in other programs (1).
- Pipeline: Import and demultiplex using qiime tools import and qiime demux summarize.
            Denoising using DAD2.
            Visualization using metadata tabulate and feature-table summarize.
            Phylogenetic tree using MAFFT and FastTree.
            Core metrics using alpha rarefaction.
            Taxonomy classification using classify sklearn, metadata tabulate, and taxa barplot.
            Export data using qiime tools export.
- The results were then visualized using the qiime2 visualizer (2). 
## Findings
I was not able to upload a plot, but the first one would have been a venn diagram showing the similarity between the samples. In contrast, the second plot would have shown the different genes between the samples. Both plots would have been created using the qiime2 visualizer by inputting the data produced by Bowtie2. 
## References
1. Qiime2docs. Gut-to-soil axis tutorial 💩🌱. Microbiome marker gene analysis with QIIME 2. https://amplicon-docs.qiime2.org/en/latest/tutorials/gut-to-soil.html (2025).
2. Qiime2view. Qiime2. https://view.qiime2.org/ (n.d.).
