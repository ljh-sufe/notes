using DataFrames, GLM

data = DataFrame(X=[1,2,3], Y=[2,4,7])

ols = lm(@formula(Y ~ X), data)