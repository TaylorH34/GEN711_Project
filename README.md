# GEN711_Project
GEN 711 Final Project
Members: Taylor Hartley
# Background
qiime2_microbiome_project
Gut to soil Axis
- To study the microbiome composition of duckweeds, samples were collected directly from pond water and from duckweed scimmed off the surface of a pond. 
- The data used is Illumina HiSeq 2500, paired-end, 250 bp sequencing reads.
- The goal is to align 16s regions, classify microbes, create a phylogenetic tree visualization of microbe relationships, and create diversity metrics of the dataset.
## Methods 
- The data was collected from two different ponds by a grad student at UNH. The data is Illumina HiSeq 2500, paired-end, 250 bp sequencing reads.
The analysis was performed using a laptop on the UNH RON server. 
- The program FastCQ was first used to determine the intial quality of the raw sequence data. This output a report with the statistics showing the sequencing quality. In addition to the quality, the number and length of the reads was also reported. Furthermore, FastQC also identified adapter sequences that need to be removed. The report identified the sequences that needed to be trimmed in further steps.  
- To trim the unneccessary reads the program Trimmomatic was used. This program is intended to be used for Illumina paired-end data such as the data used for this project. Trimmomatic successfully removed the adapter sequences and low quality reads that were previously identified thereby improving the quality of the data and preparing the reads for alignment. FastCQ was then run again to ensure the quality of the trimmed fastq files had improved.
- The next program used was Bowtie2. This program aligned the reads to a reference genome and a sequence alignment map file was then produced.
- The reuslts were visualized using the qiime2 visulaizer.
### Findings
I was not able to upload a plot, but the first one would have been a ven diagram showing the similarity between the samples. In contrast, the second plot would have shown the different genes between the samples. Both plots would have been created using the qiime2 visualizer by inputting the data produced by Bowtie2. 
#### References
1. Qiime2docs. Gut-to-soil axis tutorial 💩🌱. Microbiome marker gene analysis with QIIME 2. https://amplicon-docs.qiime2.org/en/latest/tutorials/gut-to-soil.html (2025). 
