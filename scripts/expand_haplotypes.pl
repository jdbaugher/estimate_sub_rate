#!/usr/bin/perl -w
# expand_haplotypes.pl
# Author: Joseph D. Baugher, <jbaughe2(at)jhmi.edu>
# Copyright (c) 2014 Joseph D. Baugher

use strict;
use File::Basename;
use File::chdir;
use File::Spec;
use Getopt::Long;

# This script reads in files of fasta-formatted haplotypes and expands each haplotype,
# creating a number of identical reads according the number of reads each haplotype 
# represents. The number of reads is extracted from the second comma-separated field in
# each header line, e.g. This haplotype represents 5000 reads:
# >Haplotype1, 5000, 1, 100, 0

my $input_dir = "./";
my $glob      = "*";        

my $the_options = GetOptions (
    "input_dir=s" => \$input_dir,
    "glob=s" => \$glob,
    );

{
    local $CWD = $input_dir;
    my @input_files = glob($glob);
    
    foreach my $ifile (@input_files) {
        my $base = fileparse($ifile, qr/\.[^.]*/);
        my $outfile = $base . ".expanded_haplotypes.fa";
        unless (-e $outfile) {
            open(my $infh,"<",$ifile) or die("Cannot open input file: $ifile\n");
            open(my $outfh,">",$outfile) or die("Cannot create output file\n");
        
            my $num_reads = 0;
            my $hap_name = "";
            my @hap_name = ();
            while(<$infh>) {
                chomp;
                if (/^>/) {
                    @hap_name = split ",";
                    $num_reads = $hap_name[1];
                }
                elsif ($num_reads) {
                    my $seq = $_;
                    for(my $i=1; $i <= $num_reads; $i++) {
                        $hap_name = join(",", $hap_name[0]. "-$i", @hap_name[-4..-1]);
                        print $outfh "$hap_name\n$seq\n";
                    }
                }
                else {die("Invalid number of reads!\n")}
            }
            close $infh;
            close $outfh;
        }
    }
}    
