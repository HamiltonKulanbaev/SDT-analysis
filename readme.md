
# Short Dark Triad: 27-item questionairre results.



### What is a Dark Triad?

The dark triad personality traits are three closely related yet independent personality traits that all have a somewhat **malevolent connotation**. The three traits are *machiavellianism* (a manipulative attitude), *narcissism* (excessive self-love), and *psychopathy* (lack of empathy).

### How data was collected?

This data was collected with an interactive version of the Short Dark Triad (see Paulhus, D. L., & Jones, D. N. (2011, January). Introducing a short measure of the Dark Triad. Poster presented at the meeting of the Society for Personality and Social Psychology, San Antonio.).

Only participants who indicated that their answers were accurate and agreed to allow their data to be used for research are included.

>The following items were rated on a five point scale with the labels: >1=disagree, 3=neutral, 5=agree

* **M1**	It's not wise to tell your secrets.

* **M2**	I like to use clever manipulation to get my way.

* **M3**	Whatever it takes, you must get the important people on your side. 

* **M4**	Avoid direct conflict with others because they may be useful in the future. 

* **M5**	It's wise to keep track of information that you can use against people later. 

* **M6**	You should wait for the right time to get back at people. 

* **M7**	There are things you should hide from other people because they don't need to know.

* **M8**	Make sure your plans benefit you, not others.

* **M9**	Most people can be manipulated.

* **N1**	People see me as a natural leader. 

* **N2**	I hate being the center of attention.

* **N3**	Many group activities tend to be dull without me.  

* **N4**	I know that I am special because everyone keeps telling me so. 

* **N5**	I like to get acquainted with important people. 

* **N6**	I feel embarrassed if someone compliments me.

* **N7**	I have been compared to famous people. 

* **N8**	I am an average person.

* **N9**	I insist on getting the respect I deserve.

* **P1**	I like to get revenge on authorities.

* **P2**	I avoid dangerous situations.

* **P3**	Payback needs to be quick and nasty. 

* **P4**	People often say I'm out of control. 

* **P5**	It's true that I can be mean to others. 

* **P6**	People who mess with me always regret it.

* **P7**	I have never gotten into trouble with the law.

* **P8**	I enjoy having sex with people I hardly know 

* **P9**	I'll say anything to get what I want.

The geography was determined using **MaxMind GeoLite**

# Process
>The working directory for project is set for directory `project/Scripts`. In case you want to manually run the scripts, start with `Convert.R`

## Modifying raw data

The collected data is stored in a file `../Data/data.csv`.

At this point the raw data is not comfortable for analysis, therefore we will modify it. `Convert.R` file contains scripts used to modify the data.

According to the trait and question, the value of each column was added or substracted using the code below

	mach <- df$M1 + df$M2 + df$M3 + df$M4 + df$M5 + df$M6 + df$M7 + df$M8 + df$M9
	narc <- df$N1 - df$N2 + df$N3 + df$N4 + df$N5 - df$N6 + df$N7 - df$N8 + df$N9
	psyc <- df$P1 - df$P2 + df$P3 + df$P4 + df$P5 + df$P6 - df$P7 + df$P8 + df$P9

and using function 

`df1 <- data.frame(mach, narc, psyc, df$country)` 

the dataframe containing individual scores of Machiavellianism, Psychopathy, Narcissisn and Country code was created.

	"","mach","narc","psyc","df.country"
	"1",35,6,16,"GB"
	"2",20,-4,11,"US"
	"3",29,-4,8,"US"
	"4",44,27,22,"GB"
	"5",34,10,10,"GB"
## Stats for each country by trait.
	mean_M <- tapply(df1$mach, df1$df.country, mean)
	median_M <- tapply(df1$mach, df1$df.country, median)
	max_M <- tapply(df1$mach, df1$df.country, max)
	min_M <- tapply(df1$mach, df1$df.country, min)
	n_M <- count(df1$df.country)
	machcountry <- data.frame(dplyr::slice(n_M, rows = 1:143), mean_M, median_M, max_M, min_M)

Using `tapply()` and `slice()` from `dplyr`, I obtained the stats for each country. The stats include:

* mean
* median
* frequency of country
* max and min

## Graphs and Plots

For graphical representation of the data following packages were used:

* `ggplot2`  - to create histogram and boxplots
* `corrplot` - to create correlation plots
* `ggpubr`   to create density and normality plots

For full scripts look at `graphics.R` file.

All the plots are in the folder named `../Plots`. Using method `jpeg()` and `dev.off()` all the plots are automatically exported to the mentioned folder.

# Summary


The scriptfile `sd.R` contains scripts used for deriving the summary of the data. Using methods `mean()`, `sd()`, `shapiro.test` the following values were derived:

| |mean|S.D|p-value|
|:-|-:|-:|-:|
|**Machiavillianism**|  3.705670|   0.790962|   1.391086e-32|
|**Narcissism**|   1.067612|   0.7688546|   1.735834e-12|
|**Psychopathy**|   1.480150|   0.8077897|   1.793037e-14|

All the p-values are far below the 0.05, which indicates that all the collected data is significant. `mean` and `S.D` values can be used in further researches to determine the percentiles of new submissions.

`../Data/Summary.csv` was created using function `summary()` and contains the basic analysis(mean, median, frequency and etc) of dataframe `../Data/df1.csv`, which contains the scores for each submission.
