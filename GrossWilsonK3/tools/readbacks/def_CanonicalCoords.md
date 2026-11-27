**Conventions used throughout.** Points of $\mathbb{C}^2 = \mathbb{C}\times\mathbb{C}$ are written $p=(x,y)$. Coordinates are $x = x_1 + i x_2$ and $y = y_1 + i y_2$. $|\cdot|$ is the complex modulus. $\overline{z}$ is complex conjugation. For a function $\tau:\mathbb{C}\to\mathbb{C}$, $\tau'$ always means the complex derivative. That derivative is a total function: it is set to $0$ at every point where $\tau$ is not complex-differentiable. Real Fréchet derivatives are likewise set to $0$ (as a linear map) at points where the function is not real-differentiable. All integrals are Bochner integrals, which are set to $0$ when the integrand is not integrable. Division by $0$ gives $0$.

---

**`C2`.** This is the type $\mathbb{C}^2 = \mathbb{C}\times\mathbb{C}$. Its norm is the product (max) norm $\|(x,y)\| = \max(|x|,|y|)$.

**`pX1`, `pX2`, `pY1`, `pY2`.** Take any function $F:\mathbb{C}^2\to\mathbb{C}$ and any point $p$, and let $DF(p)$ be the real Fréchet derivative of $F$ at $p$. These four definitions are $DF(p)$ applied to the directions $(1,0)$, $(i,0)$, $(0,1)$ and $(0,i)$:
$$\partial_{x_1}F(p),\quad \partial_{x_2}F(p),\quad \partial_{y_1}F(p),\quad \partial_{y_2}F(p).$$
If $F$ is not real-differentiable at $p$, all four are $0$. No differentiability is assumed.

**`wX`, `wXbar`, `wY`, `wYbar`.** These are the Wirtinger-type combinations
$$\partial_x F(p) = \tfrac12\big(\partial_{x_1}F - i\,\partial_{x_2}F\big)(p),\qquad \partial_{\bar x} F(p) = \tfrac12\big(\partial_{x_1}F + i\,\partial_{x_2}F\big)(p),$$
and similarly $\partial_y F(p)$ and $\partial_{\bar y}F(p)$ with $y_1, y_2$ in place of $x_1, x_2$. All four are $0$ wherever $F$ is not real-differentiable.

**`ofRealFun`.** For $W:\mathbb{C}^2\to\mathbb{R}$, this is the same function viewed as complex-valued, $p\mapsto W(p)\in\mathbb{R}\subset\mathbb{C}$.

**`tubeOver`.** For a real number $R$, this is the set $\{(x,y)\in\mathbb{C}^2 : |y|<R\}$. There is no restriction on $x$. If $R\le 0$, the set is empty.

**`IsS1InvRicciFlatCanonical`.** This takes a real number $R$, an arbitrary function $\tau:\mathbb{C}\to\mathbb{C}$ (with no regularity or positivity assumed), $W:\mathbb{C}^2\to\mathbb{R}$ and $b:\mathbb{C}^2\to\mathbb{C}$. Write $T_R = \{|y|<R\}$. The proposition holds when all of the following are true:

1. $W$ and $b$ are $C^\infty$ (real-smooth) on $T_R$.
2. $W>0$ on $T_R$.
3. For every $(x,y)\in T_R$ and every real $t$: $W(x+t,y)=W(x,y)$ and $b(x+t,y)=b(x,y)$.
4. For every $(x,y)\in T_R$: $W(x+\tau(y),y)=W(x,y)$ and $b(x+\tau(y),y)=b(x,y)-\tau'(y)$. Here $\tau'(y)$ is $0$ if $\tau$ is not complex-differentiable at $y$.
5. On $T_R$: $\partial_y W = \partial_x(W b)$, with $W$ viewed as complex-valued.
6. On $T_R$: $\partial_y(W\bar b) = \partial_x\big(W^{-1} + W|b|^2\big)$.

If $R\le 0$, all conditions hold vacuously. If $\tau(y)$ is real at some point of $T_R$, conditions 3 and 4 together force $\tau'(y)=0$ there.

**`canonFibreVolume`.** For $\tau:\mathbb{C}\to\mathbb{C}$, $W:\mathbb{C}^2\to\mathbb{R}$ and $y\in\mathbb{C}$, this is the real number
$$\operatorname{Im}\tau(y)\cdot\int_0^1\!\!\int_0^1 W\big(s+t\,\tau(y),\,y\big)\,ds\,dt.$$
The inner integral is in $s$ and the outer in $t$. Either integral is $0$ if its integrand is not integrable. The value is negative when $\operatorname{Im}\tau(y)<0$ and the integral is positive.

