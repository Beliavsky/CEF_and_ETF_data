# added mean and median to table of data
# 05/26/2020 11:25 AM branched from xread_table_summarize.r to xcef_table_summarize.r
options(width=1000)
debug = FALSE
round_df <- function(df,digits=0) return(rapply(object = df, f = round, classes = "numeric", how = "replace", digits = digits))
infile = "temp_cef_table.txt" # "cef_table.txt" # "cef_table_small.txt"  # "small_table.txt"
xx = read.table(infile,header=TRUE,stringsAsFactors = FALSE)
imedian = nrow(xx) + 1
xx[imedian,] = suppressWarnings(sapply(xx,median))
xx[imedian,1] = "med"
imean = nrow(xx) + 1
if (debug) {
	xx[imean,] = sapply(xx,mean)
} else {
	xx[imean,] = suppressWarnings(sapply(xx,mean))
}
xx[imean,1] = "mean"
print(round_df(xx,2),row.names=FALSE)
