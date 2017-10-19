library(tidyverse)
library(janitor)
library(Amelia)
library(mice)
library(car)
library(haven)

IDS_2015_unflipped_Oct_25 <- read_sav("C:/Users/bc1256/Desktop/Forgiveness Stuff/IDS 2015/DATA/IDS_2015_unflipped Oct 25.sav")

forgive_unclean <- IDS_2015_unflipped_Oct_25 %>% janitor::clean_names()

## item recode
forgive_recode6 <- c("a_q42" ,"a_q45","a_q48","a_q49","a_q50","a_q52","a_q53","a_q54","a_q56","a_q60","a_q22","a_q23","a_q24",
                     "a_q26" ,"a_q29","a_q31","a_q33","a_q34_act", "a_q36","a_q39","a_q1" ,"a_q2" ,"a_q3" ,"a_q6", "a_q8", 
                     "a_q9"  , "a_q12","a_q13","a_q15","a_q18","b_q42","b_q45","b_q48","b_q49","b_q50","b_q52","b_q53",
                     "b_q54" ,"b_q56","b_q60","b_q22","b_q23","b_q24","b_q26","b_q29","b_q31","b_q33","b_q34_act"  ,
                     "b_q36" ,"b_q39","b_q1" ,"b_q2" ,"b_q3" ,"b_q6", "b_q8", "b_q9", "b_q12","b_q13","b_q15","b_q18")

forgive_unclean[forgive_recode6] <- Recode(unlist(forgive_unclean[forgive_recode6]),'1=6;2=5;3=4;4=3;5=2;6=1')

forgive_recode5 <- c("a_c21", "a_c24", "a_c02", "a_c07", "a_c12y", "a_c16", "a_c20", "a_c04y", "a_c06", "a_c17", 
                     "a_c09", "a_c10", "a_c13", "b_c21", "b_c24", "b_c02", "b_c07", "b_c12y", "b_c16", "b_c20", 
                     "b_c04y", "b_c06", "b_c17", "b_c09", "b_c10", "b_c13")

forgive_unclean[forgive_recode5] <- Recode(unlist(forgive_unclean[forgive_recode5]),'1=5;2=4;;4=2;5=1')

mean(is.na(forgive_unclean))
missmap(forgive_unclean)
imputest1 <- forgive_unclean %>% mice(m = 1, maxit = 1, method = 'pmm', seed = 420) %>% complete()
imputest2 <- imputest1 %>% mice(m = 1, maxit = 1, method = 'pmm', seed = 420) %>% complete()
missmap(imputest1)

Rforgive_1    = select(imputest1 , a_c04y , a_c05 , a_c06  , a_c18)
Rremorse_1    = select(imputest1 , a_c02  , a_c07 , a_c12y , a_c16 , a_c20)
Rempathy_1    = select(imputest1 , a_c11  , a_c15 , a_c17  , a_c19 , a_c23)
Ranger_1      = select(imputest1 , a_c09  , a_c10 , a_c13  , a_c14 , a_c22)
Rstability_1  = select(imputest1 , a_c01  , a_c03 , a_c08  , a_c21 , a_c24)
Rforgive_2    = select(imputest1 , b_c04y , b_c05 , b_c06  , b_c18)
Rremorse_2    = select(imputest1 , b_c02  , b_c07 , b_c12y , b_c16 , b_c20)
Rempathy_2    = select(imputest1 , b_c11  , b_c15 , b_c17  , b_c19 , b_c23)
Ranger_2      = select(imputest1 , b_c09  , b_c10 , b_c13  , b_c14 , b_c22)
Rstability_2  = select(imputest1 , b_c01  , b_c03 , b_c08  , b_c21 , b_c24)

