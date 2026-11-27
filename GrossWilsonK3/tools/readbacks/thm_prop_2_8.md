**Read-back of `prop_2_8`.**

**Data and hypotheses.** Fix real numbers $R_0, R$ with $0 < R_0 < R$. Let $D_R = \{y \in \mathbb{C} : |y| < R\}$ be the open disc of radius $R$. Let $\tau : \mathbb{C} \to \mathbb{C}$ be complex-differentiable (holomorphic) on $D_R$, with $\operatorname{Im}\tau(y) > 0$ for every $y \in D_R$. Its values outside $D_R$ are unconstrained. Write points of $\mathbb{C}^2$ as $p = (x, y)$, with $x = x_1 + i x_2$. For $r \in \mathbb{R}$ let

$$T_r = \{(x,y) \in \mathbb{C}^2 : |y| < r\}$$

be the tube over the disc of radius $r$. Here $x$ ranges over all of $\mathbb{C}$. Use the Wirtinger operators

$$\partial_x F = \tfrac12\left(\tfrac{\partial F}{\partial x_1} - i\,\tfrac{\partial F}{\partial x_2}\right), \qquad \partial_y F = \tfrac12\left(\tfrac{\partial F}{\partial y_1} - i\,\tfrac{\partial F}{\partial y_2}\right).$$

They are computed from the real Fréchet derivative. At a point where $F$ is not real-differentiable this derivative is taken to be $0$, but every function they are applied to below is smooth on the open set $T_R$.

The theorem quantifies over three sequences indexed by $i \in \mathbb{N} = \{0,1,2,\dots\}$:
- real functions $W_i : \mathbb{C}^2 \to \mathbb{R}$;
- complex functions $b_i : \mathbb{C}^2 \to \mathbb{C}$;
- real numbers $\varepsilon_i$.

For every $i$, the pair $(W, b) = (W_i, b_i)$ must satisfy all of the following. This is the full content of the predicate "$S^1$-invariant Ricci-flat in canonical coordinates over radius $R$ with period $\tau$"; it contains no other condition.
1. $W$ and $b$ are $C^\infty$ on $T_R$, as functions of the four real variables.
2. $W(p) > 0$ for all $p \in T_R$.
3. For every $(x,y) \in T_R$ and **every real** $t$: $W(x+t, y) = W(x,y)$ and $b(x+t,y) = b(x,y)$.
4. For every $(x,y) \in T_R$: $W(x+\tau(y), y) = W(x,y)$ and $b(x+\tau(y), y) = b(x,y) - \tau'(y)$, where $\tau'$ is the complex derivative of $\tau$.
5. On $T_R$: $\partial_y W = \partial_x (W b)$, with $W$ regarded as complex-valued.
6. On $T_R$:
$$\partial_y\big(W\,\overline{b}\big) = \partial_x\big(W^{-1} + W\,|b|^2\big).$$

The fibre-volume hypothesis says that for every $i$ and every $y \in D_R$,

$$\operatorname{Im}\tau(y)\int_0^1\!\!\int_0^1 W_i\big(s + t\,\tau(y),\, y\big)\,ds\,dt = \varepsilon_i .$$

Notes on this hypothesis:
- The left side is required to equal the same number $\varepsilon_i$ for every $y$ in the disc.
- The integrals are Lebesgue integrals over $[0,1]$. A non-integrable integrand would give the value $0$, but here the points $(s + t\tau(y), y)$ lie in $T_R$, where $W_i$ is continuous.
- Since $W_i > 0$, $\operatorname{Im}\tau > 0$ and $D_R \ni 0$ is nonempty, this hypothesis forces $\varepsilon_i > 0$ for every $i$. So $\varepsilon_i^{-1}$ below is a genuine reciprocal, not the junk value $0^{-1} = 0$.

Finally, $\varepsilon_i \to 0$ as $i \to \infty$.

**Conclusion.** Both of the following hold.

(a) $W_i \to 0$ uniformly on the smaller tube $T_{R_0}$:

$$\sup_{x \in \mathbb{C},\ |y| < R_0} |W_i(x,y)| \longrightarrow 0 \quad (i\to\infty).$$

The supremum runs over all $x \in \mathbb{C}$, unbounded.

(b) For each fixed $y_0 \in D_R$ (the full radius $R$, not $R_0$), the functions $x \mapsto \varepsilon_i^{-1}\, W_i(x, y_0)\, \operatorname{Im}\tau(y_0)$ converge to the constant $1$ uniformly in $x \in \mathbb{C}$:

$$\sup_{x \in \mathbb{C}} \left|\frac{W_i(x,y_0)\,\operatorname{Im}\tau(y_0)}{\varepsilon_i} - 1\right| \longrightarrow 0 \quad (i \to \infty).$$

This uniformity is in $x$ only. For different $y_0$ the rate of convergence may differ; nothing is said about uniformity in $y_0$.

**Remarks on scope.**
- The hypotheses involve $W_i, b_i$ only on $T_R$. Values of $W_i$ outside $T_R$ never enter the conclusion, because $T_{R_0} \subseteq T_R$ and $y_0 \in D_R$.
- No condition links different indices $i$, apart from $\varepsilon_i \to 0$.
- This read-back does not determine whether sequences satisfying all the hypotheses exist. If none exist, the statement is vacuously true.
