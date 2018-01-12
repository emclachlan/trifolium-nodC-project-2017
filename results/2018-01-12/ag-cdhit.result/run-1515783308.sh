#!/bin/sh
#$ -S /bin/bash
#$ -v PATH=/home/oasis/data/webcomp/RAMMCAP-ann/bin:/usr/local/bin:/usr/bin:/bin
#$ -v BLASTMAT=/home/oasis/data/webcomp/RAMMCAP-ann/blast/bin/data
#$ -v LD_LIBRARY_PATH=/home/oasis/data/webcomp/RAMMCAP-ann/gnuplot-install/lib
#$ -v PERL5LIB=/home/hying/programs/Perl_Lib
#$ -q all.q
#$ -pe orte 2


#$ -e /home/oasis/data/webcomp/web-session/1515783308/1515783308.err
#$ -o /home/oasis/data/webcomp/web-session/1515783308/1515783308.out
cd /home/oasis/data/webcomp/web-session/1515783308
faa_stat.pl 1515783308.fas.0

/home/oasis/data/NGS-ann-project/apps/cd-hit/cd-hit-est -i 1515783308.fas.0 -d 0 -o 1515783308.fas.1 -c 1.0 -n 10 -l 11  -r 0 -G 1 -g 1 -b 20 -s 0.0 -aL 0.0 -aS 0.0 -T 4 -M 32000
faa_stat.pl 1515783308.fas.1
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_sort_by.pl no < 1515783308.fas.1.clstr > 1515783308.fas.1.clstr.sorted
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list.pl 1515783308.fas.1.clstr 1515783308.clstr.dump
gnuplot1.pl < 1515783308.fas.1.clstr > 1515783308.fas.1.clstr.1; gnuplot2.pl 1515783308.fas.1.clstr.1 1515783308.fas.1.clstr.1.png
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list_sort.pl 1515783308.clstr.dump 1515783308.clstr_no.dump
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list_sort.pl 1515783308.clstr.dump 1515783308.clstr_len.dump len
/home/oasis/data/NGS-ann-project/apps/cd-hit/clstr_list_sort.pl 1515783308.clstr.dump 1515783308.clstr_des.dump des
tar -zcf 1515783308.result.tar.gz * --exclude=*.dump --exclude=*.env
echo hello > 1515783308.ok
