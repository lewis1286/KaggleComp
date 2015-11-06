#Script for histogram visualisation

training.features <- read.csv("../training_features.csv")
t.is.na = is.na(training.features)
his = colSums(t.is.na)
plot(1:ncol(his),his,"h")


