{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgray\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 #!/bin/bash\
#SBATCH --job-name=bam_c\
#SBATCH --error=./logs/bam_c_%j.err\
#SBATCH -o ./logs/bam_c_%j.out\
#SBATCH --qos=normal\
#SBATCH --time=2:00:00\
#SBATCH -p normal\
#SBATCH --ntasks=1\
#SBATCH --nodes=1 \
#SBATCH --mem=64G\
#SBATCH --mail-user=lsmille@stanford.edu\
#SBATCH --mail-type=END\
#SBATCH --requeue\
#SBATCH --cpus-per-task=6\
\
STR="cLIDAR"\
collatef="$\{STR\}.collate.bam"\
originalf="$\{STR\}Aligned.sortedByCoord.out.bam"\
fixmatef="$\{STR\}.fixmate.bam"\
sortedf="$\{STR\}.position.sorted.bam"\
markdupf="$\{STR\}.markdup.bam"\
\
ml biology samtools\
\
samtools collate -@ 6 -o $collatef ./$originalf\
samtools fixmate -@ 6 -m $collatef ./$fixmatef\
samtools sort -@ 6 -o ./$sortedf ./$fixmatef \
samtools markdup -@ 6 -r -f stats.out ./$sortedf $markdupf\
samtools view -o count_markdup.out -c $markdupf\
\
mkdir /scratch/groups/xjgao/processed_bams/$STR/\
mv $collatef $fixmatef $sortedf /scratch/groups/xjgao/processed_bams/$STR/}