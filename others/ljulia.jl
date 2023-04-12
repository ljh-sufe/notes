

funx(x) = print("anything")
funx(x::Float16) = print("this is float16")
funx(x::Int) = print("this is int")

a::Float16=1.1



[n+m for n in 1:10, m in 1:10]