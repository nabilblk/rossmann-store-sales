if (! ("data.table" %in% rownames(installed.packages()))) { install.packages("data.table") }
if (! ("zoo" %in% rownames(installed.packages()))) { install.packages("zoo") }
if (! ("forecast" %in% rownames(installed.packages()))) { install.packages("forecast") }
if (! ("ggplot2" %in% rownames(installed.packages()))) { install.packages("ggplot2") }
test <- fread("/Users/macpro/Projects/data-science/rossmann-store-sales/data/test.csv")
train <- fread("/Users/macpro/Projects/data-science/rossmann-store-sales/data/train.csv")
store <- fread("/Users/macpro/Projects/data-science/rossmann-store-sales/data/store.csv")
str(train)
str(test)
str(store)
# head(train); tail(train)
# head(test); tail(test)
train[, Date := as.Date(Date)]
test[, Date := as.Date(Date)]
store
# ordering By Date
train <- train[order(Date)]
test <- test[order(Date)]
summary(train)
summary(test)

# Test ON NA
test[is.na(test$Open), ]# Only store 622
test$Open[test$Store == 622]

# NA OF 622 must be Emputed to 1
test[is.na(test)] <- 1

# Unique values per column
train[, lapply(.SD, function(x) length(unique(x)))]

