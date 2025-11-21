####### Week 13: Logistic Regression #######

### What is the first thing we have to do when we open R-Studio?

### Disable Scientific Notation ###
options(scipen = 999)

#### Load the Data ####

beliefs <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/Lab-Report-5/nov18survey.csv")

#### Logit Models ####
### 1.When should we use a logit model over a "regular" regression> 

### 2.What is the key difference between a regular regression and a logit model? 

#### Estimating a Logit Model ####
### To estimate the relationship between the variable hardtorelate and age,
### we can use the logit model below: 
Model1 <- glm(hardtorelate ~ age, 
              data = beliefs, family = 'binomial')
summary(Model1)
###### Try It ######
### Estimate Model2 where you add the following controls: 
### democrat, republican, gender, ideo5, educ

### Looking at the regression table: 
summary(Model2)

### How do we know what variables are statistically significant in this model? 

#### Interpreting Logit Models ####
### From class, how are we able to interpret logit model coefficients? 

### What are the rules regarding estimate signs?

##### Try It #####
### NOTE: To exponentiate in R, we have to use the exp() function

### If the odds ratio < 1, the probability Y=1 decreases (with a 1 unit increase in X), 
### if the odds ratio > 1, the probability Y=1 increases (with a 1 unit increase in X).

#### Predicted Probabilities ####

### Before we use the predict function, we need to gather the information
### of interest from the variables.

### Specifically, we need: 
### Age to be 35
### Education to be High School
### Ideology to be Moderate
### Gender to be Male
### Democrat to be True

### Once we have this information, we can calculate 
# the predicted probability Y=1 using the following code:

### How do we do this with the following: 
predict(Model2,
        data.frame(age = ,
                   educ = ,
                   ideo5 = ,
                   gender = ,
                   democrat =),
        type = "response" )

### To interpret this predicted probability, we say that:
### "the predicted probability of being hard to relate is xx percent"

#### Extra Fun Code ####
### Sometimes we like to convey our predicted probabilities 
### using predicted probability plots: 
# install.packages('marginaleffects')

library(tidyverse)
library(marginaleffects)

pred_probs <- avg_predictions(Model2, variables = 'age', type = 'response')

pred_probs |>
  ggplot(mapping = aes(x=estimate, y=age)) +
  geom_point() + 
  geom_pointrange(mapping = aes(xmin = conf.low, xmax = conf.high)) + 
  theme_bw() + 
  xlab('Predicted Probability') + 
  ylab('Age')
