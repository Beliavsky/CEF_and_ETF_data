# reformat quotes
infile = "etf_quotes.txt"
# infile has lines such as
#         %Change         OC     range           TradeTime
# SPY  0.12541923 -1.2404646 1.4588629 2020-04-28 10:45:40
# HYG -0.08265825 -0.6260276 0.7256525 2020-04-28 10:45:40
fp = open(infile,"r")
fp.readline()
fmt_s = "%10s"
print(" sym",end="")
for foo in ["ret","OC","range","Last","time","date"]:
    print(fmt_s%foo,end="")
print()
for text in fp:
    text = text.rstrip()
    words = text.split()
    print("%4s"%words[0],end="")
    for i in range(1,5):
        print("%10.2f"%float(words[i]),end="")
    print(" ",fmt_s%words[9],fmt_s%words[8])

    