agogo <- imputest1 %>%
  mutate(forgive_1    = (a_c04y + a_c05 + a_c06  + a_c18)/4,
         remorse_1    = (a_c02  + a_c07 + a_c12y + a_c16 + a_c20)/5,
         empathy_1    = (a_c11  + a_c15 + a_c17  + a_c19 + a_c23)/5,
         anger_1      = (a_c09  + a_c10 + a_c13  + a_c14 + a_c22)/5,
         stability_1  = (a_c01  + a_c03 + a_c08  + a_c21 + a_c24)/5,
         forgive_2    = (b_c04y + b_c05 + b_c06  + b_c18)/4,
         remorse_2    = (b_c02  + b_c07 + b_c12y + b_c16 + b_c20)/5,
         empathy_2    = (b_c11  + b_c15 + b_c17  + b_c19 + b_c23)/5,
         anger_2      = (b_c09  + b_c10 + b_c13  + b_c14 + b_c22)/5,
         stability_2  = (b_c01  + b_c03 + b_c08  + b_c21 + b_c24)/5,
         pos_affect_1 = (a_q41  + a_q43 + a_q44  + a_q47 + a_q51 + a_q55 +a_q57 + a_q58 + a_q59)/9,
         neg_affect_1 = (a_q42  + a_q45 + a_q48  + a_q50 + a_q52 + a_q53 +a_q54 + a_q56 + a_q60)/9,
         tot_affect_1 = (pos_affect_1 + neg_affect_1)/2,
         pos_behav_1  = (a_q21 + a_q25 + a_q27 + a_q28 + a_q30 + a_q32 + a_q35 + a_q37     + a_q38 + a_q40)/10,
         neg_behav_1  = (a_q22 + a_q23 + a_q24 + a_q26 + a_q29 + a_q31 + a_q33 + a_q34_act + a_q36 + a_q39)/10,
         tot_behav_1  = (pos_behav_1 + neg_behav_1),
         pos_cog_1    = (a_q4 + a_q5 + a_q7 + a_q10 + a_q11 + a_q14_well + a_q16 + a_q17 + a_q19 + a_q20)/10,
         neg_cog_1    = (a_q1 + a_q2 + a_q3 + a_q6  + a_q8  + a_q9        + a_q12 + a_q13 + a_q15 + a_q18)/10,
         tot_cog_1    = (pos_cog_1 + neg_cog_1),
         tot_efi_1    = (tot_affect_1 + tot_cog_1 + tot_behav_1),
         pos_affect_2 = (b_q41  + b_q43 + b_q44  + b_q47 + b_q51 + b_q55 + b_q57 + b_q58 + b_q59)/9,
         neg_affect_2 = (b_q42  + b_q45 + b_q48  + b_q50 + b_q52 + b_q53 + b_q54 + b_q56 + b_q60)/9,
         tot_affect_2 = (pos_affect_2 + neg_affect_2)/2,
         pos_behav_2  = (b_q21 + b_q25 + b_q27 + b_q28 + b_q30 + b_q32 + b_q35 + b_q37     + b_q38 + b_q40)/10,
         neg_behav_2  = (b_q22 + b_q23 + b_q24 + b_q26 + b_q29 + b_q31 + b_q33 + b_q34_act + b_q36 + b_q39)/10,
         tot_behav_2  = (pos_behav_2 + neg_behav_2),
         pos_cog_2    = (b_q4 + b_q5 + b_q7 + b_q10 + b_q11 + b_q14_well + b_q16 + b_q17 + b_q19 + b_q20)/10,
         neg_cog_2    = (b_q1 + b_q2 + b_q3 + b_q6  + b_q8  + b_q9        + b_q12 + b_q13 + b_q15 + b_q18)/10,
         tot_cog_2    = (pos_cog_2 + neg_cog_2),
         tot_efi_2    = (tot_affect_2 + tot_cog_2 + tot_behav_2),
         remorse      = ifelse(condition == 1|condition == 3, 1,2),
         innout       = ifelse(condition == 1|condition == 2, 1,2),
         age          = b_age,
         gender       = ifelse(a_gender == 1,"female",
                               ifelse(a_gender == 2,"male", "other")),
         ethnicity    = ifelse(a_ethnicity == 1, "african american",
                               ifelse(a_ethnicity == 2, "asian",
                                      ifelse(a_ethnicity == 3, "hispanic",
                                             ifelse(a_ethnicity == 4, "two ore more",
                                                    ifelse(a_ethnicity == 5, "american indian/ native alaskan",
                                                           ifelse(a_ethnicity == 6, "white",
                                                                  ifelse(a_ethnicity == 7, "pacific islander","other"))))))),
         class        = ifelse(a_class == 1, "freshman",
                               ifelse(a_class == 2, "sophomore",
                                      ifelse(a_class == 3, "junior",
                                             ifelse(a_class == 4, "senior", "graduate")))))

analysis <- agogo %>% select(forgive_1,remorse_1,empathy_1,anger_1,stability_1,forgive_2,remorse_2,empathy_2,anger_2,stability_2,
                             pos_affect_1,neg_affect_1,tot_affect_1,pos_behav_1,neg_behav_1,tot_behav_1,pos_cog_1,neg_cog_1,tot_cog_1,
                             tot_efi_1,pos_affect_2,neg_affect_2,tot_affect_2,pos_behav_2,neg_behav_2,tot_behav_2,pos_cog_2,neg_cog_2,
                             tot_cog_2,tot_efi_2,remorse,innout,id,age,gender,ethnicity,class)



