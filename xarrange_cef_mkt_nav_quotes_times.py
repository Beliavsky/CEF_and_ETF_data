# 03/18/2020 08:03 PM added market and NAV times
# 03/18/2020 07:23 PM branched from xarrange_cef_mkt_nav_quotes.py to xarrange_cef_mkt_nav_quotes_times.py
# 03/18/2020 08:20 AM computes and prints premium
# process a file with lines such as these, produced by rterm < xget_quotes_pimco_cefs.r
# Trade Time  Last     Change   % Change  Open    High   Low
# PCI   2020-03-12 16:02:11 19.41 -2.7399998 -12.370203 20.46 20.5000 18.10
# XPCIX 2020-03-12 20:00:29 20.53 -0.8700000  -4.065420    NA      NA    NA
# PDI   2020-03-12 16:02:00 23.91 -3.2800007 -12.063261 21.10 25.6800 21.00
# XPDIX 2020-03-12 20:01:27 24.53 -0.8700000  -3.425197    NA      NA    NA
from sys import argv
import datetime
infile = argv[1]
# infile = "cef_mkt_nav_quotes.txt"
fp = open(infile,"r")
iline = 0
COL_PCT   = 5
COL_CLOSE = 3
PRINT_NAV_SYM = False
PRINT_WHETHER_INTRADAY = False
fp.readline()
fmt_sym = "%5s"
now = datetime.datetime.now()
intraday = now.hour < 20 and now.hour > 8
if PRINT_WHETHER_INTRADAY:
    print("intraday =",intraday)
if intraday:
    print("  sym","".join("%9s"%_ for _ in ["mkt_ret","NAV_ret","premium","mkt","NAV"]),end="")
else:
    print("  sym","".join("%9s"%_ for _ in ["mkt_ret","NAV_ret","diff","premium","mkt","NAV"]),end="")
print("".join("%12s"%_ for _ in ["mkt_time","nav_time"]))
fmt_r=" %8.2f"
for line in fp:
    if ("Volume" in line):
        break
    text = line.strip()
    words = text.split()
    xret = float(words[COL_PCT])
    last = float(words[COL_CLOSE])
    num_str = "%8s"%'{0:.2f}'.format(xret)
    date_str   = words[1][5:] # trim the year at the beginnning
    time_str   = words[2][:-3]
    quote_time = date_str + "@" + time_str
    if (iline%2 == 0):
        print(fmt_sym%words[0],num_str,end=" ")
        close_last = last
        mkt_ret    = xret
        mkt_time   = quote_time
    else:
        nav_last = last
        nav_ret  = xret
        nav_time = quote_time
        diff_ret = mkt_ret - nav_ret
        if PRINT_NAV_SYM:
            print(fmt_sym%words[0],num_str,end=" ")
        else:
            print(num_str,end=" ")
        prem = (100*(close_last-nav_last)/nav_last)
        if intraday:
            print("".join(fmt_r%_ for _ in [prem,close_last,nav_last]),end=" ")
        else:
            print("".join(fmt_r%_ for _ in [diff_ret,prem,close_last,nav_last]),end=" ")
        print(mkt_time,nav_time)
    iline = iline + 1
