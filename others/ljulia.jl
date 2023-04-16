
function add(a,b)
    return a+b
end;

function divide(a,b)
    return a/b
end;

function get_array_dims(x::AbstractArray)
    return ndims(x)
end;

function for_loop(iterations = 100)
    a = 0    
    for i in 1:iterations       
        a = a+1
    end        
    return a
end

using DataFrames
function get_col_of_df(df, colname)
    return df[:,colname]
end

import Pandas

function myDf()
    return Pandas.DataFrame(DataFrame(A=1:4, B=["M", "F", "F", "M"]))
end