library(ggplot2)
library(corrplot)
library(ggpubr)

#Correlation
jpeg("../Plots/corrplot.jpg", width = 800, height = 600) # Opening new jpeg file

cormatrix <- cor(data.frame(df1$mach,df1$narc, df1$psyc))
corrplot(cormatrix, method="color",
         type="upper",
         addCoef.col = "black",
         tl.col="black", tl.srt=0,
         sig.level = 0.01 )

dev.off() #closing the file




#Histogram

   #Machiavellianism
jpeg("../Plots/mach_hist.jpg", width = 880, height = 600)

ggplot(df1, aes(x = mach)) + 
  geom_histogram(binwidth = 0.11, color = "white", fill = "pink") +
  geom_vline(aes(xintercept = mean(mach), color = "mean"), size = 1.5) +
  geom_vline(aes(xintercept = median(mach), color = "median"), size = 1.5) + 
  theme_light() +
  theme(
    plot.title = element_text(size = 30, hjust = 0.5),
    legend.title = element_blank(),
    legend.position = c(0.1, 0.7),
    legend.text = element_text(size = 12)
        ) + 
  labs(title = "Machiavellianism", x = "Scores", y = " ")+
  stat_function(fun = dnorm, n = 101)  

dev.off()


    #Narcissism
jpeg("../Plots/narc_hist.jpg", width = 880, height = 600)

ggplot(df1, aes(x = narc)) + 
  geom_histogram(binwidth = 0.11, color = "white", fill = "yellow") +
  geom_vline(aes(xintercept = mean(narc), color = "mean"), size = 1.5) +
  geom_vline(aes(xintercept = median(narc), color = "median"), size = 1.5) + 
  theme_light() +
  theme(
    plot.title = element_text(size = 30, hjust = 0.5),
    legend.title = element_blank(),
    legend.position = c(0.1, 0.7),
    legend.text = element_text(size = 12)
  ) + 
  labs(title = "Narcissism", x = "Scores", y = " ")

dev.off()

    #Psychopathy
jpeg("../Plots/psyc.jpg", width = 880, height = 600)

ggplot(df1, aes(x = psyc)) + 
  geom_histogram(binwidth = 0.11, color = "white", fill = "purple") +
  geom_vline(aes(xintercept = mean(psyc), color = "mean"), size = 1.5) +
  geom_vline(aes(xintercept = median(psyc), color = "median"), size = 1.5) + 
  theme_light() +
  theme(
    plot.title = element_text(size = 30, hjust = 0.5),
    legend.title = element_blank(),
    legend.position = c(0.1, 0.7),
    legend.text = element_text(size = 12)
  ) + 
  labs(title = "Psychopathy", x = "Scores", y = " ")

dev.off()





#Boxplot

   #Machiavellianism
jpeg("../Plots/mach_box.jpg", width = 880, height = 600)

ggplot(df1, aes(x = mach)) +
  geom_boxplot() +
  labs(title = "Machiavellianism", x = "Scores", y = " ")+
  theme_light()+
  theme(
    plot.title = element_text(size = 30, hjust = 0.5)
    )

dev.off()

   #Narcissism
jpeg("../Plots/narc_box.jpg", width = 880, height = 600)

ggplot(df1, aes(x = narc)) +
  geom_boxplot() +
  labs(title = "Narcissism", x = "Scores", y = " ")+
  theme_light()+
  theme(
    plot.title = element_text(size = 30, hjust = 0.5)
  )

dev.off()

   #Psychopathy
jpeg("../Plots/psyc_box.jpg", width = 880, height = 600)

ggplot(df1, aes(x = psyc)) +
  geom_boxplot() +
  labs(title = "Psychopathy", x = "Scores", y = " ")+
  theme_light()+
  theme(
    plot.title = element_text(size = 30, hjust = 0.5)
  )

dev.off()





#Normality and Density Tests

    #Machiavellianism
jpeg("../Plots/mach_norm.jpg", width = 880, height = 600)

ggqqplot(df1$mach, main = "Machiavellianism")

dev.off()

    #Narcissism
jpeg("../Plots/narc_norm.jpg", width = 880, height = 600)

ggqqplot(df1$narc, main = "Narcissism")

dev.off()

    #Psychopathy
jpeg("../Plots/psyc_norm.jpg", width = 880, height = 600)

ggqqplot(df1$psyc, main = "Psychopathy")

dev.off()