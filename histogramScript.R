#Script for histogram visualisation

training.features <- read.csv("../training_features.csv")
t.is.na = is.na(training.features)
his = colSums(t.is.na)
plot(1:ncol(t.is.na),his,"h")


#RATIO OF DEPLETION  CV on this tuning parameter ?
ratio = 0.5

training.features <- read.csv("../training_features.csv")
validation.features <- read.csv("../validation_features.csv")
leaderboard.features<- read.csv("../leaderboard_features.csv")

all.patients = rbind(training.features, validation.features,leaderboard.features)

hist.all.patients = colSums(is.na(all.patients))

all.patients.size = nrow(all.patients)

bad.features=NULL

for (nam in names(all.patients)){
  if (hist.all.patients[nam]>all.patients.size*ratio){
    bad.features = c(bad.features,nam)
  }
}

bad.features
