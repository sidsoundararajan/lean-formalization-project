**Read-back of `thm_6_4`.**

**Ambient manifold.** Let $M$ be a topological space with an atlas of charts into $E = \mathbb{R}^4$, the Euclidean space $\mathbb{R}^{\mathrm{Fin}\,4}$. The atlas is a smooth ($C^\infty$) manifold structure with the trivial model, so $M$ has no boundary. $M$ is assumed to be Hausdorff, compact, connected and simply connected. Following the library's convention, the tangent space at every point $x$ is $\mathbb{R}^4$ itself, read through the preferred chart at $x$. All the "fields" below are plain pointwise data on that $\mathbb{R}^4$:

- an *endomorphism field* is any function $x \mapsto A_x \in \mathrm{End}_{\mathbb{R}}(\mathbb{R}^4)$, with no continuity built in;
- a *real (complex) 2-form* is any function $x \mapsto \eta_x$, where $\eta_x$ is a continuous alternating $\mathbb{R}$-bilinear map $\mathbb{R}^4 \times \mathbb{R}^4 \to \mathbb{R}$ (respectively $\to \mathbb{C}$).

Smoothness and closedness are tested chart by chart. For each $x_0$, pull $\eta$ back along the inverse of the extended chart at $x_0$, using its manifold derivative. The form is **smooth** if this chart representative is $C^\infty$ on the chart's target, and **closed** if its exterior derivative vanishes at every point of the target. An endomorphism field is smooth in the same way: conjugate it by the chart derivatives and ask for $C^\infty$ on each chart target.

**Data and hypotheses on the "K3" side.** The theorem takes the following data: $J_0$ (an endomorphism field), $\Omega_0$ (a complex 2-form), $j : M \to \hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\}$ (the one-point compactification) and $\sigma_0 : \hat{\mathbb{C}} \to M$. Two junk-valued coordinate maps on $\hat{\mathbb{C}}$ are used:

- $\mathrm{aff}(z) = z$ and $\mathrm{aff}(\infty) = 0$;
- $\mathrm{inv}(z) = z^{-1}$ and $\mathrm{inv}(\infty) = 0$, which also gives $\mathrm{inv}(0) = 0^{-1} = 0$.

The real differential of a function $\varphi : M \to \mathbb{C}$ at $x$ is $d\varphi_x : \mathbb{R}^4 \to \mathbb{C}$. It is the manifold derivative, which is $0$ wherever $\varphi$ is not differentiable. The hypotheses are:

1. **(IsK3)**
   - $J_0$ satisfies $J_{0,x}^2 = -\mathrm{id}$ at every $x$ and is smooth in every chart.
   - $\Omega_0$ is smooth and closed.
   - $\Omega_0$ is of type $(2,0)$: $\Omega_{0,x}(J_{0,x}u, v) = i\,\Omega_{0,x}(u,v)$ for all $x, u, v$.
   - $\Omega_{0,x} \neq 0$ for every $x$.
   - No integrability of $J_0$, no metric and no other condition is assumed.
2. **(Elliptic fibration)**
   - $j$ is continuous.
   - At each $x$ with $j(x) \neq \infty$, the map $\mathrm{aff}\circ j$ is $C^\infty$ at $x$ and satisfies $d(\mathrm{aff}\circ j)_x(J_{0,x}u) = i\, d(\mathrm{aff}\circ j)_x(u)$ for all $u$.
   - At each $x$ with $j(x) \neq 0$, the same holds for $\mathrm{inv}\circ j$.
   - $j$ is surjective, and every fibre $j^{-1}(b)$ is connected. Fibres are nonempty because $j$ is surjective.
3. **(Singular fibres)**
   - Use the local coordinate $y_x = \mathrm{inv}\circ j$ if $j(x) = \infty$, and $y_x = \mathrm{aff}\circ j$ otherwise.
   - A point $x$ is *critical* if $d(y_x)_x = 0$. A critical value is a value $j(x)$ at some critical point $x$.
   - Every critical point $x$ is *nondegenerate*: for every $u \neq 0$ in $\mathbb{R}^4$ there is a $v$ with $D^2\big(y_x \circ \phi_x^{-1}\big)(\phi_x(x))(u,v) \neq 0$. Here $\phi_x$ is the extended chart at $x$ and $D^2$ is the iterated real Fréchet derivative.
   - Distinct critical points have distinct images under $j$.
   - Nothing requires critical points to exist, or fixes how many there are.
