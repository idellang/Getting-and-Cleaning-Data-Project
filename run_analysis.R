#load needed libraries

library(tidyverse)
library(janitor)
library(data.table)
library(rio)


#import features and activity data
activity = import(file.path(getwd(), 'UCI HAR DATASET/activity_labels.txt')) %>%
      as_tibble() %>%
      rename(index = V1, activity = V2)

features = import(file.path(getwd(), 'UCI HAR DATASET/features.txt')) %>%
      as_tibble() %>%
      rename(index = V1, features = V2)

std_mean_features = features %>%
      filter(grepl('mean()|std()', features)) %>%
      filter(!grepl('Freq', features)) %>%
      .$index

col_names = features %>%
      filter(index %in% std_mean_features) %>%
      mutate(features = str_replace_all(features, '[()]','')) %>%
      .$features

#import and manipulate train

train = import(file.path(getwd(), 'UCI HAR DATASET/train/X_train.txt')) %>%
      select(std_mean_features)
colnames(train) = col_names


y_train = import(file.path(getwd(), 'UCI HAR DATASET/train/Y_train.txt')) %>%
      as_tibble() %>%
      rename(index = V1) %>%
      left_join(activity) %>%
      select(activity)

subject_train = import(file.path(getwd(), 'UCI HAR DATASET/train/subject_train.txt')) %>%
      as_tibble() %>%
      rename(subject = V1)

train = cbind(subject_train, y_train, train)


#import and manipulate test
test = import(file.path(getwd(), 'UCI HAR DATASET/test/X_test.txt')) %>%
      select(std_mean_features)

colnames(test) = col_names

y_test = import(file.path(getwd(), 'UCI HAR DATASET/test/y_test.txt')) %>%
      as_tibble() %>%
      rename(index = V1) %>%
      left_join(activity) %>%
      select(activity)

subject_test = import(file.path(getwd(), 'UCI HAR DATASET/test/subject_test.txt')) %>%
      as_tibble() %>%
      rename(subject = V1)


test = cbind(subject_test, y_test, test)

#combine both data 
#gather and compute mean
#spread to get wider data
all_data =  rbind(train, test)
final = all_data %>%
      mutate(subject = as.factor(subject),
             activity = as.factor(activity)) %>%
      gather('key','value', -c(subject, activity)) %>%
      group_by(subject, activity, key) %>%
      summarise(value = mean(value)) %>%
      spread(key = key, value = value)

#export data
final %>%
      export('tidyData.txt')
