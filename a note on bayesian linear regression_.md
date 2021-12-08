1
  
  
  
  
  
####  a note on beyesian linear regression
  
  
  
  
  
general form:
<p align="center"><img src="https://latex.codecogs.com/gif.latex?y_i=&#x5C;beta^Tx_i+&#x5C;epsilon_i"/></p>  
  
now assume <img src="https://latex.codecogs.com/gif.latex?y_i"/> comes from <img src="https://latex.codecogs.com/gif.latex?N(&#x5C;beta^Tx_i,%20&#x5C;sigma^2)"/>
  
  
  
  
  
  
  
  
compute the likelihood given assumption that <img src="https://latex.codecogs.com/gif.latex?&#x5C;epsilon_i"/> are independent:
  
  
  
  
  
  
<img src="https://latex.codecogs.com/gif.latex?&#x5C;begin{aligned}P(y|X,&#x5C;beta,&#x5C;sigma^2)%20&amp;=%20&#x5C;prod_{i=1}^n%20P(y_i|x_i,&#x5C;beta,&#x5C;sigma^2)%20&#x5C;&#x5C;&amp;%20=%20&#x5C;prod_{i=1}^n%20&#x5C;dfrac{1}{&#x5C;sqrt{2&#x5C;pi}&#x5C;sigma}%20exp&#x5C;left&#x5C;{&#x5C;frac{1}{2&#x5C;sigma^2}%20(y_i-&#x5C;beta^T%20x_i)^2%20&#x5C;right&#x5C;}%20&#x5C;&#x5C;&amp;%20=%20(2&#x5C;pi&#x5C;sigma^2)^{-n&#x2F;2}%20exp%20&#x5C;left&#x5C;{%20-&#x5C;dfrac{1}{2&#x5C;sigma^2}%20&#x5C;sum_{i=1}^n%20(y_i%20-%20&#x5C;beta^Tx_i)%20^2%20&#x5C;right&#x5C;}&#x5C;end{aligned}"/>
  
note that,
<img src="https://latex.codecogs.com/gif.latex?&#x5C;begin{aligned}%20&#x5C;sum_{i=1}^n%20(y_i%20-%20&#x5C;beta^Tx_i)%20^2%20%20&amp;%20=%20(y-X&#x5C;beta)^T(y-X&#x5C;beta)%20&#x5C;&#x5C;%20&amp;%20=%20y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta&#x5C;end{aligned}"/>
  
  
  
  
  
  
  
  
  
