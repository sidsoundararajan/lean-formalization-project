**Setting and notation.** Points of $\mathbb{C}^2$ are written $p=(x,y)$. All derivatives below are Wirtinger derivatives built from the **real** Fréchet derivative. For $F:\mathbb{C}^2\to\mathbb{C}$, with $x=x_1+ix_2$ and $y=y_1+iy_2$,
$$\partial_x F=\tfrac12\big(\partial_{x_1}F-i\,\partial_{x_2}F\big),\quad \partial_{\bar x}F=\tfrac12\big(\partial_{x_1}F+i\,\partial_{x_2}F\big),$$
and $\partial_y$, $\partial_{\bar y}$ are defined the same way in the second coordinate. If $F$ is not real-differentiable at $p$, the convention gives all of these the value $0$ there. We write $Z_0=x$ and $Z_1=y$, so $\partial_{Z_0}=\partial_x$, $\partial_{Z_1}=\partial_y$, and likewise for the barred versions. "Smooth" always means real $C^\infty$ (not analytic). $\operatorname{Log}$ is the principal branch of the complex logarithm. For a function $\ell:\mathbb{C}\to\mathbb{C}$, $\ell'$ is its complex derivative, and it is $0$ wherever $\ell$ is not complex-differentiable.

**Data and hypotheses.** The statement has the following ingredients:

- A set $U\subseteq\mathbb{C}$ and two arbitrary functions $\tau_1,\tau_2:\mathbb{C}\to\mathbb{C}$. These satisfy the following ("I1 period data"):
  - $U$ is open, $0\in U$, and $U$ is contractible in its subspace topology.
  - $\tau_1$ is holomorphic on $U\setminus\{0\}$.
  - $\tau_2$ is holomorphic on $\exp^{-1}(U)=\{s: e^s\in U\}$.
  - For every $s$ with $e^s\in U$:
$$\tau_2(s+2\pi i)=\tau_2(s)+\tau_1(e^s),\qquad \operatorname{Im}\big(\overline{\tau_1(e^s)}\,\tau_2(s)\big)>0.$$
- Write $\tilde\tau_2(y)=\tau_2(\operatorname{Log}y)$ and $D(y)=\operatorname{Im}\big(\overline{\tau_1(y)}\,\tilde\tau_2(y)\big)$. Taking $s=\operatorname{Log}y$ shows $D(y)>0$ for every $y\in U\setminus\{0\}$.
- The **punctured tube** is $P=\{(x,y): y\in U\setminus\{0\}\}$, which is open.
- For each $y$, the **lattice** is $\Lambda_y=\{m\,\tau_1(y)+n\,\tilde\tau_2(y): m,n\in\mathbb{Z}\}$. Note that it uses the principal-branch value $\tau_2(\operatorname{Log}y)$.
- A function $f$ on $\mathbb{C}^2$ is called **lattice-periodic** if $f(x+\ell,y)=f(x,y)$ for every $(x,y)\in P$ and every $\ell\in\Lambda_y$.
- Two real functions $\alpha,\gamma:\mathbb{C}^2\to\mathbb{R}$ and one complex function $\beta:\mathbb{C}^2\to\mathbb{C}$. All three are smooth on $P$ and lattice-periodic. Nothing is assumed about them off $P$, at $y=0$, or about their signs.

**The coefficient matrix.** For $p=(x,y)$, set
$$w(y)=\frac{1}{D(y)},\qquad c(p)=-\,\frac{\operatorname{Im}\big(\tilde\tau_2(y)\,\bar x\big)\,\tau_1'(y)+\operatorname{Im}\big(\overline{\tau_1(y)}\,x\big)\,\dfrac{\tau_2'(\operatorname{Log}y)}{y}}{D(y)}.$$
The functions $h_{ab}:\mathbb{C}^2\to\mathbb{C}$ for $a,b\in\{0,1\}$ are
$$h_{00}=\alpha w^2,\quad h_{01}=\alpha w^2\bar c+\bar\beta w,\quad h_{10}=\alpha w^2 c+\beta w,\quad h_{11}=\alpha w^2|c|^2+\beta w\bar c+\bar\beta w c+\gamma.$$
These are defined pointwise through the principal $\operatorname{Log}$.

**Closedness hypothesis.** For every $p\in P$ and each $b\in\{0,1\}$:
$$\partial_x h_{1b}(p)=\partial_y h_{0b}(p).$$

**Conclusion.** The theorem asserts that statements (L) and (R) below are equivalent (an "if and only if").

**(L)** There exists $\varphi:\mathbb{C}^2\to\mathbb{R}$ with all three of these properties:
- $\varphi$ is smooth on $P$;
- $\varphi$ is lattice-periodic;
- for all $p\in P$ and all $a,b\in\{0,1\}$,
$$h_{ab}(p)=2\,\partial_{Z_a}\big(\partial_{\bar Z_b}\varphi\big)(p).$$

**(R)** Both of the following hold.

1. **Exactness on the quotient.** There exist $c_0,c_1:\mathbb{C}^2\to\mathbb{C}$ with all four of these properties:
   - (i) $c_0$ and $c_1$ are smooth on $P$.
   - (ii) Take any open $N\subseteq U\setminus\{0\}$ and any $\ell:\mathbb{C}\to\mathbb{C}$ that is holomorphic on $N$ with $\ell(y)\in\Lambda_y$ for all $y\in N$. Then for all $y\in N$ and all $x\in\mathbb{C}$:
$$c_0(x+\ell(y),y)=c_0(x,y),\qquad c_1(x+\ell(y),y)+c_0(x+\ell(y),y)\,\ell'(y)=c_1(x,y).$$
   - (iii) For all $p\in P$: $\partial_x c_1(p)-\partial_y c_0(p)=0$.
   - (iv) For all $p\in P$ and all $a,b\in\{0,1\}$:
$$\partial_{Z_a}\big(\overline{c_b}\big)(p)-\partial_{\bar Z_b}(c_a)(p)=\tfrac{i}{2}\,h_{ab}(p).$$
2. **Vanishing fibre integral.** For every $y\in U\setminus\{0\}$:
$$D(y)\int_0^1\!\!\int_0^1\beta\big(s\,\tau_1(y)+t\,\tilde\tau_2(y),\,y\big)\,ds\,dt=0.$$
   - The inner integral is over $s$ and the outer over $t$.
   - The integrals are Bochner interval integrals, which take the value $0$ when the integrand is not integrable.
   - Since $D(y)>0$ on $U\setminus\{0\}$, this is the same as the double integral being $0$.

**Edge cases and conventions.**
- Every condition is imposed only on $P$, so only for $y\ne0$. Nothing is required at $y=0$ or outside $U$.
- In (R)(ii), the condition is vacuous for any pair $(N,\ell)$ with $N$ empty.
- The function $\ell$ in (R)(ii) is arbitrary off $N$, and $\ell'$ is its complex derivative.
- The derivative conventions above mean every Wirtinger derivative is read as $0$ at any point where its argument is not real-differentiable.
