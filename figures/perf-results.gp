set terminal postscript eps enhanced color
set size 1, 1
set output "perf-results.eps"
set xlabel "File system operations " font "Times-Roman, 26"
set ylabel "Avg time taken" font "Times-Roman, 26" offset -0.5,0
set style data histogram
set style histogram errorbars gap 1 lw 2
set style fill solid border -1
#set grid ytics
set title ''
set boxwidth 0.9
#set ytics (1, 30, 60, 90, 120, 150, 165)
set tics font "Times-Roman, 24"
set yrange [0:*]
set key right bottom spacing 2.5 font "Times-Roman, 24"
set key autotitle columnheader
#set logscale y 2
#set key left bmargin font "Time-Roman, 20"
#set key left top at -0.7,1195
#set key font "Times-Roman, 26" spacing 2.4 width .5 height 0.75 Right
#set key bmargin Left reverse noenhanced autotitles columnhead nobox
set bmargin at screen 0.10
set key right top# at -0.9,1155
#unset xtics

set size 1,0.5
plot "perf-results.dat" using 2:3:xticlabels(1) w histogram title "without changes",\
	 "perf-results.dat" using 4:5:xticlabels(1) w histogram title "with changes",\
