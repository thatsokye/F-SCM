file <- read.table("/home/thatsokye/foreign/txt_2/oCountry_Status_2012.txt",header=TRUE, sep="\t")

oCountry_Status_list <- as.character(file$'시군구')

typeof(oCountry_Status_list)
oCountry_Status_df = data.frame(oCountry_Status_list,stringsAsFactors = FALSE)
oCountry_Status_df$oCountry_Status_list = enc2utf8(oCountry_Status_df$oCountry_Status_list)
oCountry_Status_lonlat = mutate_geocode(oCountry_Status_df, oCountry_Status_list, source='google')
file$lon <- oCountry_Status_lonlat$lon
file$lat <- oCountry_Status_lonlat$lat
oCountry_Status_lonlat2012 <- file

file <- read.table("/home/thatsokye/foreign/txt_2/oCountry_Status_2013.txt",header=TRUE, sep="\t")

oCountry_Status_list <- as.character(file$'시군구')

typeof(oCountry_Status_list)
oCountry_Status_df = data.frame(oCountry_Status_list,stringsAsFactors = FALSE)
oCountry_Status_df$oCountry_Status_list = enc2utf8(oCountry_Status_df$oCountry_Status_list)
oCountry_Status_lonlat = mutate_geocode(oCountry_Status_df, oCountry_Status_list, source='google')
file$lon <- oCountry_Status_lonlat$lon
file$lat <- oCountry_Status_lonlat$lat
oCountry_Status_lonlat2013 <- file

file <- read.table("/home/thatsokye/foreign/txt_2/oCountry_Status_2014.txt",header=TRUE, sep="\t")

oCountry_Status_list <- as.character(file$'시군구')

typeof(oCountry_Status_list)
oCountry_Status_df = data.frame(oCountry_Status_list,stringsAsFactors = FALSE)
oCountry_Status_df$oCountry_Status_list = enc2utf8(oCountry_Status_df$oCountry_Status_list)
oCountry_Status_lonlat = mutate_geocode(oCountry_Status_df, oCountry_Status_list, source='google')
file$lon <- oCountry_Status_lonlat$lon
file$lat <- oCountry_Status_lonlat$lat
oCountry_Status_lonlat2014 <- file

file <- read.table("/home/thatsokye/foreign/txt_2/oCountry_Status_2015.txt",header=TRUE, sep="\t")

oCountry_Status_list <- as.character(file$'시군구')

typeof(oCountry_Status_list)
oCountry_Status_df = data.frame(oCountry_Status_list,stringsAsFactors = FALSE)
oCountry_Status_df$oCountry_Status_list = enc2utf8(oCountry_Status_df$oCountry_Status_list)
oCountry_Status_lonlat = mutate_geocode(oCountry_Status_df, oCountry_Status_list, source='google')
file$lon <- oCountry_Status_lonlat$lon
file$lat <- oCountry_Status_lonlat$lat
oCountry_Status_lonlat2015 <- file

file <- read.table("/home/thatsokye/foreign/txt_2/oCountry_Status_2016.txt",header=TRUE, sep="\t")

oCountry_Status_list <- as.character(file$'시군구')

typeof(oCountry_Status_list)
oCountry_Status_df = data.frame(oCountry_Status_list,stringsAsFactors = FALSE)
oCountry_Status_df$oCountry_Status_list = enc2utf8(oCountry_Status_df$oCountry_Status_list)
oCountry_Status_lonlat = mutate_geocode(oCountry_Status_df, oCountry_Status_list, source='google')
file$lon <- oCountry_Status_lonlat$lon
file$lat <- oCountry_Status_lonlat$lat
oCountry_Status_lonlat2016 <- file

