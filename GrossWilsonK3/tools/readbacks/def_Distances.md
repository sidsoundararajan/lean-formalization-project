## Common setting

Throughout, $M$ is any type with a topology and an atlas of charts to $E_4=\mathbb R^4$ (Euclidean $\mathbb R^4$). Nothing else is assumed: there is no smooth compatibility of charts, and $M$ need not be Hausdorff, compact, connected or nonempty. Each point $x\in M$ has a preferred chart $\mathrm{chart}_x$.

All derivatives of maps into or out of $M$ are "manifold derivatives" computed in these preferred charts:

- a derivative at a point $p$ of a map $\varphi$ into $M$ is expressed in the chart at $\varphi(p)$;
- a derivative at a point $x$ of a map out of $M$ is expressed in the chart at $x$.

So tangent vectors are just vectors of $E_4$. If the map is not differentiable at the point in this chart sense, the derivative is the junk value $0$.

The other objects that appear are:

- $J$ is an arbitrary field $x\mapsto J_x$ of continuous $\mathbb R$-linear maps $E_4\to E_4$. No condition such as $J_x^2=-1$ is imposed here.
- $\kappa$ is an arbitrary field of continuous alternating $\mathbb R$-bilinear forms $E_4\times E_4\to\mathbb R$.
- $\Omega$ is the same kind of field, but with values in $\mathbb C$.
- $j:M\to\hat{\mathbb C}=\mathbb C\cup\{\infty\}$ is an arbitrary function.

None of these fields is transformed when charts change. $J_x$, $\kappa_x$ and $\Omega_x$ act directly on the coordinate vectors produced by the chart at $x$.

From the imported file:

- $\mathrm{aff}(z)=z$ for $z\in\mathbb C$, and $\mathrm{aff}(\infty)=0$ (junk value).
- $\mathrm{inv}(z)=z^{-1}$ for $z\in\mathbb C$, with $\mathrm{inv}(0)=0$ (junk, since $0^{-1}=0$), and $\mathrm{inv}(\infty)=0$.
- $d_{\mathbb C}y(x):E_4\to\mathbb C$ is the $\mathbb R$-linear manifold derivative of $y:M\to\mathbb C$ at $x$, or $0$ if $y$ is not differentiable there.

---

**`partialS`.** For a map $\varphi:\mathbb R\times\mathbb R\to M$ and a point $p=(s,t)$, $\partial_s\varphi(p)\in E_4$ is the manifold derivative of $\varphi$ at $p$ applied to the vector $(1,0)$. It is expressed in the chart at $\varphi(p)$. If $\varphi$ is not differentiable at $p$ in this chart sense, the value is $0$.

**`partialT`.** Defined in the same way: $\partial_t\varphi(p)\in E_4$ is the manifold derivative of $\varphi$ at $p$ applied to $(0,1)$, in the chart at $\varphi(p)$, and $0$ if $\varphi$ is not differentiable at $p$.

**`IsFibreParam`.** Given $J$, $j:M\to\hat{\mathbb C}$, a point $b\in\hat{\mathbb C}$ and $\varphi:\mathbb R^2\to M$, this is the conjunction of six conditions:

1. **Smooth:** $\varphi$ is $C^\infty$ in the chart sense.
2. **Periodic:** $\varphi(s+m,t+n)=\varphi(s,t)$ for all $(s,t)\in\mathbb R^2$ and all $m,n\in\mathbb Z$.
3. **Lands in the fibre:** $j(\varphi(p))=b$ for every $p$.
4. **Covers the fibre:** every $x$ with $j(x)=b$ equals $\varphi(p)$ for some $p$.
5. **Injective up to $\mathbb Z^2$:** if $\varphi(p)=\varphi(q)$, then $q=p+(m,n)$ for some $m,n\in\mathbb Z$.
6. **Oriented:** for every $p$, $\partial_s\varphi(p)\neq0$, and there exist reals $r$ and $s>0$ with
$$\partial_t\varphi(p)=r\,\partial_s\varphi(p)+s\,J_{\varphi(p)}\big(\partial_s\varphi(p)\big).$$

Edge cases:

- Condition 3 needs the fibre $j^{-1}(b)$ to be nonempty, so no such $\varphi$ exists over a point $b$ outside the image of $j$.
- Condition 6 uses $J$ with no assumption on it. Whether $\partial_s\varphi$ and $J\partial_s\varphi$ are linearly independent is not stated.

**`fibreIntegral`.** Given $J$, $j$, a functional $F$ (which takes a map $\varphi:\mathbb R^2\to M$ and a point $p\in\mathbb R^2$ and returns a real number) and $b\in\hat{\mathbb C}$:

- If some $\varphi$ satisfies `IsFibreParam` for $(J,j,b)$, the value is
$$\int_0^1\!\!\int_0^1 F(\varphi^\ast)(s,t)\,dt\,ds .$$
  Here $\varphi^\ast$ is one such parametrisation, picked arbitrarily by the axiom of choice. Both are interval integrals of Bochner type, so a non-integrable integrand gives $0$.
- If no such $\varphi$ exists, the value is $0$.

The result depends on the chosen $\varphi^\ast$ unless the integral happens to be the same for every valid parametrisation.

**`fibreArea`.** For $J$, $j$, a real 2-form field $\kappa$ and $b$:
$$\mathrm{fibreArea}(b)=\mathrm{fibreIntegral}\Big(F(\varphi)(p)=\kappa_{\varphi(p)}\big(\partial_s\varphi(p),\partial_t\varphi(p)\big)\Big).$$
In words, it integrates $\kappa(\partial_s\varphi^\ast,\partial_t\varphi^\ast)$ over $[0,1]^2$ for the chosen parametrisation of the fibre over $b$. It is $0$ if no parametrisation exists.

