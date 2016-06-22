install.packages("rjson")
install.packages("data.table")

library(rjson)
library(plyr)

file <- read.table("/home/thatsokye/foreign/txt_2/oCountry_Status_2012.txt",header=TRUE, sep="\t")

oCountry_Status_list <- as.character(file$'시군구')

typeof(oCountry_Status_list)
oCountry_Status_df = data.frame(oCountry_Status_list,stringsAsFactors = FALSE)
oCountry_Status_df$oCountry_Status_list = enc2utf8(oCountry_Status_df$oCountry_Status_list)
oCountry_Status_lonlat = mutate_geocode(oCountry_Status_df, oCountry_Status_list, source='google')
file$lon <- oCountry_Status_lonlat$lon
file$lat <- oCountry_Status_lonlat$lat
oCountry_Status_lonlat <- file



oCountry_Status_lonlat <- oCountry_Status_lonlat2012




###############도별######################
result_lonlat <- subset(oCountry_Status_lonlat,oCountry_Status_lonlat$'시도'==c('충청남도'))

arrange(result_lonlat, 총계)         # Use arrange from plyr package
result_lonlat[ order(result_lonlat$총계, decreasing=TRUE), ]  # Use built-in R functions

summ <- summary(result_lonlat$총계)

south_korea_lonlat = unlist(geocode('서귀포시',source='google'))
south_korea_map <- qmap(south_korea_lonlat, zoom = 11, source='google', maptype = 'roadmap', language='KR')
south_korea_map +
  geom_point(data = result_lonlat,
             aes(x=lon, y=lat, size=총계, colour =summ), color='black', alpha = .7) +
  scale_size("New legend",breaks=summ,labels=summ) + 
  ggtitle("외국인 거주자 지역별 인구수")
  #geom_text(data=result_lonlat, aes(x=lon, y=lat, label=시군구), color='red')




###############시도별######################
result_lonlat <- ddply(oCountry_Status_lonlat, c('시도'), summarise,
               '총계' = sum(총계, na.rm=TRUE),
               lon = mean(lon, na.rm=TRUE),
               lat = mean(lat, na.rm=TRUE)
)

arrange(result_lonlat, 총계)         # Use arrange from plyr package
result_lonlat[ order(result_lonlat$총계, decreasing=TRUE), ]  # Use built-in R functions

summ <- summary(result_lonlat$총계)

south_korea_lonlat = unlist(geocode('south_korea',source='google'))
south_korea_map <- qmap(south_korea_lonlat, zoom = 7, source='google', maptype = 'roadmap', language='KR')
south_korea_map +
  geom_point(data = result_lonlat,
             aes(x=lon, y=lat, size=총계, colour=시도), color='black', alpha = .7) +
  ggtitle("외국인 거주자 도별 인구수")
geom_text(data=result_lonlat, aes(x=lon, y=lat, label=시도), color='red', size=3)






###############전체######################
result_lonlat <- oCountry_Status_lonlat

arrange(result_lonlat, 총계)         # Use arrange from plyr package
result_lonlat[ order(result_lonlat$총계, decreasing=TRUE), ]  # Use built-in R functions

summ <- summary(result_lonlat$총계)

south_korea_lonlat = unlist(geocode('south_korea',source='google'))
south_korea_map <- qmap(south_korea_lonlat, zoom = 7, source='google', maptype = 'roadmap', language='KR')
south_korea_map +
  geom_point(data = result_lonlat,
             aes(x=lon, y=lat, size=총계), color='black', alpha = .7)
  ggtitle("외국인 거주자 지역별 인구수")














library(ggmap)
geocode('Korea', source = 'google')

# qmap('seoul', zoom = 11, maptype = 'roadmap', color = 'bw')


install.packages('ggmap')
library(ggmap)
geocode(‘Korea’, source = ‘google’)


station_list = c('시청역','을지로입구역','을지로3가역','을지로4가역','동대문사문공원역','신촌역')
station_df = data.frame(station_list,stringsAsFactors = FALSE)
station_df$station_list = enc2utf8(station_df$station_list)
station_lonlat = mutate_geocode(station_df, station_list, source='google')


seoul_lonlat = unlist(geocode('용인시 기흥구',source='google'))
seoul_map <- qmap(seoul_lonlat, zoom = 11, source='stamen', maptype = 'toner', color = 'bw')
seoul_map +
  geom_point(data = station_lonlat,
             aes(x=lon, y=lat),
             colour = 'green',
             size =4)






south_korea_lonlat = unlist(geocode('South Korea',source='google'))
south_korea_map <- qmap(south_korea_lonlat, zoom = 7, source='google', maptype = 'roadmap', color = 'bw', language='KR')
south_korea_map +
  geom_point(data = station_lonlat,
             aes(x=lon, y=lat),
             colour = 'green',
             size =1)



