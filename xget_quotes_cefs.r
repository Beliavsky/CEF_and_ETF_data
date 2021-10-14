# 10/14/2021 11:35 AM added more CEFs
# 05/16/2020 07:33 AM added taxable munis, convertibles, world bonds
# 05/15/2020 10:15 PM added loan CEFs
# 05/15/2020 10:04 PM added corporate bond CEFs
options(warn=-1)
options(width=10000)
sink(file("NUL", open = "wt"),type="message")
library("quantmod")
sink()
symbols = c("PDO","XPDOX","PCI","XPCIX","PDI","XPDIX","PFL","XPFLX","PCM","XPCMX","PCN","XPCNX","PFN","XPFNX",
	"PHK","XPHKX","PKO","XPKOX","PTY","XPTYX","RCS","XRCSX", # PIMCO taxable
	"DSL","XDSLX","DBL","XDBLX", # DoubleLine taxable
	"DMO","XDMOX",
	"BIT","XBITX","BLW","XBLWX", # BlackRock taxable
	"NEA","XNEAX","NAD","XNADX","NVG","XNVGX","NZF","XNZFX","NMZ","XNMZX", # muni
	"HPI","XHPIX","JPS","XJPSX","RNP","XRNPX","DFP","XDFPX","FPF","XFPFX","LDP","XLDPX","PDT","XPDTX",
	"HPF","XHPFX","HPS","XHPSX","FFC","XFFCX",
	"FLC","XFLCX","PFD","XPFDX","PFO","XPFOX","JPI","XJPIX","JPC","XJPCX","JPT","XJPTX", # preferred
	"UTF","XUTFX","UTG","XUTGX","BGR","XBGRX","NRGX","XNRGX", # utility and MLP
	"HYT","XHYTX","AWF","XAWFX","HIO","XHIOX","GHY","XGHYX","KIO","XKIOX","ISD","XISDX", # high yield
	"BGB","XBGBX","FRA","XFRAX","JFR","XJFRX","JRO","XJROX","JQC","XJQCX","VTA","XVTAX","VVR","XVVRX", # loan
	"BTZ","XBTZX","BHK","XBHKX","BKT","XBKTX","IGI","XIGIX","PIM","XPIMX","VBF","XVBFX", # investment grade
	"BBN","XBBNX","GBAB","XGBAX","NBB","XNBBX", # taxable muni
	"AVK","XAVKX","CCD","XCCDX","CHI","XCHIX","CHY","XCHYX","NCV","XNCVX","NCZ","XNCZX", # convertible
	"EMD","XEMDX","FAX","XFAPX","GIM","XGIMX","TEI","XTEIX", # world bond
	"XFLT","XFLTX",
	"CSQ","XCSQX",
	"FOF","XFOFX")
symstr = paste(symbols,collapse=";")
# cat("\n",symstr,"\n")
getQuote(symstr)