then we will compute the conditional likelihood <img src="https://latex.codecogs.com/gif.latex?P(&#x5C;beta%20|%20y,x,&#x5C;sigma^2)"/>. Suppose we have known the value of <img src="https://latex.codecogs.com/gif.latex?&#x5C;sigma^2"/>, and prior distribution of <img src="https://latex.codecogs.com/gif.latex?&#x5C;beta"/> comes from <img src="https://latex.codecogs.com/gif.latex?N_k(&#x5C;beta_0,%20&#x5C;Sigma_0)"/>. Then <img src="https://latex.codecogs.com/gif.latex?P(&#x5C;beta)%20=%20({(2&#x5C;pi)^k%20|&#x5C;Sigma_0|})^{-1&#x2F;2}%20%20exp&#x5C;left&#x5C;{%20-&#x5C;dfrac12%20(&#x5C;beta-&#x5C;beta_0)^T&#x5C;Sigma_0^{-1}%20(&#x5C;beta-&#x5C;beta_0)%20&#x5C;right&#x5C;}"/>.
According to bayes throey,
  
  
  
  
  
  
  
  
  
  
  
  
  
  
<img src="https://latex.codecogs.com/gif.latex?&#x5C;begin{aligned}&amp;%20P(&#x5C;beta%20|%20y,X,&#x5C;sigma^2)%20&#x5C;&#x5C;&amp;%20&#x5C;propto%20P(&#x5C;beta)%20P(y|X,&#x5C;beta,&#x5C;sigma^2)%20&#x5C;&#x5C;&amp;=%20%20%20({(2&#x5C;pi)^k%20|&#x5C;Sigma_0|})^{-1&#x2F;2}%20%20exp&#x5C;left&#x5C;{%20-&#x5C;dfrac12%20(&#x5C;beta-&#x5C;beta_0)^T&#x5C;Sigma_0^{-1}%20(&#x5C;beta-&#x5C;beta_0)%20&#x5C;right&#x5C;}%20&#x5C;&#x5C;&amp;%20&#x5C;qquad%20&#x5C;qquad%20*%20(2&#x5C;pi&#x5C;sigma^2)^{-n&#x2F;2}%20exp%20&#x5C;left&#x5C;{%20-&#x5C;dfrac{1}{2&#x5C;sigma^2}%20&#x5C;left(y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta%20&#x5C;right)%20&#x5C;right&#x5C;}%20&#x5C;&#x5C;&amp;%20&#x5C;propto%20exp%20&#x5C;left&#x5C;{%20-&#x5C;dfrac12%20&#x5C;left(%20&#x5C;beta^T&#x5C;Sigma_0^{-1}%20&#x5C;beta_0%20-&#x5C;beta^T&#x5C;Sigma_0^{-1}%20&#x5C;beta_0%20-&#x5C;beta_0^T&#x5C;Sigma_0^{-1}&#x5C;beta%20+%20&#x5C;beta_0^T&#x5C;Sigma_0^{-1}%20&#x5C;beta_0%20%20&#x5C;right)%20&#x5C;right&#x5C;}%20&#x5C;&#x5C;&amp;%20&#x5C;qquad%20&#x5C;qquad%20&#x5C;%20*%20exp&#x5C;left&#x5C;{%20-&#x5C;dfrac{1}{2%20&#x5C;sigma^2%20}%20&#x5C;left(%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta%20&#x5C;right)%20%20&#x5C;right&#x5C;}%20&#x5C;&#x5C;&amp;%20&#x5C;propto%20exp&#x5C;left&#x5C;{%20&#x5C;beta^T%20&#x5C;Sigma_0^{-1}&#x5C;beta_0-&#x5C;frac12&#x5C;beta^T%20&#x5C;Sigma_0^{-1}&#x5C;beta%20%20+%20&#x5C;beta^TX^Ty&#x2F;%20&#x5C;sigma^2%20-&#x5C;frac12%20&#x5C;beta^TX^TX&#x5C;beta%20&#x2F;&#x5C;sigma^2%20&#x5C;right&#x5C;}%20&#x5C;&#x5C;%20&amp;%20=%20exp%20&#x5C;left&#x5C;{%20&#x5C;beta^T%20&#x5C;left(%20&#x5C;Sigma_0^{-1}&#x5C;beta_0%20+%20X^Ty&#x2F;&#x5C;sigma^2%20&#x5C;right)%20%20-%20&#x5C;frac12&#x5C;beta^T%20&#x5C;left(%20&#x5C;Sigma_0^{-1}%20+%20X^TX&#x2F;&#x5C;sigma^2&#x5C;right)&#x5C;beta&#x5C;right&#x5C;}&#x5C;end{aligned}"/>
this is proportional to a multivariate normal distribution(to be proved later), that means:
  
<p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;beta%20|y,X,&#x5C;sigma^2%20&#x5C;sim%20N(A_{&#x5C;sigma^2}^{-1}B_{&#x5C;sigma^2},%20A_{&#x5C;sigma^2}^{-1})"/></p>  
  
where <img src="https://latex.codecogs.com/gif.latex?A_{&#x5C;sigma^2}=&#x5C;Sigma_0^{-1}+X^TX&#x2F;&#x5C;sigma^2"/>, <img src="https://latex.codecogs.com/gif.latex?B_{&#x5C;sigma^2}=&#x5C;Sigma_0^{-1}&#x5C;beta_0%20+%20X^Ty&#x2F;&#x5C;sigma^2"/>
  
  
  
  
  
Do something similar, now we have known the value of <img src="https://latex.codecogs.com/gif.latex?&#x5C;beta"/>. Let <img src="https://latex.codecogs.com/gif.latex?&#x5C;gamma=&#x5C;frac{1}{&#x5C;sigma^2}"/>  and prior distribution of <img src="https://latex.codecogs.com/gif.latex?&#x5C;gamma"/> comes from <img src="https://latex.codecogs.com/gif.latex?gamma&#x5C;left(%20v_0&#x2F;2,%20v_0&#x5C;sigma^2&#x2F;2%20&#x5C;right)"/>. Recall that the pdf for a <img src="https://latex.codecogs.com/gif.latex?gamma(x|a,b)"/> is 
<p align="center"><img src="https://latex.codecogs.com/gif.latex?f(x|a,b)%20=%20&#x5C;dfrac{b^ax^{a-1}e^{-bx}}{&#x5C;Gamma(a)}"/></p>  
  
so the prior distribution of <img src="https://latex.codecogs.com/gif.latex?&#x5C;gamma"/> is
  
<p align="center"><img src="https://latex.codecogs.com/gif.latex?P(&#x5C;gamma)%20&#x5C;propto%20(v_0&#x5C;sigma^2_0&#x2F;2)^{v_0&#x2F;2}%20&#x5C;gamma^{&#x5C;frac{v_0}{2}-1}%20exp%20&#x5C;left&#x5C;{%20-&#x5C;gamma%20v_0&#x5C;sigma^2%20&#x2F;2&#x5C;right&#x5C;}"/></p>  
  
