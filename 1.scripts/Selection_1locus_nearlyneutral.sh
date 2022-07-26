#!/bin/bash
#SBATCH -J SLiM_Selection
#SBATCH --output=/home4/eschwar3/SLiMSelectionRecombination/1.scripts/1.logs/SLiMRun_Selection_1locus_nearlyneutral%a.out
#SBATCH --error=/home4/eschwar3/SLiMSelectionRecombination/1.scripts/1.logs/SLiMRun_Selection_1locus_nearlyneutral%a.err
#SBATCH --array=1-500

# This script runs the SLiM script for a recombination modifier with parameters for a control case where recombination is affected, but there are only neutral mutations

i=$SLURM_ARRAY_TASK_ID

mkdir ~/SLiMSelectionRecombination/2.output/Selection_1locus_nearlyneutral

cd ~/SLiMSelectionRecombination/2.output/Selection_1locus_nearlyneutral

slim -s $i+270888 -d N=10000 -d M_POS=5e4 -d M_EF=0.5 -d GENOM_SIZE=1e5 -d M_FREQ=0.5 -d M_H=0.5 -d R_WT=1e-5 ~/SLiMSelectionRecombination/1.scripts/RecombinationModifier_1locus_nearlyneutral.slim > Selection_1locus_nearlyneutral_output_$i.txt

printf "$i\n$(tail -n 10 Selection_1locus_nearlyneutral_output_$i.txt)" > Selection_1locus_nearlyneutral_output_$i.txt
