strane
======

Substitution TRANsition Estimation workflow - Estimates nucleotide substitution rates over time from sequencing reads.

# This workflow accompanies an upcoming peer-reviewed journal article.
# The reported results can be replicated using the haplotype data 
#(*genotypes.sig.txt) available at ????. Additional details will be
# provided as they become available.

# Software requirements - 
# Recent versions of Perl, R, and X11. 
# Perl module - Bio::fastAPD
# R libraries - optimx, gplots, ggplot2

# These workflows have been tested on MACOSX and linux operating systems.

# A subdirectory named data may be created in the strane directory to house
# the data for analysis.

#############################################

# The substitution transition estimation analysis

# To run the analysis - 
# Within a shell session, navigate to the strane directory and type:

bash substitution_transition_analysis.sh ./data

# The analysis consists of five steps. The user will be notified when the script 
# has finished. If no errors are reported, the analysis is complete.
