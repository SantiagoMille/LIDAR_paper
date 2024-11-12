{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgray\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 #!/bin/bash\
#SBATCH --job-name=algn_NG\
#SBATCH --error=./logs/alg_NG_%j.err\
#SBATCH -o ./logs/alg_NG_%j.out\
#SBATCH --qos=normal\
#SBATCH --time=8:00:00\
#SBATCH -p normal\
#SBATCH --ntasks=1\
#SBATCH --nodes=1 \
#SBATCH --mem=48G\
#SBATCH --mail-user=lsmille@stanford.edu\
#SBATCH --mail-type=END\
#SBATCH --requeue\
#SBATCH --cpus-per-task=12\
\
ml biology star\
\
STAR --runThreadN 12 --genomeDir /scratch/groups/xjgao/genome250/STARidx \\\
     --readFilesIn /scratch/groups/xjgao/LIDAR_data/NG/NG_*.gz \\\
     --readFilesCommand zcat --outSAMtype BAM SortedByCoordinate \\\
     --quantMode GeneCounts \\\
     --outFileNamePrefix ./NG/NG_ \\\
     --readMapNumber -1 \\\
     --alignSJoverhangMin 1 \\\
     --alignSJDBoverhangMin 1 \\\
     --alignEndsType Local \\\
     --outFilterMultimapNmax 1 \\\
     --outSAMunmapped None \\\
     --outSAMmultNmax 1 \\\
     --outReadsUnmapped Fastx \\\
     --outFilterMismatchNoverLmax 0.25 \\}