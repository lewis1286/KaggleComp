

#######################################            IO              ################################

df = read.csv('/path/to/file.ext')
library(<package>)
data() #lists datasets in libraries
data(<dataset>) #Loads dataset from loaded libraries



####################################        df manipulation:         ############################

t_feat2 <- t_feat[t_feat$subject.id!=525450,] # slice a row out of a dataframe by value
simple.lm <- rbind(simple.lm, multi.est) # concatenate two df's by rows
t_feat <- as.data.frame(lapply(t_feat, function(x) {x[is.na(x)] <- median(x, na.rm=TRUE); x})) # set na's to their column median values
sample(10,20,replace = T) #sample in the range 1:10, 20 times, with replacement (returns vector)


################################               PCA:                      ####################

#Plot PCA components 1, 2
pr.out <- prcomp(t_feat3, scale = TRUE)
names(pr.out)
biplot(pr.out, scale = 0)

#check proportion of variance explained by each principle component
pr.var <- pr.out$sdev^2
pv.explained <- pr.var/sum(pr.var)
plot(cumsum(pv.explained), xlab='Principle Component', ylab='Cumulative Proportion of Variance Explained')




##################################        linear regression:            #########################

lm.fit <- lm(y ~ x1 + x2 + ... + xn , data = dataframe)
summary(lm.fit)

#EDA
lapply(df, class) #tells what datatype each predictor is 
bs(...) b spline basis
predict(...) function for predictions


##################### logistic regression 

glm( ... , family = binomial)






# na.vector.and.median.fill
# this function takes in a datafram <dframe> copies all its vectors to 
# boolean vectors telling if the element is na or not, (named <vector>.is.na),
# replaces all na values with medians for existing vectors.
# Inputs:  dataframe
# Outputs: dataframe with extra vectors of na booleans, and all na's changed to medians
na.vector.and.median.fill <- function(dframe) {
  # skipping first variable (identity), adds binary vectors for each 
  for (i in c(2:dim(dframe)[2])) {
    feature.name <- names(dframe[i])
    dummy.name <- paste0("is.na.",feature.name)
    is.na.feature <- is.na(dframe[,feature.name])
    dframe[,dummy.name] <- as.integer(is.na.feature)
    dframe[is.na.feature,feature.name] <- median(dframe[,feature.name], na.rm = TRUE)
  }
  return(dframe)
}
t_feat <- na.vector.and.median.fill(t_feat)
dim(t_feat)