**`IsI1PeriodData`.** This takes $U\subseteq\mathbb{C}$ and $\tau_1,\tau_2:\mathbb{C}\to\mathbb{C}$. The proposition holds when all of the following are true:

- $U$ is open, $0\in U$, and $U$ (as a subspace) is contractible.
- $\tau_1$ is holomorphic on $U\setminus\{0\}$. Nothing is assumed about $\tau_1$ at or near $0$ beyond this.
- $\tau_2$ is holomorphic on $\exp^{-1}(U)=\{s : e^s\in U\}$.
- For every $s$ with $e^s\in U$: $\tau_2(s+2\pi i)=\tau_2(s)+\tau_1(e^s)$.
- For every $s$ with $e^s\in U$: $\operatorname{Im}\big(\overline{\tau_1(e^s)}\,\tau_2(s)\big)>0$.

Since $e^s\neq 0$, the last two conditions only involve values of $\tau_1$ on $U\setminus\{0\}$.

**`tau2At`.** This is $\tilde\tau_2(y)=\tau_2(\operatorname{Log}y)$, where $\operatorname{Log}$ is the principal logarithm $\ln|y| + i\arg y$ with $\arg\in(-\pi,\pi]$. By convention $\operatorname{Log}0=0$, so $\tilde\tau_2(0)=\tau_2(0)$. The function generally jumps across the negative real axis.

**`dTau2At`.** This is $\tilde\tau_2'(y) := \tau_2'(\operatorname{Log}y)/y$. Two junk cases apply:

- At $y=0$ the value is $0$, because of division by zero.
- $\tau_2'$ is $0$ wherever $\tau_2$ is not complex-differentiable.

This is a formula, not the derivative of $\tilde\tau_2$.

**`periodLattice`.** This is the set
$$\Lambda_y=\{m\,\tau_1(y)+n\,\tilde\tau_2(y) : m,n\in\mathbb{Z}\}\subseteq\mathbb{C}.$$
It is not required to be a genuine rank-2 lattice. It may be degenerate, for example when the two generators are $\mathbb{R}$-collinear, or $\{0\}$ when both vanish.

**`puncturedTube`.** For $U\subseteq\mathbb{C}$, this is the set $\{(x,y) : y\in U\setminus\{0\}\}$, with $x\in\mathbb{C}$ arbitrary.

**`W0`.** This is the real number
$$W_0(y)=\frac{1}{\operatorname{Im}\big(\overline{\tau_1(y)}\,\tilde\tau_2(y)\big)}.$$
It is $0$ where the imaginary part vanishes.

**`b0`.** For $p=(x,y)$, this is
$$b_0(p)=-\,\frac{\operatorname{Im}\big(\tilde\tau_2(y)\,\bar x\big)\,\tau_1'(y)+\operatorname{Im}\big(\overline{\tau_1(y)}\,x\big)\,\tilde\tau_2'(y)}{\operatorname{Im}\big(\overline{\tau_1(y)}\,\tilde\tau_2(y)\big)}.$$
It uses the junk conventions above: $\tau_1'=0$ where $\tau_1$ is not differentiable, $\tilde\tau_2'$ is as in `dTau2At`, and the value is $0$ if the denominator is $0$.

**`IsLatticePeriodic`.** This takes $U$, $\tau_1$, $\tau_2$ and any $f:\mathbb{C}^2\to F$ with $F$ an arbitrary type. It states that for every $(x,y)$ with $y\in U\setminus\{0\}$ and every $\ell\in\Lambda_y$:
$$f(x+\ell,y)=f(x,y).$$

**`frameCoeff`.** This takes $\alpha,\gamma:\mathbb{C}^2\to\mathbb{R}$, $\beta:\mathbb{C}^2\to\mathbb{C}$, indices $a,b\in\{0,1\}$ and a point $p=(x,y)$. Set $w=W_0(y)$ and $c=b_0(p)$, and evaluate $\alpha,\beta,\gamma$ at $p$. Then:
$$h_{00}=\alpha w^2,\qquad h_{01}=\alpha w^2\bar c+\bar\beta w,\qquad h_{10}=\alpha w^2 c+\beta w,$$
$$h_{11}=\alpha w^2|c|^2+\beta w\bar c+\bar\beta w c+\gamma.$$

**`wZ`, `wZbar`.** These assign the coordinates $z_0 = x$ and $z_1 = y$. So $\partial_{z_a}$ is $\partial_x$ when $a=0$ and $\partial_y$ when $a=1$. Likewise $\partial_{\bar z_b}$ is $\partial_{\bar x}$ when $b=0$ and $\partial_{\bar y}$ when $b=1$.

