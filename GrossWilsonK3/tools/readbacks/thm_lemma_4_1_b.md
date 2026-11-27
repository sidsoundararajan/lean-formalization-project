**Read-back of `lemma_4_1_b`**

**Setting and notation.** Points of $\mathbb{C}^2 = \mathbb{C}\times\mathbb{C}$ are written $p=(x,y)$. The first coordinate $x$ is the "fibre" variable and the second, $y$, is the "base" variable. $\mathbb{C}^2$ carries the product norm $\|(x,y)\| = \max(|x|,|y|)$. For a set $U\subseteq\mathbb{C}$, the **punctured tube** is
$$\mathcal{T}_U = \{(x,y)\in\mathbb{C}^2 : y\in U\setminus\{0\}\}.$$
For $F:\mathbb{C}^2\to\mathbb{C}$, the Wirtinger-type operators are built from real Fréchet derivatives along the real directions:
$$\partial_x F = \tfrac12\big(\partial_{\operatorname{Re}x}F - i\,\partial_{\operatorname{Im}x}F\big),\qquad \partial_{\bar x} F = \tfrac12\big(\partial_{\operatorname{Re}x}F + i\,\partial_{\operatorname{Im}x}F\big),$$
and $\partial_y$, $\partial_{\bar y}$ are defined the same way. Here $\partial_{\operatorname{Re}x}F(p)$ is the real derivative of $F$ at $p$ in the direction $(1,0)$, and $\partial_{\operatorname{Im}x}F(p)$ is the one in the direction $(i,0)$; the $y$-versions use $(0,1)$ and $(0,i)$. If $F$ is not real-differentiable at $p$, the derivative there is taken to be $0$. Write $\partial_{z_0}=\partial_x$, $\partial_{z_1}=\partial_y$, $\partial_{\bar z_0}=\partial_{\bar x}$ and $\partial_{\bar z_1}=\partial_{\bar y}$.

**Data and hypotheses.** The theorem is about a set $U\subseteq\mathbb{C}$ and two arbitrary functions $\tau_1,\tau_2:\mathbb{C}\to\mathbb{C}$ such that:
- $U$ is open, $0\in U$, and $U$ (with the subspace topology) is contractible.
- $\tau_1$ is complex-differentiable on $U\setminus\{0\}$.
- $\tau_2$ is complex-differentiable on $\{s\in\mathbb{C}: e^s\in U\}$.
- For every $s$ with $e^s\in U$, $\tau_2(s+2\pi i)=\tau_2(s)+\tau_1(e^s)$.
- For every $s$ with $e^s\in U$, $\operatorname{Im}\big(\overline{\tau_1(e^s)}\,\tau_2(s)\big)>0$.

Several quantities are derived from this data, for $y\in\mathbb{C}$. They use the principal logarithm $\operatorname{Log}$.
- $\tilde\tau_2(y)=\tau_2(\operatorname{Log} y)$.
- $\tilde\tau_2'(y)=\tau_2'(\operatorname{Log} y)/y$.
- The **period lattice** $\Lambda_y=\{m\,\tau_1(y)+n\,\tilde\tau_2(y): m,n\in\mathbb{Z}\}$.
- $D(y)=\operatorname{Im}\big(\overline{\tau_1(y)}\,\tilde\tau_2(y)\big)$ and $w(y)=1/D(y)$.
- The function
$$c(x,y) = -\,\frac{\operatorname{Im}\big(\tilde\tau_2(y)\,\bar x\big)\,\tau_1'(y) + \operatorname{Im}\big(\overline{\tau_1(y)}\,x\big)\,\tilde\tau_2'(y)}{D(y)}.$$

For $y\in U\setminus\{0\}$, the positivity hypothesis applied to $s=\operatorname{Log}y$ gives $D(y)>0$. A function $f$ on $\mathbb{C}^2$ is called **lattice-periodic** if $f(x+\ell,y)=f(x,y)$ for every $(x,y)\in\mathcal{T}_U$ and every $\ell\in\Lambda_y$.

There are also four real numbers $r_1, r_1', r_2', r_2$ with
$$0<r_1<r_1'<r_2'<r_2,\qquad \{y: r_1\le|y|\le r_2\}\subseteq U\setminus\{0\}.$$
Write $A(a,b)=\{y: a<|y|<b\}$ for the open annulus.

The remaining data are:
- a natural number $k$ (and $k=0$ is allowed);
- a real number $\mu$ with $0<\mu<1$;
- two sets $T,T'\subseteq\mathbb{C}^2$, both open and bounded.

$T$ is required to "contain fundamental domains over $A(r_1,r_2)$". This means $T\subseteq\{(x,y): y\in A(r_1,r_2)\}$, and for every $y\in A(r_1,r_2)$ and every $x\in\mathbb{C}$ there is some $\ell\in\Lambda_y$ with $(x+\ell,y)\in T$. $T'$ satisfies the same condition over $A(r_1',r_2')$. In particular, both sets are nonempty.

