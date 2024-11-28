{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgray\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 #!/bin/bash\
#SBATCH --job-name=dwnsamp\
#SBATCH --error=./logs/dwnsamp_%j.err\
#SBATCH -o ./logs/dwnsamp_%j.out\
#SBATCH --qos=normal\
#SBATCH --time=2:00:00\
#SBATCH -p normal\
#SBATCH --ntasks=1\
#SBATCH --nodes=1 \
#SBATCH --mem=32G\
#SBATCH --mail-user=lsmille@stanford.edu\
#SBATCH --mail-type=END\
#SBATCH --requeue\
#SBATCH --cpus-per-task=12\
\
ml biology samtools\
\
samtools view -@ 12 -s $1 -b -h -o ./$2 ./$3}