# speedtest-cli-extras

[![Join the chat at https://gitter.im/normcyr/speedtest-cli-extras](https://badges.gitter.im/normcyr/speedtest-cli-extras.svg)](https://gitter.im/normcyr/speedtest-cli-extras?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This repository contains tools that enhance the [speedtest-cli] command-line interface to [speedtest.net].

## speedtest-csv

The `speedtest-csv` bash script calls `speedtest-cli`, captures its output, reformats it, and outputs it on a single line with time stamps and values separated by _semicolons_<sup>*</sup>, e.g.
```
$ speedtest-csv
2014-09-06 10:07:51;2014-09-06 10:09:31;Comcast Cable;73.162.87.38;AT&T (San Francisco, CA);20.22 km;24.536 ms;44.25 Mbits/s;4.93 Mbits/s;http://www.speedtest.net/result/3741180214.png
```
To generate column names, do
```
$ speedtest-csv --header
start;stop;from;from_ip;server;server_dist;server_ping;download;upload;share_url
```
_Footnotes:_  
(*) Commas are not safe to use to separate the values, because some test servers report speeds with commas instead of periods.  Because of this, semicolons are used instead.

## speedtest-plots.R

It is always nice to be able to visualize collected data. Download and upload speeds are no exception. The `speedtest-plots.R` is a R script that will generate plots and histograms of the collected data over time.

It assumes that the `speedtest.log` file has the standard headers as the first line of the log file (you used the `--header` option). You actually need them as the first line of the log file in order for the script to work.

You will also need to modify the script slightly in order to point to the path of your log file (see line 6). 

Example plot generated with the script:

![Download Speed over time](http://normcyr.github.io/download-speed.svg)


[speedtest-cli]: https://github.com/sivel/speedtest-cli
[speedtest.net]: http://www.speedtest.net/
