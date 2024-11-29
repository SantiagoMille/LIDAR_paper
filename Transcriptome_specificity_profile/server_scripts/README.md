{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgray\c0;}
\margl1440\margr1440\vieww22340\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 Modify all scripts accordingly:\
\
-First generate genome with genGenome.sbatch\
\
-Align the sequences using alignment.sbatch\
\
-run preprocess_aligned.sbatch\
\
-count the number of markdup reads and save that number\
\
-use the number to calculate the ratios (# of reads of the sample with least reads/# of reads of each condition) (number between 0-1]\
\
-Downsample the aligned reads using that calculated ratios\
\
\
Example of commands after running preprocess.sbatch:\
\
samtools view -c NG3_markdup.bam\
samtools view -@ 6 -s 0.753 -b -h -o NG3.downsampled.bam NG3_markdup.bam\
\
- the second command might have to be run using SLURM: use downsample.sbatch \
\
- run Redit using run_redi.sbatch (eg., sbatch run_red.sbatch eLIDAR.downsampled.bam)\
\
-transfer resulting tab file to local computer and run (python preprocess_redi.py files_to_process)\
\
-then run the python notebook to calculate statistically significant edit sites and generate the plots.}