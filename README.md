Source code for all the analyses performed for the LIDAR paper (Zhang & Mille-Fragoso et al.):

All three analyses were ran using OSX Sonoma 14.3 on different Anaconda (conda 24.11.0) environments. No required non-standard hardware was used.
The python and MATLAB packages used were installed using conda/pip install or MATLAB GUI, respectively. Installation should not take more than 10 min. 

Requirements for each of the analyses:
1. Co-culture picture analysis [Python 3.8.12, Numpy 1.21.2,  Pandas 1.3.5, natsort 8.2.0, matplotlib 3.7.5,  MATLAB R2023b (23.2.0.2668659)]
2. Amplicon RNA editing rates [Python 3.8.12, Numpy 1.21.2]
   - FLASH v1.2.11 (https://github.com/ebiggers/flash?tab=readme-ov-file) for combining pairs of reads. Installed using the instructions in the Github repository. 
3. Transcriptome-wide specificity profiles [Python 3.12.2, Pandas 2.2.2, Numpy 2.0.1, Matplotlib 3.9.1.post1, scipy 1.14.1, statsmodels 0.14.2, samtools 1.16.1 (using htslib 1.16)]
     - To obtain the files used to run the scripts in this folder pleas see README inside server_scripts folder.
     - Server running CentOS Linux version = 7 (Core) was used. GCC 4.8.5 20150623.


All codes should be ready to run with the demo data provided. A run should not take more than 10 min for any of them. The expected outputs are:

Co-culture picture analysis:
1. MATLAB code -> 3 CSV files (1 for each channel R,G,B).
2. iPython Notebook -> Plots shown in main text.

Amplicon RNA editing:
1. Python code -> percentage of edited reads

Transcriptome-wide specificity profiles:
1. preprocess_redi.py -> CSV containing sites determined by REDI to have a A->G or T->C event.
2. consensus_sites.ipynb -> Plots

