mach_r <- c(mean(df1$mach), sd(df1$mach), as.numeric(shapiro.test(df1$mach[1:5000])[2]))
narc_r <- c(mean(df1$narc), sd(df1$narc), as.numeric(shapiro.test(df1$narc[1:5000])[2]))
psyc_r <- c(mean(df1$psyc), sd(df1$psyc), as.numeric(shapiro.test(df1$psyc[1:5000])[2]))

stat_df <- data.frame(rbind(mach_r, narc_r, psyc_r))

colnames(stat_df) <- c("mean", "S.D", "p.value")
rownames(stat_df) <- c("Machiavellianism", "Narcissism", "Psychopathy")

write.csv(stat_df, "Data/stat_df.csv")

summary_df <- summary(df1)
write.csv(summary_df, "Data/Summary.csv")