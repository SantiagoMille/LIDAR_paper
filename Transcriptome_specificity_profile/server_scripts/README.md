Modify all scripts accordingly:

1. First generate genome with genGenome.sbatch -> Using GRCh38 (Genocode V46) and custom sequences (see Methods section in the manuscript)
2. Align the sequences using alignment.sbatch (STAR 2.7.10b)
3. Run preprocess_aligned.sbatch (samtools 1.16.1)
4. Count the number of markdup reads and save that number -> see output file: count_markdup.out or use samtools
5. Use the number to calculate the ratios (# of reads of the sample with least reads/# of reads of each condition) (number between 0-1]. See Supplementary Table 5
6. Downsample the aligned reads using that calculated ratios


Example of commands after running preprocess.sbatch:

samtools view -c NG3_markdup.bam
samtools view -@ 6 -s 0.753 -b -h -o NG3.downsampled.bam NG3_markdup.bam

**The second command might have to be run using SLURM: use downsample.sbatch 

7. Run REDI using run_redi.sbatch (eg., sbatch run_red.sbatch eLIDAR.downsampled.bam)
8. Transfer resulting tab file to local computer and run (python preprocess_redi.py files_to_process)
9. Run the python notebook to calculate statistically significant edit sites and generate the plots.
