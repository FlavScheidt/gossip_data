clear
cd /home/flav/gossip/gossip_data/

*** Stata graph scheme
net install cleanplots, from("https://tdmize.github.io/data/cleanplots")
set scheme cleanplots, perm
net install schemepack, from("https://raw.githubusercontent.com/asjadnaqvi/Stata-schemes/main/schemes/") replace
graph set window fontface "Arial Narrow"

*** Color palettes
net install palettes, replace from("https://raw.githubusercontent.com/benjann/palettes/master/")
net install colrspace, replace from("https://raw.githubusercontent.com/benjann/colrspace/master/")

insheet using dupsCompleteDataSet.csv, comma clear

//Style
// colorpalette tab Superfishel Stone
// colorpalette AliceBlue
// return list

//The graph itself
twoway	(histogram dups if type=="vanilla", discrete ///
		 freq start(1) width(1) color("239 111 106%50")  lcolor("239 111 106")) ///        
	(histogram dups if type=="general", discrete ///
		 freq start(1) width(1) color("99 136 180%50") lcolor("99 136 180")) ///   
	(histogram dups if type=="validator", discrete  ///
		  freq start(1) width(1) color("187 118 147%50") lcolor("187 118 147")) /// 
	(histogram dups if type=="unl", discrete  ///
		  freq start(1) width(1) color("85 173 137%70") lcolor("85 173 137")), /// 
       legend(order(1 "Flooding" 2 "GSub/One Topic for All" 3 "GSub/One Topic per Validator" 4 "GSub/One Topic per UNL") pos(2) ring(0) col(1) region(lcolor(gs15))) ///
       title("Frequency of Duplicated Messages Using Different Spreading Methods", size(4)) ///
       subtitle("y messages were received x times", size(3) justification(right) position(12)) /// 
       xtitle("# of duplications received", size(3)) ///
       ytitle("Frequency", size(3))
