
2022-10

minimize the variance of the portfolio

$$min f(w_i)=\frac12 \sum_{i,j=1}^n w_i w_j \sigma_{ij}=\frac12 w'Vw$$
$$s.t.  \sum_{i=1}^n w_i \mu_i = \mu_p , \sum_{i=1}^n w_i=1$$

according to the lagrangian method,

$$L=f+\lambda_1(\mu_p - \sum_{i=1}^n w_i \mu_i )  + \lambda_2 (1-\sum_{i=1}^n w_i)$$

here $\mu $    ($(\mu_i)_{n \times 1}$) is a vector containing returns of all assets(e.g. stocks), $\mathbf{1}_{n \times 1} = (1,1,...,1)'$


FOC:

1. $(\frac{\partial L}{\partial w})_{n \times 1} = Vw - \lambda_1 \mu - \lambda_2 \mathbf{1}=0$
2. $\frac{\partial L}{\partial \lambda_1} = \mu_p - \sum_{i=1}^n w_i \mu_i =  \mu_p-w'\mu  =0 $
3. $\frac{\partial L}{\partial \lambda_2} = 1-\sum_{i=1}^n w_i = 1- w' \mathbf{1} = 0 $

from 1, we have $$w= V^{-1}(\lambda_1 \mu + \lambda_2 \mathbf{1})  =   \lambda_1 V^{-1} \mu + \lambda_2 V^{-1}\mathbf{1} \tag{*}$$   $w'=\lambda_1 \mu' V^{-1}  + \lambda_2 \mathbf{1}' V^{-1} $, substitute $w$ into FOC 2 and 3, we have a equation set:

$$\begin{aligned}
\mu_p = w' \mu = \lambda_1 \mu' V^{-1}\mu  + \lambda_2 \mathbf{1}' V^{-1} \mu \\
1 = w' \mathbf{1} = \lambda_1 \mu' V^{-1}\mathbf{1}  + \lambda_2 \mathbf{1}' V^{-1}\mathbf{1}
\end{aligned}$$  which is $\begin{bmatrix}
\mu' V^{-1} \mu  & \mathbf{1}' V^{-1} \mu \\
\mu' V^{-1} \mathbf{1}  & \mathbf{1}' V^{-1} \mathbf{1}
\end{bmatrix}
\begin{bmatrix}
\lambda_1 \\
\lambda2
\end{bmatrix}   =
\begin{bmatrix}
\mu_p \\
1
\end{bmatrix}$




according to the lagarangian theorm, the solution to the optimization problem is the same as the solution of the equation set. When is the equation solvable? the determinant of the cofficient matrix has to be non-zero. If we denote $B=\mu' V^{-1} \mu$, $A=\mathbf{1}' V^{-1} \mu = \mu' V^{-1} \mathbf{1}$, $C\mathbf{1}' V^{-1} \mathbf{1}$, note that here $A,B,C$ are all scalers($1\times 1$). we have $\begin{bmatrix}
B  & A \\
A  & C
\end{bmatrix}
\begin{bmatrix}
\lambda_1 \\
\lambda2
\end{bmatrix}   =
\begin{bmatrix}
\mu_p \\
1
\end{bmatrix} $


so the determinant is $\begin{vmatrix}
B & A\\
A & C
\end{vmatrix}=BC-A^2 \neq 0$ since risk matrix(which is basically a covariance matrix) is positive definite, the inverse matrix $V^{-1}$ is also positive definite, which means the quadratic form of it is greater than 0, namely the following condition must hold

$$(A\mu - B\mathbf{1})' V^{-1} (A\mu - B\mathbf{1}) \geq 0$$

$$\begin{aligned}
(A\mu - B\mathbf{1})' V^{-1} (A\mu - B\mathbf{1}) &= [(A\mu)'V^{-1} - (B\mathbf{1})'V^{-1}]  (A\mu - B\mathbf{1}) \\
&= (A\mu)'V^{-1}A\mu - 2A\mu 'V^{-1}(B\mathbf{1})  + (B\mathbf{1})'V^{-1}B\mathbf{1}) \\
&= A^2 \mu'V^{-1}\mu - 2AB \mu' V^{-1} \mathbf{1} + B^2 \mathbf{1}'V^{-1}\mathbf{1} \\
&= A^2B-2A^2B+B^2C = B^2C-A^2B \\
&= B(BC-A^2) > 0
\end{aligned}$$ we know that by definition $B=\mu' V^{-1} \mu$ is also a quadratic form so $B > 0$, which means $BC-A^2 \neq 0$


if we let $D=BC-A^2$, then $\begin{bmatrix}
B & A\\
A & C
\end{bmatrix}^{-1}=\frac1D \begin{bmatrix}
C & -A\\
-A & B
\end{bmatrix}$and move the matrix from left to the right, we have $\frac1D \begin{bmatrix}
C & -A\\
-A & B
\end{bmatrix} \begin{bmatrix}
\mu_p \\
1
\end{bmatrix} = \begin{bmatrix}
\lambda_1 \\
\lambda_2
\end{bmatrix}$ which gives $\lambda_1 = \frac1D (C\mu_p - A)$ and $\lambda_2=\frac1D (-A\mu_p + B)$, substitute $\lambda_1$, $\lambda_2$ back into equation $(*)$,


$$\begin{aligned}
w &= \lambda_1 V^{-1} \mu + \lambda_2 V^{-1}\mathbf{1} \\
&= \frac1D (C\mu_p -A)V^{-1}\mu + \frac1D (-A \mu_p+B)V^{-1}\mathbf{1} \\
&= \frac1D (C\mu_pV^{-1}\mu - AV^{-1}\mu  -A\mu_pV^{-1}\mathbf{1} + BV^{-1}\mathbf{1}) \\
&= \frac1D (BV^{-1}\mathbf{1} - AV^{-1}\mu) + \mu_p \frac1D ( C V^{-1}\mu - AV^{-1}\mu\mathbf{1})
\end{aligned}$$ if we define $g=\frac1D (BV^{-1}\mathbf{1} - AV^{-1}\mu)$ and $h=\frac1D ( C V^{-1}\mu - AV^{-1}\mu\mathbf{1})$, where note that $g$ and $h$ are both vectors, so that they can been seen as two portfolio.
$$w=g+\mu_p h$$ this means for any minimum variance protfolio with given return rate $\mu_p$, the portfolio can been replicated by two fixed portfolios.

for any two minimum variance portfolio  $a$ with retuen $\mu_a $ and $b$ with return $\mu_b$, the covariance between the two portfolio is given by
$$