the likelihood is, as mentioned before, 
  
<img src="https://latex.codecogs.com/gif.latex?&#x5C;begin{aligned}P(y|X,&#x5C;beta,&#x5C;gamma=1&#x2F;&#x5C;sigma^2)%20&amp;=(2&#x5C;pi&#x5C;sigma^2)^{-n&#x2F;2}%20exp%20&#x5C;left&#x5C;{%20-&#x5C;dfrac{1}{2&#x5C;sigma^2}%20&#x5C;left(y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta%20&#x5C;right)&#x5C;right&#x5C;}%20&#x5C;&#x5C;&amp;%20&#x5C;propto%20&#x5C;gamma^{n&#x2F;2}%20exp%20&#x5C;left&#x5C;{%20-&#x5C;frac{&#x5C;gamma}{2}&#x5C;left(y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta%20&#x5C;right)%20&#x5C;right&#x5C;}%20&#x5C;end{aligned}"/>
  
Again using bayesian theory, 
  
<img src="https://latex.codecogs.com/gif.latex?&#x5C;begin{aligned}P(&#x5C;gamma|y,X,&#x5C;beta)%20&amp;%20&#x5C;propto%20P(&#x5C;gamma)P(y|X,&#x5C;beta,%20&#x5C;gamma)%20&#x5C;&#x5C;&amp;%20&#x5C;propto%20&#x5C;gamma^{n&#x2F;2}%20exp%20&#x5C;left&#x5C;{%20-&#x5C;frac{&#x5C;gamma}{2}&#x5C;left(y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta%20&#x5C;right)%20&#x5C;right&#x5C;}%20*%20%20%20&#x5C;gamma^{&#x5C;frac{v_0}{2}-1}%20exp%20&#x5C;left&#x5C;{%20-&#x5C;gamma%20v_0&#x5C;sigma^2%20&#x2F;2&#x5C;right&#x5C;}%20&#x5C;&#x5C;&amp;%20=%20&#x5C;gamma^{&#x5C;frac12(v_0+n)-1}%20exp&#x5C;left&#x5C;{%20-&#x5C;frac&#x5C;gamma2%20&#x5C;left(%20v_0&#x5C;sigma_0^2%20+%20y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta%20&#x5C;right)%20%20%20&#x5C;right&#x5C;}&#x5C;end{aligned}"/>
that is 
<p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;gamma%20|%20y,X,&#x5C;beta%20&#x5C;sim%20gamma%20&#x5C;left(%20&#x5C;dfrac{v_0+n}{2},%20&#x5C;dfrac12%20&#x5C;left(%20v_0&#x5C;sigma_0^2%20+%20y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta%20%20&#x5C;right)%20&#x5C;right)"/></p>  
  
which is equivalent to 
<p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;sigma^2%20|%20y,X,&#x5C;beta%20&#x5C;sim%20%20{inverse-gamma}%20%20&#x5C;left(%20&#x5C;dfrac{v_0+n}{2},%20&#x5C;dfrac12%20&#x5C;left(%20v_0&#x5C;sigma_0^2%20+%20SSR(&#x5C;beta)%20%20&#x5C;right)%20&#x5C;right)"/></p>  
  
where <img src="https://latex.codecogs.com/gif.latex?SSR(&#x5C;beta)%20=%20y^Ty%20-2&#x5C;beta^TX^Ty%20+%20&#x5C;beta^TX^TX&#x5C;beta"/>
  
after we have the posterior distribution, we do the Gibbs sampling. 
  
STEP 1: sample <img src="https://latex.codecogs.com/gif.latex?&#x5C;gamma_0"/> fron <img src="https://latex.codecogs.com/gif.latex?P(&#x5C;gamma)"/>, <img src="https://latex.codecogs.com/gif.latex?&#x5C;sigma_0^2%20=%201&#x2F;&#x5C;gamma_0"/>
STEP 2: sample <img src="https://latex.codecogs.com/gif.latex?&#x5C;beta_t"/> from <img src="https://latex.codecogs.com/gif.latex?N(A_{&#x5C;sigma_t^2}^{-1}B_{&#x5C;sigma_t^2},%20A_{&#x5C;sigma_t^2}^{-1})"/> 
STEP 3: sample <img src="https://latex.codecogs.com/gif.latex?&#x5C;sigma^2_{t+1}"/> from <img src="https://latex.codecogs.com/gif.latex?inverse-gamma(&#x5C;frac{v_0+n}{2},%20&#x5C;frac12(v_0&#x5C;sigma_0^2++%20SSR(&#x5C;beta_t)))"/>, <img src="https://latex.codecogs.com/gif.latex?t=t+1"/>
STEP 4: return to STEP 2, t=0 to 10000
  
  
  