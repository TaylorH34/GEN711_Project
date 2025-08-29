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
<img width="679" height="422" alt="Screenshot 2025-08-28 at 8 48 59 PM" src="https://github.com/user-attachments/assets/b40d846c-fd00-478a-bb2e-45346041e0a7" />
Figure 1. 
<img width="687" height="422" alt="Screenshot 2025-08-28 at 8 49 09 PM" src="https://github.com/user-attachments/assets/ca4c69d1-7e75-4de6-a05b-7222bab7eef9" />
Figure 2. 
- These are Qiime2 demultiplexing summary boxplots showing the per-base quality score of the reads in the samples. This includes the quality scores and sequencing errors for every read at each position. These plots were created using the qiime2 visualizer. The data prodced by dada2 were input to create the plots (2).

## References
1. Qiime2docs. Gut-to-soil axis tutorial 💩🌱. Microbiome marker gene analysis with QIIME 2. https://amplicon-docs.qiime2.org/en/latest/tutorials/gut-to-soil.html (2025).
2. Qiime2view. Qiime2. https://view.qiime2.org/ (n.d.).
