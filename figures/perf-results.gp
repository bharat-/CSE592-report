set terminal postscript eps enhanced color
set size 1, 0.5
set output "social-result_arvind.eps"
#set output "social-result_arvind_kmeans.eps"
set boxwidth 0.9
set key font "Times-Roman, 22" spacing 2.4 width .5 height 0.75 Right
set key left

set style data histograms
set style histogram rowstacked
set boxwidth 0.5 relative
set style fill solid 1.0 border -1
set yrange [:1.4]
set ylabel "Accuracy (in %)" font "Times-Roman, 26"
set xlabel "Algorithm" font "Times-Roman, 26" # offset -0.5,0
#set xlabel "Varying K in K-means" font "Times-Roman, 26" # offset -0.5,0
set datafile separator " "
set key right top

plot 'arvind_plot.dat' using 2 t "Correct", '' using 3:xtic(1) t "In-correct"
#plot 'arvind_plot_kmeans.dat' using 2 t "Correct", '' using 3:xtic(1) t "In-correct"

