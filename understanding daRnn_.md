1
  
![daRnn](daRnnChart.jpg )
  
decomposing the process of a daRnn (Dual-Stage Attention-Based Recurrent Neural Network) model step by step
  
daRnn is a special nonlinear autoregressive network with exogenous inputs (NARX) <p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;hat{Y}_{T}%20=F&#x5C;left(Y_{1},%20&#x5C;cdots,%20Y_{T-1},%20{X}_{1},%20&#x5C;cdots,%20{X}_{T}&#x5C;right)"/></p>  
  
  
before we start, let's get familiar with some notations to understand the shape of input data.
  
  
  
<p align="center"><img src="https://latex.codecogs.com/gif.latex?X%20=%20&#x5C;begin{bmatrix}x_1^1%20&amp;%20x_2^1%20&amp;%20...&amp;%20...%20&amp;%20...%20&amp;%20x_T^1&#x5C;&#x5C;x_1^2%20&amp;%20x_2^2%20&amp;%20...&amp;%20...%20&amp;%20...%20&amp;%20x_T^2%20&#x5C;&#x5C;...%20&amp;%20...%20&amp;%20...&amp;%20...%20&amp;%20...%20&amp;%20...&#x5C;&#x5C;...%20&amp;%20...%20&amp;%20...&amp;%20x_t^k%20&amp;%20...%20&amp;%20x_T^k%20&#x5C;&#x5C;...%20&amp;%20...%20&amp;%20...&amp;%20...%20&amp;%20...%20&amp;%20...%20%20&#x5C;&#x5C;x_1^n%20&amp;%20x_2^n%20&amp;%20...&amp;%20...%20&amp;%20...%20&amp;%20x_T^n%20&#x5C;&#x5C;&#x5C;end{bmatrix}%20=%20(x^1,%20x^2,%20...,%20x^k,%20...%20,%20x^n)&#x27;%20=%20(x_1,%20x_2,%20...%20,%20x_t,%20...,%20x_T)"/></p>  
  
  
in which <img src="https://latex.codecogs.com/gif.latex?n"/> is the number of explainary variables and <img src="https://latex.codecogs.com/gif.latex?T"/> is the length of the time series.
  
  
  
**step 1**: initialize the hidden state <img src="https://latex.codecogs.com/gif.latex?s_t"/>, <img src="https://latex.codecogs.com/gif.latex?h_t"/>. their shape are both <img src="https://latex.codecogs.com/gif.latex?m"/>, <img src="https://latex.codecogs.com/gif.latex?t=1"/>
  