4. **(Holomorphic section)**
   - $j(\sigma_0(b)) = b$ for every $b$.
   - Both $s(z) = \sigma_0(z)$ and $s'(w) = \sigma_0(1/w)$ (for $w \neq 0$), with $s'(0) = \sigma_0(\infty)$, are $C^\infty$ maps $\mathbb{C} \to M$.
   - Both satisfy $ds_z(i a) = J_{0,s(z)}\, ds_z(a)$ for all $z, a \in \mathbb{C}$.
   - $\sigma_0$ appears nowhere else in the theorem.

**Sequences.** For each $i \in \mathbb{N}$ there are the following data.

- **Base forms $\alpha_i$.** Each $\alpha_i$ is a pair of $C^\infty$ (as real maps) functions $a_0^{(i)}, a_\infty^{(i)} : \mathbb{C} \to \mathbb{C}$ with $a_\infty^{(i)}(w) = a_0^{(i)}(w^{-1}) / |w|^4$ for $w \neq 0$.
- **Forms $\Omega_i$.** Each $\Omega_i$ is a complex 2-form, an endomorphism field $J_i$, a real 2-form $\kappa_i$ and a real number $\varepsilon_i$. For all $i, x, u, v$:
$$\Omega_{i,x}(u,v) = \Omega_{0,x}(u,v) + P_i(x)(u,v).$$
  Here $\mathrm{ar}(p,q) = \mathrm{Re}\,p\,\mathrm{Im}\,q - \mathrm{Im}\,p\,\mathrm{Re}\,q$, and
$$P_i(x)(u,v) = \begin{cases} a_\infty^{(i)}(0)\cdot \mathrm{ar}\big(d(\mathrm{inv}\circ j)_x u,\ d(\mathrm{inv}\circ j)_x v\big) & j(x) = \infty,\\[2pt] a_0^{(i)}(j(x))\cdot \mathrm{ar}\big(d(\mathrm{aff}\circ j)_x u,\ d(\mathrm{aff}\circ j)_x v\big) & \text{otherwise.}\end{cases}$$
- **Complex structures $J_i$.** Each $J_i$ satisfies $J_i^2 = -\mathrm{id}$ pointwise and is smooth in charts. $\Omega_i$ is of type $(2,0)$ for $J_i$, meaning $\Omega_{i,x}(J_{i,x}u, v) = i\,\Omega_{i,x}(u,v)$. Nothing else links $J_i$ to $J_0$.
- **Kähler forms $\kappa_i$.**
  - $\kappa_i$ is smooth and closed.
  - It is $J_i$-invariant: $\kappa_{i,x}(J_i u, J_i v) = \kappa_{i,x}(u,v)$.
  - The bilinear form $g_{i,x}(u,v) := \kappa_{i,x}(u, J_{i,x} v)$ satisfies $g_{i,x}(u,u) > 0$ for every $u \neq 0$.
- **"Ricci-flat" identity.** For all $i, x$ and all $v_0,\dots,v_3 \in \mathbb{R}^4$:
$$(\kappa_{i,x}\wedge\kappa_{i,x})(v_0,\dots,v_3) = (\mathrm{Re}\,\Omega_{i,x}\wedge \mathrm{Re}\,\Omega_{i,x})(v_0,\dots,v_3).$$
  Here $(\alpha\wedge\beta)(v_0,\dots,v_3)$ is the sum over the six $(2,2)$-shuffles, with signs and no normalising factor:
$$\alpha_{01}\beta_{23} - \alpha_{02}\beta_{13} + \alpha_{03}\beta_{12} + \alpha_{12}\beta_{03} - \alpha_{13}\beta_{02} + \alpha_{23}\beta_{01},$$
  where $\alpha_{ab} = \alpha(v_a, v_b)$.

**Fibre area.**

- *Fibre parametrisation of $b$.* This is a $C^\infty$ map $\varphi : \mathbb{R}^2 \to M$ with the following properties:
  - it is $\mathbb{Z}^2$-periodic;
  - its image is exactly $j^{-1}(b)$;
  - it is injective modulo $\mathbb{Z}^2$;
  - $\partial_s\varphi \neq 0$ everywhere;
  - $\partial_t\varphi = r\,\partial_s\varphi + s\,J_0\partial_s\varphi$ for some $r$ and some $s > 0$. The orientation is taken with respect to $J_0$, not $J_i$.
