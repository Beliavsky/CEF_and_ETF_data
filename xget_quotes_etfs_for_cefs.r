# get quotes
options(warn=-1)
options(width=1000)
sink(file("NUL", open = "wt"),type="message")
library("quantmod")
# options(digits=2)
sink()
ret.scale = 100
x = getQuote("SPY;HYG;PFF;LQD;EMB;MUB;HYD;TLT;AMLP") # set ETF symbols
names(x) <- gsub(" ", "", names(x))
x$OC = ret.scale*(x$Last/x$Open - 1)
x$range = ret.scale*(x$High/x$Low-1)
fields = c("%Change","OC","range","Last","Open","High","Low","TradeTime")
print(subset(x, select=fields))
