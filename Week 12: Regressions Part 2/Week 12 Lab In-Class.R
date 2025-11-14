####### Regressions Part 2 #######

### What is the first thing we have to do when we open R-Studio?

### Disable Scientific Notation ###
options(scipen = 999)

#### Load the Data ####
afghan <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/refs/heads/Lab-Report-4/afghanschools.csv")


#### Review: Multivariate Regression ####
### Questions: 
## 1. What is a regression? 

## 2. Why do we do multivariate regression as opposed to bivariate regression? 

## 3. What does the regression formula look like in R? 

## 4. What and How do we look for the results of the regression?

#### Interaction Terms ####
### What is an interaction term and why do we use it? 

### To interpret an interaction term requires a bit more work that a standard
### covariate. Interpretation should look something like the following: 
### For a one-unit increase in X, there is a xxx-unit increase in Y, 
### when condition Z is present (or equals 1 or occurs, etc.), all else equal.

##### Try It #####
### Produce Model3 where you include an interaction term for treatment and girl
## as well as the previous covariates from Model2.

### Load the summary of Model3 using the code below:
summary(Model3)

### How do we interpret the interaction term results? 

#### Predictions ####
### Before we do predictions, the most important thing to note is what 
### descriptive statistic we use to calculate predicted values. 

### For a continuous variable ONLY, we use the mean. For ALL ELSE, we use the median.

### The first step in generating predicted values is determining whether your variable
### is continuous or not. 

##### Try It #####
### For a boy who did NOT attend school, 
### how should we calculate our predicted value?

### Using the code below, do we need to alter anything? Where would we need to 
### alter something? 

predict(Model3, newdata = 
          data.frame(treatment = 0, girl = 0,
                     age = median(afghan$age, na.rm = T),
                     sheep = median(afghan$sheep, na.rm = T),
                     duration_village = median(afghan$duration_village, na.rm = T),
                     education_head = median(afghan$education_head, na.rm = T),
                     number_ppl_hh = median(afghan$number_ppl_hh, na.rm = T),
                     distance_nearest_school = median(afghan$distance_nearest_school, na.rm = T)))

### What about for a girl who went to school?
predict(Model3, newdata = 
          data.frame(treatment = 0, girl = 0,
                     age = median(afghan$age, na.rm = T),
                     sheep = median(afghan$sheep, na.rm = T),
                     duration_village = median(afghan$duration_village, na.rm = T),
                     education_head = median(afghan$education_head, na.rm = T),
                     number_ppl_hh = median(afghan$number_ppl_hh, na.rm = T),
                     distance_nearest_school = median(afghan$distance_nearest_school, na.rm = T)))

#### Stargazer ####
### Stargazer is a package in R that generates really nice, professional, publishable
### tables that you can use. 

### Installing Stargazer
## To install stargazer, use the following code: 
install.packages('stargazer')

## Then run the following line:
library(stargazer)

### To make a nice publishable-ready table that includes all 3 models, we can
### use the following command: 

stargazer(Model1, Model2, Model3, type = "text", 
          title = "Schooling in Afghanistan", 
          covariate.labels = c("School attendance",
                               "Girl",
                               "Age",
                               "# of sheep",
                               "Duration in village",
                               "Education level of parent",
                               "# of people in household",
                               "Distance to school",
                               "School attendance * Girl"), 
          dep.var.labels = "Test Scores")