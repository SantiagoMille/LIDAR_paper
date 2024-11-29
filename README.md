Source code for each of the analyses made in the paper:

All three analyses was ran using OSX Sonoma 14.3 on different Conda (conda 24.11.0) environments. No required non-standard hardware was used.
The python and matlab packages used were installed using conda/pip install or MATLAB GUI. Installation should not take more than 10 min. 

1. Co-culture picture analysis [Python 3.8.12, Numpy 1.21.2,  Pandas 1.3.5, natsort 8.2.0, matplotlib 3.7.5,  MATLAB R2023b (23.2.0.2668659)]
2. Amplicon RNA editing rates [Python 3.8.12, Numpy 1.21.2]
   - FLASH v1.2.11 (https://github.com/ebiggers/flash?tab=readme-ov-file) for combining pairs of reads. Installed using the instructions in the Github repository. 
3. Transcriptome-wide specificity profiles [Python 3.12.2, Pandas 2.2.2, Numpy 2.0.1, Matplotlib 3.9.1.post1, scipy 1.14.1, statsmodels 0.14.2]
     - To obtain the files used to run the scripts in this folder pleas see README at server_scripts folder (CentOS Linux version = 7 (Core), GCC 4.8.5 20150623)


All codes should be ready to run with the demo data provided. A run should not take more than 10 min for any of these codes. The expected outputs are:

1. Co-culture picture analysis - MATLAB -> 3 CSV files (1 for each channel R,G,B)
2. Co-culture picture analysis - iPython Notebook -> Plots shown in main text

1. Amplicon RNA editing -> percentage of edited reads

1. Transcriptome-wide specificity profiles - preprocess_redi.py -> CSV containing sites determined by REDI to have a A->G or T->C event.
2. Transcriptome-wide specificity profiles - consensus_sites.ipynb -> Plots

