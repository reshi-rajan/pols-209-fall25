####### Regressions Part 1 #######

### What is the first thing we have to do when we open R-Studio?

### Load our libraries
library(tidyverse)

### Disable Scientific Notation ###
options(scipen = 999)

#### Load the Data ####

### Rather than just labeling your dataframe data or dataset, change it to something
### different. 

afghanistan <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/refs/heads/Lab-Report-4/afghanschools.csv")

#### Bivariate Regression ####

### What is a regression? 

### When we do a regression in R, the most basic function to call is the lm() function
### this function is the baseline function for all regression models in R.

### To run a regression using the lm() function, you need to supply three key items:
## 1. Your y-variable or DV 
## 2. Your covariates (i.e. your IV and controls)
## 3. Your dataframe 

### Any time we have a regression of the form y = mx + b or y = b_0 + b_1*X + e
### we must write this as: y ~ x, this applies especially with the lm() function.

### We write something of the form: lm(outcome ~ predictor1 + predictor2 + ...)
### The tilde, ~ , denotes an equation in R with the left-hand side being the 
### outcome and the right-hand side being the predictor(s).

### Unlike when we do descriptive statistics, with the lm() function we do not
### use the form: dataframe$variable, instead we just use variable and supply 
### the dataframe at the end. 

### In R, a complete code for an lm() function looks like the following: 
### regression <- lm(outcome ~ predictor1 + predictor 2 + ..., data = dataframe)

### Here we store our results as regression. 

### We want to understand the relationship between treatment and testscores
### but first, let's plot the data: 

afghanistan |>
  ggplot(mapping = aes(x=treatment)) + 
  geom_histogram(bins = 50, 
                 fill = 'maroon', color = 'black') + 
  theme_bw()

### What kind of variable is this?

afghanistan |>
  ggplot(mapping = aes(x=testscores)) + 
  geom_histogram(bins = 50, 
                 fill = 'maroon', color = 'black') + 
  theme_bw()

### What kind of variable is this?

afghanistan |>
  ggplot(mapping = aes(x=treatment, y=testscores))+
  geom_point() + 
  theme_bw()

### Do you see a relationship here?

##### Try It #####
### Using the syntax outlined above and the data we have loaded, 
### estimate a relationship where treatment predicts testscore. Label this 
### regression Model1


#### The Summary Function ####
### Running the line above does not give us much information on our regression,
### it just stores our results in the global environment, to actually read our data
### we use the summary function below:

summary(Model1)

### Run the summary function. 

### Running the summary function should produce a list of results starting with:

#>  Call:
#> lm(formula = y ~ x, data = dataframe)

### THE MOST IMPORTANT PART OF THIS TABLE IS THE COEFFICIENTS!

### If you look at the coefficients portion, you should see as rows: 
## 1. The Intercept
## 2. The covariates 

### As columns, you will ALWAYS see: 
## 1. Estimate (this is an estimate of your beta coefficent, aka the slope)
## 2. Std. Error (this is the standard error or how far off our slope could be)
## 3. t value (this is the estimate divided by the standard error)
## 4. Pr(>|t|) (this is the p-value we are interested in)

### In addition, underneath the coefficents and significance codes you will the 
### R-Squared and Adjusted R-Squared Values, they tell us how good our model is 
### at fitting our data (how good does movement in X predict movement in Y).

#### Multi-Variate Regressions ####
### As in the lab report, sometimes we want to control for things. Why? 


##### Try It #####
### Estimate a new model like Model1, but this time controlling for age, sheep, 
### duration village, education head, number ppl hh, distance nearest school.

### Call this Model2

### Run the summary() Function

summary(Model2)

#### Interpreting Regression Models ####

### To interpret coefficients, we can use a "standard formula" like the following:

### For a one-unit increase in X, there is a xxx-unit increase in Y, all else equal.

### To see if these results are statistically significant we look at the p-values,
### luckily for us, the summary() function also gives us stars.

### A general trick is the more stars you have, the more statistically significant
### our results are. 

##### Model Fit #####
### If we are comparing across 2 or more models and want to see which model
### best fits our data, we look at the R-Squared. 

### The R-Squared value that is highest (i.e. closer to 100%) 
### is the better fit model.