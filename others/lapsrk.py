from pyspark import SparkContext

# create a SparkContext object
sc = SparkContext("local", "countByValue example")

# create an RDD of integers
data_rdd = sc.parallelize([1, 2, 3, 1, 2, 1, 4, 5, 4, 2])

# count the number of occurrences of each value in the RDD
count_dict = data_rdd.countByValue()

# print the resulting dictionary
print(count_dict)
