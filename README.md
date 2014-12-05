strane - Substitution TRANsition Estimation workflow
======

This workflow provides software tools to estimate nucleotide substitution 
rates over time from sequencing reads using statistical inference. The 
workflow accompanies an upcoming peer-reviewed journal article. The analysis
results can be replicated using the haplotype data (*genotypes.sig.txt) 
available at ????. Additional details will be provided as they become available.

## Requirements
These workflows have been tested on MACOSX and linux operating systems
using recent versions of Perl, R, and X11.

#### Perl modules:
    Bio::fastAPD
#### R libraries:
    optimx
    ggplot2

## Data for Analysis
A subdirectory named data may be created in the strane directory to house
the data for analysis.

## The substitution transition estimation analysis
To run the analysis - 
From within a shell session, navigate to the strane directory and type:

  bash substitution_transition_analysis.sh ./data

The analysis consists of five steps. The user will be notified when the script 
has finished. If no errors are reported, the analysis is complete.





