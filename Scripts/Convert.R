#obtaining the path to the current directory
project_dir <- dirname(rstudioapi :: getSourceEditorContext()$path)

#setting working directory as "Scripts" - all the calls will be done relatively to this directory
setwd(project_dir)

#import raw data
df <- read.csv(file = "../Data/data.csv", header = TRUE, sep = "\t")

#Converting raw dataframe to more usable format by scoring each submission
mach <- (df$M1 + df$M2 + df$M3 + df$M4 + df$M5 + df$M6 + df$M7 + df$M8 + df$M9)/9
narc <- (df$N1 - df$N2 + df$N3 + df$N4 + df$N5 - df$N6 + df$N7 - df$N8 + df$N9)/9
psyc <- (df$P1 - df$P2 + df$P3 + df$P4 + df$P5 + df$P6 - df$P7 + df$P8 + df$P9)/9

df1 <- data.frame(mach, narc, psyc, df$country)
write.csv(df1, "../Data/df1.csv", row.names = TRUE)


#Machiavellianism by country
mean_M <- tapply(df1$mach, df1$df.country, mean)
median_M <- tapply(df1$mach, df1$df.country, median)
max_M <- tapply(df1$mach, df1$df.country, max)
min_M <- tapply(df1$mach, df1$df.country, min)
n_M <- dplyr :: count(df1,df1$df.country)

machcountry <- data.frame(dplyr::slice(n_M, rows = 1:143), mean_M, median_M, max_M, min_M)

write.csv(machcountry, "../Data/Mach_Country.csv")

#Narcissism by country
mean_N <- tapply(as.vector(df1$narc), df1$df.country, mean)
median_N <- tapply(df1$narc, df1$df.country, median)
max_N <- tapply(as.vector(df1$narc), df1$df.country, max)
min_N <- tapply(as.vector(df1$narc), df1$df.country, min)
n_N <- dplyr :: count(df1, df1$df.country)

narccountry <- data.frame(dplyr::slice(n_M, rows = 1:143), mean_N, median_N, max_N, min_N)

write.csv(narccountry, "../Data/Narc_Country.csv")

#Psychopathy by country
mean_P <- tapply(df1$psyc, df1$df.country, mean)
median_P <- tapply(df1$psyc, df1$df.country, median)
max_P <- tapply(df1$psyc, df1$df.country, max)
min_P <- tapply(df1$psyc, df1$df.country, min)
n_P <- dplyr :: count(df1, df1$df.country)

psyccountry <- data.frame(dplyr::slice(n_M, rows = 1:143), mean_P, median_P, max_P, min_P)

write.csv(psyccountry, "../Data/Psyc_Country.csv")