**`liftOne`.** For $y:M\to\mathbb C$ and $x\in M$:

- If some $v\in E_4$ satisfies $d_{\mathbb C}y(x)(v)=1$, then $\mathrm{lift}_y(x)$ is one such $v$, chosen arbitrarily. It is not unique: anything in the kernel can be added.
- Otherwise $\mathrm{lift}_y(x)=0$. This happens, for example, when $y$ is not differentiable at $x$, or when its derivative is $0$ there.

**`mcLeanDensity`.** For $J$, $\Omega$, $j$, an auxiliary function $y:M\to\mathbb C$ and $b$:
$$\mathrm{fibreIntegral}\Big(F(\varphi)(p)=\operatorname{Im}\Big[\overline{\Omega_{\varphi(p)}\big(v,\partial_s\varphi(p)\big)}\;\Omega_{\varphi(p)}\big(v,\partial_t\varphi(p)\big)\Big]\Big),\qquad v=\mathrm{lift}_y(\varphi(p)).$$
It is $0$ if no fibre parametrisation over $b$ exists. Nothing links $y$ to $j$ in this definition.

**`IsC1SphereCurve`.** A curve $c:\mathbb R\to\hat{\mathbb C}$ (defined on all of $\mathbb R$) qualifies when:

- $c$ is continuous; and
- for every $t\in\mathbb R$:
  - if $c(t)\neq\infty$, then $\mathrm{aff}\circ c$ is $C^1$ at $t$ (as a map $\mathbb R\to\mathbb C$);
  - if $c(t)\neq0$, then $\mathrm{inv}\circ c$ is $C^1$ at $t$.

**`baseSpeed`.** For $J$, $\Omega$, $j$, a curve $c:\mathbb R\to\hat{\mathbb C}$ and $t\in\mathbb R$, there are three cases.

- **Critical value:** if $c(t)$ is a critical value of $j$, the value is $0$. A point $b$ is a critical value when $b=j(x)$ for some $x$ with $d_{\mathbb C}(\ell_x)(x)=0$. Here the local coordinate is $\ell_x=\mathrm{inv}\circ j$ if $j(x)=\infty$, and $\ell_x=\mathrm{aff}\circ j$ otherwise. Because the derivative is $0$ at non-differentiable points, the image of any point where $\ell_x$ is not differentiable also counts as a critical value.
- **At $\infty$:** if $c(t)=\infty$ (and it is not a critical value), the value is
$$\big|(\mathrm{inv}\circ c)'(t)\big|\cdot\sqrt{\mathrm{mcLeanDensity}(J,\Omega,j,\ \mathrm{inv}\circ j,\ c(t))}.$$
- **Otherwise:** the value is
$$\big|(\mathrm{aff}\circ c)'(t)\big|\cdot\sqrt{\mathrm{mcLeanDensity}(J,\Omega,j,\ \mathrm{aff}\circ j,\ c(t))}.$$

In all cases $(\cdot)'$ is the ordinary derivative, which is $0$ if the function is not differentiable at $t$. The absolute value is the complex modulus. The real square root of a negative number is $0$. So the value is always $\ge0$.

**`mcLeanDist`.** For $J$, $\Omega$, $j$ and $b_1,b_2\in\hat{\mathbb C}$, first form
$$D=\inf\Big\{\int^{-}_{[0,1]}\mathrm{baseSpeed}(J,\Omega,j,c,t)\,dt\ :\ c\text{ is a }C^1\text{ sphere curve},\ c(0)=b_1,\ c(1)=b_2\Big\}.$$
The integral is the lower Lebesgue integral of a $[0,\infty]$-valued function, taken over the closed interval $[0,1]$ (negative values would be clipped to $0$, but none occur). The infimum is taken in $[0,\infty]$, and the value of `mcLeanDist` is $D$ converted to a real number.

Junk value: if $D=\infty$, including when no admissible curve exists (the infimum of an empty set is $\infty$), the result is $0$.

**`curveVel`.** For $\gamma:\mathbb R\to M$ and $t$, $\dot\gamma(t)\in E_4$ is the manifold derivative of $\gamma$ at $t$ applied to $1$. It is expressed in the chart at $\gamma(t)$, and is $0$ if $\gamma$ is not differentiable at $t$.

**`riemDist`.** Here $g:M\to(E_4\to E_4\to\mathbb R)$ is an arbitrary function. It is not assumed to be bilinear, symmetric, positive or continuous. For $x,y\in M$, first form
$$D=\inf\Big\{\int^{-}_{[0,1]}\sqrt{g_{\gamma(t)}\big(\dot\gamma(t),\dot\gamma(t)\big)}\,dt\ :\ \gamma:\mathbb R\to M\ \text{is }C^1\text{ (chart sense)},\ \gamma(0)=x,\ \gamma(1)=y\Big\}.$$

- The square root of a negative number is $0$.
- The integral is the lower Lebesgue integral in $[0,\infty]$ over $[0,1]$.
- $g$ is applied to the chart-coordinate velocity at $\gamma(t)$, with no change of chart.
- The infimum is taken in $[0,\infty]$, and the value of `riemDist` is $D$ converted to a real number.

Junk value: if $D=\infty$, in particular when no $C^1$ curve joins $x$ to $y$, the value is $0$.
