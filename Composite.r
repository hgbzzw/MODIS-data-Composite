rm(list = ls())
library(raster)
library(lubridate)
library(zoo)

s1 <- stack('D:/VIP/test/MOD13A2_2010.img')
s2 <- stack('D:/VIP/test//MOD13A2_2011.img')

s <- stack(s1,s2)
s[s < 500] <- NA

tm <- seq(as.Date('2010-01-01'), as.Date('2011-12-31'), by = 16)
s <- setZ(s,tm,name = '16-day')

yearmonthM <- zApply(s,by = as.yearmon, fun = mean,na.rm = TRUE)
monthM <- zApply(s,by = month, fun = mean,na.rm = TRUE)
yearqtrM <- zApply(s, by = as.yearqtr, fun = mean,na.rm = TRUE)
qtrM <- zApply(s,by = quarter,fun = mean,na.rm = TRUE)
yearM <- zApply(s,by = year, fun = mean,na.rm = TRUE)

writeRaster(yearmonthM,filename = 'F:/VIP/composite/yearmonthM.tif',format = 'GTiff',overwrite = TRUE)
writeRaster(monthM,filename = 'F:/VIP/composite/monthM.tif',format = 'GTiff',overwrite = TRUE)
writeRaster(yearqtrM,filename = 'F:/VIP/composite/yearqtrM.tif',format = 'GTiff',overwrite = TRUE)
writeRaster(qtrM,filename = 'F:/VIP/composite/qtrM.tif',format = 'GTiff',overwrite = TRUE)
writeRaster(yearM,filename = 'F:/VIP/composite/yearM.tif',format = 'GTiff',overwrite = TRUE)
