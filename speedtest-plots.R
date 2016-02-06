# R script to complement the speedtest-csv script
# Will generate dot plots and histograms for download and upload speed, as well as ping over time

# load the data
speedtest <- read.csv("speedtest.log", header = TRUE, sep = ";")

# prepare the variables
starttime <- as.POSIXlt(speedtest$start)
downloadspeed <- as.numeric(gsub(" Mbit/s", "", speedtest$download))
uploadspeed <- as.numeric(gsub(" Mbit/s", "", speedtest$upload))
ping <- as.numeric(gsub(" ms", "", speedtest$server_ping))

# plots
plot(starttime, downloadspeed) # download speed over time
plot(starttime, uploadspeed)   # upload speed over time
plot(starttime, ping)          # ping over time

hist(downloadspeed, breaks=25)
hist(uploadspeed, breaks=10)
hist(ping, breaks=20)