- *Fibre integral* $\int_b F$. If such a $\varphi$ exists, fix one by arbitrary choice and take $\int_0^1\!\int_0^1 F_\varphi(s,t)\,dt\,ds$. If none exists, the value is $0$.
- *Area hypothesis.* $\mathrm{Area}_i(b) = \int_b \kappa_i(\partial_s\varphi, \partial_t\varphi)$, and the theorem requires $\mathrm{Area}_i(b) = \varepsilon_i$ for every $i$ and every $b \in \hat{\mathbb{C}}$ that is not a critical value. This includes $b = \infty$ when $\infty$ is regular.
  - If some regular value has no parametrisation, this forces $\varepsilon_i = 0$.
  - No sign condition is imposed on $\varepsilon_i$.
- *Limit.* Finally, $\varepsilon_i \to 0$ as $i \to \infty$.

**Conclusion.** For every $\delta > 0$ there is an $N$ such that for every $i \ge N$ there exist maps $f : M \to \hat{\mathbb{C}}$ and $g : \hat{\mathbb{C}} \to M$. Nothing requires them to be continuous or measurable. For all $x, x_1, x_2 \in M$ and $y, y_1, y_2 \in \hat{\mathbb{C}}$ they satisfy:
$$|d_i(x_1,x_2) - d_\infty(f x_1, f x_2)| < \delta,\quad d_i(x, g(f(x))) < \delta,$$
$$|d_\infty(y_1,y_2) - d_i(g y_1, g y_2)| < \delta,\quad d_\infty(y, f(g(y))) < \delta.$$
The argument order is as written. Neither function is assumed to be symmetric or to be a metric.

**The distance $d_i$ on $M$.** It is defined by
$$d_i(x,y) = \sqrt{\varepsilon_i}\cdot \rho_i(x,y),$$
where $\sqrt{\cdot}$ is the real square root, which returns $0$ on negative inputs. So $d_i \equiv 0$ whenever $\varepsilon_i < 0$. The factor $\rho_i(x,y)$ is computed as follows:

- Take the infimum, in $[0,\infty]$, of $\int_{[0,1]} \sqrt{g_{i,\gamma(t)}(\dot\gamma(t),\dot\gamma(t))}\,dt$.
- The infimum runs over all $C^1$ maps $\gamma : \mathbb{R} \to M$ (on all of $\mathbb{R}$) with $\gamma(0) = x$ and $\gamma(1) = y$.
- $\dot\gamma(t)$ is the manifold derivative in the chart at $\gamma(t)$.
- The infimum is then converted to a real number, with the value $\infty$ (including the infimum over an empty family) sent to $0$.

**The distance $d_\infty$ on $\hat{\mathbb{C}}$.** It is $\mathrm{McLean}(J_0, \Omega_0, j)$, built only from the original $J_0$ and $\Omega_0$, not from the $\Omega_i$.

- **Curves.** $d_\infty(b_1,b_2)$ is the infimum, in $[0,\infty]$ and then converted to real with $\infty \mapsto 0$, of $\int_{[0,1]} \mathrm{speed}_c(t)\,dt$. The infimum runs over continuous curves $c : \mathbb{R} \to \hat{\mathbb{C}}$ with $c(0) = b_1$ and $c(1) = b_2$ that satisfy, at every $t$:
  - $\mathrm{aff}\circ c$ is $C^1$ at $t$ when $c(t) \neq \infty$;
  - $\mathrm{inv}\circ c$ is $C^1$ at $t$ when $c(t) \neq 0$.
- **Speed.** It is $0$ when $c(t)$ is a critical value. Otherwise it is
  - $|(\mathrm{inv}\circ c)'(t)|\sqrt{\mu_{\mathrm{inv}\circ j}(\infty)}$ when $c(t) = \infty$;
  - $|(\mathrm{aff}\circ c)'(t)|\sqrt{\mu_{\mathrm{aff}\circ j}(c(t))}$ otherwise.
  - Negative densities again give square root $0$.
- **Density.** The density is the fibre integral (with the same parametrisation convention and the same $0$ junk value)
$$\mu_y(b) = \int_b \mathrm{Im}\Big(\overline{\Omega_0(\ell, \partial_s\varphi)}\;\Omega_0(\ell, \partial_t\varphi)\Big).$$
  Here $\ell = \ell_y(\varphi(p))$ is some vector $v$ with $dy_{\varphi(p)}(v) = 1$, chosen arbitrarily, or $0$ if no such $v$ exists. The statement does not assert that the result is independent of this choice.