**Hölder quantity.** For $f$ with values in a real normed space, and $j\ge 0$, let $D^j f$ be the $j$-th iterated real Fréchet derivative of $f$ on all of $\mathbb{C}^2$, with the multilinear operator norm. The quantity is
$$\|f\|_{k,\mu;S} = \sum_{j=0}^{k}\ \sup_{p\in S}\|D^jf(p)\| \;+\; \sup_{\substack{p,q\in S\\ p\ne q}} \frac{\|D^kf(p)-D^kf(q)\|}{\|p-q\|^{\mu}}\ \in[0,\infty].$$
Each supremum is taken in $[0,\infty]$, so the value can be $+\infty$.

**Assertion.** There exists a real number $C$ with the following property. $C$ may depend on all of the data above, $U,\tau_1,\tau_2,r_1,r_1',r_2',r_2,k,\mu,T,T'$, but not on $\alpha,\beta,\gamma$. Nothing prevents $C$ from being $\le 0$.

Let $\alpha,\gamma:\mathbb{C}^2\to\mathbb{R}$ and $\beta:\mathbb{C}^2\to\mathbb{C}$ be any functions. Define, at $p=(x,y)$ and writing $w=w(y)$ and $c=c(x,y)$,
$$\begin{aligned}
h_{00}&=\alpha w^2, & h_{01}&=\alpha w^2\bar c+\bar\beta w,\\
h_{10}&=\alpha w^2 c+\beta w, & h_{11}&=\alpha w^2|c|^2+\beta w\bar c+\bar\beta w c+\gamma.
\end{aligned}$$
Suppose $\alpha,\beta,\gamma$ satisfy all of the following:
1. $\alpha,\beta,\gamma$ are real-$C^\infty$ on $\mathcal{T}_U$, and each is lattice-periodic.
2. **Closedness:** $\partial_x h_{1b}=\partial_y h_{0b}$ on $\mathcal{T}_U$, for $b=0,1$.
3. **Exactness:** there exist $\eta_0,\eta_1:\mathbb{C}^2\to\mathbb{C}$ with these properties:
   - $\eta_0$ and $\eta_1$ are real-$C^\infty$ on $\mathcal{T}_U$.
   - Take any open $N\subseteq U\setminus\{0\}$ (possibly empty) and any $\ell:\mathbb{C}\to\mathbb{C}$ that is holomorphic on $N$ with $\ell(y)\in\Lambda_y$ for all $y\in N$. Then for all $y\in N$ and $x\in\mathbb{C}$:
   $$\eta_0(x+\ell(y),y)=\eta_0(x,y),\qquad \eta_1(x+\ell(y),y)+\eta_0(x+\ell(y),y)\,\ell'(y)=\eta_1(x,y).$$
   - $\partial_x\eta_1-\partial_y\eta_0=0$ on $\mathcal{T}_U$.
   - For all $a,b\in\{0,1\}$, on $\mathcal{T}_U$:
   $$\partial_{z_a}\overline{\eta_b}-\partial_{\bar z_b}\eta_a=\tfrac{i}{2}\,h_{ab}.$$
4. **Zero fibre integral:** for every $y\in U\setminus\{0\}$,
$$D(y)\int_0^1\!\!\int_0^1 \beta\big(s\,\tau_1(y)+t\,\tilde\tau_2(y),\,y\big)\,ds\,dt=0.$$
(If the integrand is not integrable, the integral is taken to be $0$.)

Then there exists $\varphi:\mathbb{C}^2\to\mathbb{R}$ such that:
- $\varphi$ is real-$C^\infty$ on $\mathcal{T}_U$ and lattice-periodic;
- for all $p\in\mathcal{T}_U$ and $a,b\in\{0,1\}$,
$$h_{ab}(p)=2\,\partial_{z_a}\big(\partial_{\bar z_b}\varphi\big)(p);$$
- the following inequality holds in $[0,\infty]$:
$$\|\varphi\|_{k+2,\mu;T'}\ \le\ \max(C,0)\cdot\big(\|\alpha\|_{k,\mu;T}+\|\beta\|_{k,\mu;T}+\|\gamma\|_{k,\mu;T}\big).$$
The left side sums $D^j\varphi$ over $j=0,\dots,k+2$ and uses the Hölder quotient of $D^{k+2}\varphi$.

**Edge cases.**
- The constant $C$ enters only through $\max(C,0)$. Arithmetic is in $[0,\infty]$ with the convention $0\cdot\infty=0$. If $C\le0$, the right side is $0$. If $C>0$ and some norm on the right is $+\infty$, the right side is $+\infty$ and the inequality holds trivially.
- The derivatives in the Hölder quantities are global derivatives on $\mathbb{C}^2$, evaluated only at points of the open sets $T,T'$. These sets lie inside $\mathcal{T}_U$, where the functions are smooth.
- $\alpha=\beta=\gamma=0$ satisfies all of hypotheses 1–4: take $\eta_0=\eta_1=0$, which makes every $h_{ab}=0$.
- The radii $r_1', r_2'$ appear only through the condition on $T'$.
- The requirement that the closed annulus avoids $0$ is already implied by $r_1>0$.
