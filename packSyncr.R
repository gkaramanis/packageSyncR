# get list of installed packages in this machine
ip = as.data.frame(installed.packages())
ip2 = ip[is.na(ip$Priority),, drop = FALSE]

nodename <- Sys.info()["nodename"]
filename <- paste(nodename, ".csv", sep = "")
# write.csv(ip2, filename)

# read in packages from list
lp <- read.csv("/Users/Georgios/Desktop/packages.csv")

# find packages in list not installed in this machine
ni <- setdiff(lp$Packages, ip2$Package)
ni

#install missing packages
for (i in ni){
  cm <- paste("install.packages(\'", i, "\')", sep = "")
  eval(parse(text = cm))
}
