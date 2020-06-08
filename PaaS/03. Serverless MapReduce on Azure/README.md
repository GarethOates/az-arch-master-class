# Serverless MapReduce on Azure

### Introduction

MapReduce is a programming model that allows processing and generating big data sets with a parallel, distributed algorithm on a cluster.

A MapReduce implementation consists of a:

`Map()` function that performs filtering and sorting, and a

`Reduce()` function that performs a summary operation on the output of the Map() function

Both the input and output of the MapReduce implementation are <key, value> pairs: `(input) <k1, v1>` -> `map()` -> `<k2, v2>` -> `combine()` -> `<k2, v2>` -> `reduce()` -> `<k3, v3>` (output)

The model is a specialization of the split-apply-combine strategy for data analysis and allows for significant increased speed in a multi-threaded implementation.

Please refer [documentation](https://docs.microsoft.com/en-us/samples/azure-samples/durablefunctions-mapreduce-dotnet/big-data-processing-serverless-mapreduce-on-azure/) for details.

### Instructions

Below are the step-by-step instructions and an explanation of each step.


