
function add(a,b)
    return a+b
end;

function divide(a,b)
    return a/b
end;

function get_array_dims(x::AbstractArray)
    return ndims(x)
end;

function get_first_row(x::AbstractArray)
    return x[1,:]
end


function matrixMultiplication(a::AbstractMatrix, b::AbstractMatrix)
    c = a*b
    return c
end

function matrixMultiplicationLoop(a::AbstractMatrix, b::AbstractMatrix, c::AbstractMatrix)
    d::AbstractMatrix = a*b*c
    for i in 1:999
        d=d + a*b*c
    end
    return d
end

function for_loop(iterations = 100)
    a = 0    
    for i in 1:iterations       
        a = a+1
    end        
    return a
end

using DataFrames
using PyCall
function get_col_of_df(df, colname)
    dfjl = pyimport("DataFrames").DataFrame(df)
    df = py"dfjl"
    return df[:,colname]
end

import Pandas

function myDf()
    return DataFrame(A=1:4, B=["M", "F", "F", "M"])
end






