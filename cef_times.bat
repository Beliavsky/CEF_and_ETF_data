:: calls R and Python scripts to create table of ETF and CEF data
setlocal
set tmpf=temp_cef_mkt_nav_quotes.txt
set outetf=etf_quotes.txt
set outf=temp_cef_table.txt
call rterm < xget_quotes_etfs_for_cefs.r > %outetf%
:: type %outetf%
:: line below processes ETF quotes
python xformat_quotes.py
echo.
call rterm < xget_quotes_cefs.r > %tmpf%
python xarrange_cef_mkt_nav_quotes_times.py %tmpf% > %outf%
rterm < xcef_table_summarize.r 
:: comment the line above and uncomment the one below if summary stats are not needed
:: type %outf%
back %tmpf%
