estimate_sub_rate
======
### Nucleotide substitution rate estimation workflow

This workflow provides software tools to estimate nucleotide substitution 
rates over time from multiple sequence alignments using statistical inference.
The workflow accompanies an upcoming peer-reviewed journal article. Additional
details will be provided as they become available.

## Requirements
This workflow has been tested on MACOSX and linux operating systems
using recent versions of Perl, R, and X11.

#### Perl modules:
    Bio::fastAPD
#### R libraries:
    optimx

### Data for Analysis
A subdirectory named <i>data</i> may be created in the <i>estimate_sub_rate</i> directory to house
the data for analysis.

## Usage

To run the analysis - 
From within a shell session, navigate to the <i>estimate_sub_rate</i> directory and type:

    bash substitution_transition_analysis.sh ./data

The analysis consists of five steps. The user will be notified when the script 
has finished. If no errors are reported, the analysis is complete.

## Authors

Joseph D. Baugher, Ph.D. and Fernando J. Pineda, Ph.D.<br>
Copyright (c) 2014 Joseph D. Baugher, Ph.D.

## Maintainer

Joseph D. Baugher, Ph.D., joebaugher(at)hotmail.com



