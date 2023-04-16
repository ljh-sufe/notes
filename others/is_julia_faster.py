from julia.api import Julia
jl = Julia(compiled_modules=False)

jl.eval("@eval Main import Base.MainInclude: include")
from julia import Main
Main.include("others/ljulia.jl")
import time


import numpy as np
img1 = np.random.rand(500,500) * 5
img2 = np.random.rand(500,500) * 10
img3 = np.random.rand(500,500) * 15


def add_arrays(img1, img2, img3):
    return img1.dot(img2).dot(img3)
s = time.time()
res = add_arrays(img1, img2, img3)
for i in range(0,999):
    res = add_arrays(img1, img2, img3) + res

print(res)
print("numpy",time.time()-s)


from numba import jit

# @jit(nopython=True)
# def add_arrays_numba(img1, img2, img3):
#     return img1.dot(img2).dot(img3)
# s = time.time()
# res = add_arrays_numba(img1, img2, img3)
# for i in range(0,999):
#     res = add_arrays_numba(img1, img2, img3) + res
# res
# print("numba",time.time()-s)

s = time.time()
res=Main.matrixMultiplicationLoop(img1, img2, img3)
print(res)
print("pyjulia",time.time()-s)