**step 2**: calculate the similarity of <img src="https://latex.codecogs.com/gif.latex?h_{t-1}"/>, <img src="https://latex.codecogs.com/gif.latex?s_{t-1}"/> with <img src="https://latex.codecogs.com/gif.latex?x^k"/> by the following equation(Eq. #8 in the paper):
  
<p align="center"><img src="https://latex.codecogs.com/gif.latex?e_{t}^{k}=v_{e}&#x27;%20&#x5C;tanh%20&#x5C;left(W_{e}&#x5C;left[h_{t-1}%20;%20s_{t-1}&#x5C;right]+U_{e}%20x^{k}&#x5C;right),%20k=1,2,...,n"/></p>  
  
  
while coding, we input <img src="https://latex.codecogs.com/gif.latex?X"/>, so we can do this for all <img src="https://latex.codecogs.com/gif.latex?k"/> from <img src="https://latex.codecogs.com/gif.latex?1"/> to <img src="https://latex.codecogs.com/gif.latex?n"/> at the same time thanks to matrix opertion. That is <img src="https://latex.codecogs.com/gif.latex?(e_1^1,%20e_1^2,%20...%20,%20e_1^n)&#x27;"/>. Then we softmax it (Eq. #9 in the paper) to get <img src="https://latex.codecogs.com/gif.latex?(&#x5C;alpha_1^1,%20&#x5C;alpha_1^2,%20...%20,%20&#x5C;alpha_1^n)&#x27;"/>, so as to undate the original <img src="https://latex.codecogs.com/gif.latex?x_t"/> (the <img src="https://latex.codecogs.com/gif.latex?t^{th}"/> column in <img src="https://latex.codecogs.com/gif.latex?X"/>) with:
  
<p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;tilde{x}_{t}=&#x5C;left(&#x5C;alpha_{t}^{1}%20x_{t}^{1},%20&#x5C;alpha_{t}^{2}%20x_{t}^{2},%20&#x5C;cdots,%20&#x5C;alpha_{t}^{n}%20x_{t}^{n}&#x5C;right)&#x27;"/></p>  
  
  
**step 3**: pass <img src="https://latex.codecogs.com/gif.latex?&#x5C;tilde{x}_{t}"/> to a LSTM cell, together with <img src="https://latex.codecogs.com/gif.latex?h_{t-1}"/>, <img src="https://latex.codecogs.com/gif.latex?s_{t-1}"/>, to get <img src="https://latex.codecogs.com/gif.latex?h_t"/> and <img src="https://latex.codecogs.com/gif.latex?s_t"/>, the hidden state of the next time. the detail of how LSTM works is as follows:
  
<p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;begin{aligned}{f}_{t}%20&amp;=&#x5C;sigma&#x5C;left({W}_{f}&#x5C;left[{h}_{t-1}%20;%20{x}_{t}&#x5C;right]+{b}_{f}&#x5C;right)%20&#x5C;&#x5C;{i}_{t}%20&amp;=&#x5C;sigma&#x5C;left({W}_{i}&#x5C;left[{h}_{t-1}%20;%20{x}_{t}&#x5C;right]+{b}_{i}&#x5C;right)%20&#x5C;&#x5C;{o}_{t}%20&amp;=&#x5C;sigma&#x5C;left({W}_{o}&#x5C;left[{h}_{t-1}%20;%20{x}_{t}&#x5C;right]+{b}_{o}&#x5C;right)%20&#x5C;&#x5C;{s}_{t}={f}_{t}%20&#x5C;odot%20{s}_{t-1}%20&amp;+{i}_{t}%20&#x5C;odot%20&#x5C;tanh%20&#x5C;left({W}_{s}&#x5C;left[{h}_{t-1}%20;%20{x}_{t}&#x5C;right]+{b}_{s}&#x5C;right)%20&#x5C;&#x5C;{h}_{t}%20&amp;={o}_{t}%20&#x5C;odot%20&#x5C;tanh%20&#x5C;left({s}_{t}&#x5C;right)&#x5C;end{aligned}"/></p>  
  
  
**step 4**: return to step 2 untill <img src="https://latex.codecogs.com/gif.latex?t=T"/>
  
*now we already have <img src="https://latex.codecogs.com/gif.latex?h_1,%20h_2,%20...,%20h_T"/>. it's time to apply another attnetion layer. if we put these <img src="https://latex.codecogs.com/gif.latex?h_t"/> together, which is <img src="https://latex.codecogs.com/gif.latex?(h_1,%20h_2,%20...,%20h_T)"/>, it's not difficult to find they have a very similar shape as <img src="https://latex.codecogs.com/gif.latex?X%20=%20(x_1,%20x_2,%20...,%20x_T)"/>.*
  
**step 5**: generate the initial hidden state <img src="https://latex.codecogs.com/gif.latex?s_{t-1}&#x27;"/>, <img src="https://latex.codecogs.com/gif.latex?d_{t-1}"/>, <img src="https://latex.codecogs.com/gif.latex?t=1"/>
  
**step 6**: here is the tricky point of daRnn, we will not calculate the similarity of hidden state and some rows of <img src="https://latex.codecogs.com/gif.latex?(h_1,%20h_2,%20...,%20h_T)"/> like what we do in the first attention layer (<img src="https://latex.codecogs.com/gif.latex?x^k"/> is a row of <img src="https://latex.codecogs.com/gif.latex?X"/>). instead, we calculate the similarity of hidden state <img src="https://latex.codecogs.com/gif.latex?s_{t-1}&#x27;"/>, <img src="https://latex.codecogs.com/gif.latex?d_{t-1}"/> and <img src="https://latex.codecogs.com/gif.latex?h_1,%20h_2,%20...,%20h_T"/> respectively by using Eq #12 in the paper:
<p align="center"><img src="https://latex.codecogs.com/gif.latex?l_{t}^{i}=v_{d}‘%20&#x5C;tanh%20&#x5C;left({W}_{d}&#x5C;left[{d}_{t-1}%20;%20{s}_{t-1}^{&#x5C;prime}&#x5C;right]+{U}_{d}%20{h}_{i}&#x5C;right),%20i=1,2,...,T"/></p>  
  
  
like before, we softmax <img src="https://latex.codecogs.com/gif.latex?l_t^1,%20l_t^2,%20...,%20l_t^T"/>, the output is <img src="https://latex.codecogs.com/gif.latex?&#x5C;beta_t^1,%20&#x5C;beta_t^2,%20...,%20&#x5C;beta_t^T"/>
  
**step 7**: <img src="https://latex.codecogs.com/gif.latex?c_t%20=%20&#x5C;sum_{i=1}^T%20h_i%20&#x5C;beta_t^i"/>
  
**step 8**: pass <img src="https://latex.codecogs.com/gif.latex?c_t"/> to a LSTM cell, together with <img src="https://latex.codecogs.com/gif.latex?s_{t-1}&#x27;"/>, <img src="https://latex.codecogs.com/gif.latex?d_{t-1}"/>, to get <img src="https://latex.codecogs.com/gif.latex?s&#x27;_t"/> and <img src="https://latex.codecogs.com/gif.latex?d_t"/>, the hidden state of the next time.
  
**step 9**: return to step 6 until <img src="https://latex.codecogs.com/gif.latex?t=T"/>
  
**step 10**: subtract the final step output <img src="https://latex.codecogs.com/gif.latex?d_T,%20c_T"/>
  
<p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;begin{aligned}&#x5C;hat{y}_{T}%20&amp;=F&#x5C;left(y_{1},%20&#x5C;cdots,%20y_{T-1},%20{x}_{1},%20&#x5C;cdots,%20{x}_{T}&#x5C;right)%20&#x5C;&#x5C;&amp;={v}_{y}^{&#x5C;top}&#x5C;left({W}_{y}&#x5C;left[{d}_{T}%20;%20{c}_{T}&#x5C;right]+{b}_{w}&#x5C;right)+b_{v}&#x5C;end{aligned}"/></p>  
  
  