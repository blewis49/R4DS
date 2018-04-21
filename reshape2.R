install.packages("reshape2")
library(reshape2)

data("french_fries")

# melt takes a wide format and melts it down to a long format
# keeps identifier variables in place and melts the measured variables
ffm <- melt(french_fries, id = 1:4, na.rm = T)
write.csv(x = ffm, file = "ffm.csv") # write to a file to open in Excel and use a pivot table

# summarize with no variables the total count of all records
dcast(ffm, .~., length) #dcast(data, col_var ~ row_var, function to apply)

# summarize the count by a single variable (treatment) as a row label
dcast(ffm, treatment ~ ., length)

# summarize the count by a single variable (treatment) as a column label
dcast(ffm, . ~ treatment, length)

# summarize the count by two variables (rep and treatment)
# rep is treated as the row label and treatment as the column label
dcast(ffm, rep ~ treatment, length)

# similar to row labels = treatment then rep in a pivot table
dcast(ffm, treatment + rep ~ ., length)
dcast(ffm, treatment + rep ~ ., mean)
dcast(ffm, treatment + rep ~ ., sum)
