#!/bin/bash
#######################
# substitution_transition_analysis.sh
# Author: Joseph D. Baugher, <joebaugher(at)hotmail.com>
# Copyright © 2014 Joseph D. Baugher
#######################
#$ -N substitution_transition_analysis
#$ -cwd
#$ -S /bin/bash 
#######################

# If starting with haplotypes, they must be expanded based on the number of reads 
# represented by each haplotype. Otherwise skip this step.
echo "Running Step 1 - haplotype expansion..."
perl scripts/expand_haplotypes.pl --input_dir $1 --glob *genotypes.sig.txt

# Frequencies of each base at each position are determined
echo "Running Step 2 - frequency calculation..."
perl scripts/calculate_frequencies.pl --input_dir $1 --glob *expanded_haplotypes.fa > frequency_table.txt

# Proportions of each base at each position are calculated and the data is structured
# for the mutation analysis
echo "Running Step 3 - probability calculation..."
Rscript scripts/calculate_probabilities.Rscript

# An optimized transition matrix is calculated which reveals the probability that a given
# base will mutate into another specific base over a five passage span
echo "Running Step 4 - transition matrix estimation..."
Rscript scripts/transition_estimation_w_gradient.Rscript

# Perform significance testing of transitions (ttest and wilcox) adjusted with 
# Bonferroni and produce plots
echo "Running Step 5 - significance testing..."
Rscript scripts/stats_and_graphics.Rscript
echo "Analysis finished."