**`IsClosed11`.** This takes $U$ and a family $h_{ab}:\mathbb{C}^2\to\mathbb{C}$ for $a,b\in\{0,1\}$. It states that for all $p$ in the punctured tube over $U$ and both $b$:
$$\partial_x h_{1b}(p)=\partial_y h_{0b}(p).$$
Only this $\partial$-type condition is imposed. There is no condition on the $\bar z$-derivatives.

**`IsDdbarOf`.** This takes $U$, $h$ as above and $\varphi:\mathbb{C}^2\to\mathbb{R}$. It states that for all $p$ in the punctured tube over $U$ and all $a,b$:
$$h_{ab}(p)=2\,\partial_{z_a}\big(\partial_{\bar z_b}\varphi\big)(p).$$
Here $\partial_{\bar z_b}\varphi$ is taken as a function on all of $\mathbb{C}^2$. No regularity of $\varphi$ is assumed, and derivatives are $0$ wherever differentiability fails.

**`IsExactOnQuotient`.** This takes $U$, $\tau_1$, $\tau_2$ and $h$. It states that there exist $c_0,c_1:\mathbb{C}^2\to\mathbb{C}$ satisfying all of the following:

1. Each $c_a$ is $C^\infty$ (real) on the punctured tube over $U$.
2. Take any open $N\subseteq U\setminus\{0\}$ and any $\ell:\mathbb{C}\to\mathbb{C}$ holomorphic on $N$ with $\ell(y)\in\Lambda_y$ for every $y\in N$. Then for every $y\in N$ and every $x\in\mathbb{C}$:
   $$c_0(x+\ell(y),y)=c_0(x,y),\qquad c_1(x+\ell(y),y)+c_0(x+\ell(y),y)\,\ell'(y)=c_1(x,y).$$
   This is vacuous when $N=\emptyset$.
3. On the punctured tube: $\partial_x c_1-\partial_y c_0=0$.
4. On the punctured tube, for all $a,b$:
   $$\partial_{z_a}\big(\overline{c_b}\big)-\partial_{\bar z_b}c_a=\tfrac{i}{2}\,h_{ab}.$$

**`fibreIntegralC`.** For $\beta:\mathbb{C}^2\to\mathbb{C}$ and $y\in\mathbb{C}$, this is
$$\operatorname{Im}\big(\overline{\tau_1(y)}\,\tilde\tau_2(y)\big)\cdot\int_0^1\!\!\int_0^1\beta\big(s\,\tau_1(y)+t\,\tilde\tau_2(y),\,y\big)\,ds\,dt.$$
An integral is $0$ if its integrand is not integrable. The prefactor may be zero or negative.

**`annulusC`.** For real $r_1,r_2$, this is the set $\{y : r_1<|y|<r_2\}$. It contains $0$ if $r_1<0<r_2$. It is empty if $r_2\le\max(r_1,0)$.

**`ContainsFundamentalDomains`.** This takes $\tau_1$, $\tau_2$, $T\subseteq\mathbb{C}^2$ and $V\subseteq\mathbb{C}$. It states two things:

- $T\subseteq\{(x,y): y\in V\}$.
- For every $y\in V$ and $x\in\mathbb{C}$, there is some $\ell\in\Lambda_y$ with $(x+\ell,y)\in T$.

There is no uniqueness, boundedness or compactness requirement. If $\Lambda_y=\{0\}$, the fibre of $T$ over $y$ must be all of $\mathbb{C}$.

**`holderNorm`.** This takes $k\in\mathbb{N}$, any real $\mu$ (no constraint such as $0<\mu\le1$), $f:\mathbb{C}^2\to F$ with $F$ a real normed space, and $T\subseteq\mathbb{C}^2$. The value lies in $[0,\infty]$:
$$\sum_{j=0}^{k}\ \sup_{p\in T}\|D^jf(p)\|\;+\;\sup_{\substack{p,q\in T\\ p\neq q}}\frac{\|D^kf(p)-D^kf(q)\|}{\|p-q\|^{\mu}}.$$
The ingredients are:

- $D^jf(p)$ is the $j$-th iterated real Fréchet derivative of $f$ on all of $\mathbb{C}^2$, not just within $T$. It is $0$ wherever the iteration fails to be differentiable.
- Its norm is the operator norm of a multilinear map, computed with the max norm on $\mathbb{C}^2$.
- $\|p-q\|^\mu$ is the real power with exponent $\mu$.
- Suprema over the empty set are $0$, and any supremum may be $+\infty$.
