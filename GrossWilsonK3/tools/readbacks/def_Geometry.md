**`E4`.** The real vector space $\mathbb{R}^4$, written $E_4$, with coordinates indexed by $\{0,1,2,3\}$ and the Euclidean ($\ell^2$) norm and inner product.

**`I4`.** The trivial model with corners on $E_4$: the identity map $E_4 \to E_4$, with range all of $E_4$. Under this model, the "extended chart" at a point is just the atlas chart at that point. There are no boundary or corner effects.

**Standing context (the `variable` line).** Every declaration below that mentions $M$ takes an implicit type $M$ with a topology and a *charted-space structure modelled on $E_4$*. That structure gives each point $x\in M$ one preferred chart $\varphi_x$ from an atlas. $\varphi_x$ is a homeomorphism from an open set $U_x \ni x$ onto an open set $\varphi_x(U_x)\subseteq E_4$. This is the "target" of the chart. No other structure is assumed:
- the transition maps are not assumed smooth, or even differentiable (there is no smooth-manifold structure);
- $M$ is not assumed Hausdorff, second countable, compact, connected or nonempty.

The inverse $\varphi_x^{-1}$ is treated as a total function $E_4\to M$, with unspecified (junk) values outside $\varphi_x(U_x)$. The tangent space of $M$ at any point is $E_4$ itself. A derivative of a map into or out of $M$ at a point $p$ is computed in the preferred chart $\varphi_p$ at $p$. If the coordinate expression is not differentiable there, or the map is not continuous there, the derivative is defined to be $0$.

**`RealTwoForm`.** For any type $M$ (no structure needed), a "real two-form" on $M$ is an arbitrary function assigning to each $x\in M$ a continuous alternating $\mathbb{R}$-bilinear map $E_4\times E_4\to\mathbb{R}$. Nothing is required about continuity or smoothness in $x$. There is no tie to charts: the same alternating map on $E_4$ is attached to $x$ whatever chart is used.

**`ComplexTwoForm`.** This is the same as `RealTwoForm`, except that values lie in $\mathbb{C}$. Each $\Omega(x)$ is a continuous alternating map $E_4\times E_4\to\mathbb{C}$ that is $\mathbb{R}$-bilinear, but not required to be $\mathbb{C}$-linear in any sense.

**`EndField`.** For any type $M$, an "endomorphism field" is an arbitrary function $A$ assigning to each $x\in M$ a continuous $\mathbb{R}$-linear map $A(x):E_4\to E_4$. Nothing is required in $x$.

**`formInChart`.** It takes:
- a real normed space $F$;
- a natural number $n$;
- a field $\eta$ assigning to each $x\in M$ a continuous alternating $\mathbb{R}$-multilinear $n$-form $\eta(x)$ on $E_4$ with values in $F$;
- a base point $x_0\in M$;
- a point $y\in E_4$.

Put $p=\varphi_{x_0}^{-1}(y)$. The result is the alternating $n$-form on $E_4$
$$(\eta)_{x_0}(y)(v_1,\dots,v_n)=\eta(p)\big(L v_1,\dots,L v_n\big),$$
where $L$ is the manifold derivative of $\varphi_{x_0}^{-1}$ at $y$. Concretely, $L$ is the derivative at $y$ of the transition map $\varphi_p\circ\varphi_{x_0}^{-1}$, which goes from the chart at $x_0$ to the preferred chart at $p$.
- If that transition is not differentiable at $y$ (or $\varphi_{x_0}^{-1}$ is not continuous at $y$), then $L=0$. For $n\ge1$ the form is then $0$; for $n=0$ it is $\eta(p)$.
- For $y$ outside $\varphi_{x_0}(U_{x_0})$, $p$ is a junk point.

**`IsSmoothForm`.** Take $F$, $n$ and $\eta$ as in `formInChart`. $\eta$ is "smooth" when, for every $x_0\in M$, the map $y\mapsto(\eta)_{x_0}(y)$ is $C^\infty$ on the open set $\varphi_{x_0}(U_{x_0})\subseteq E_4$. Here $C^\infty$ means infinitely differentiable, not analytic, and the map takes values in the normed space of continuous alternating $F$-valued $n$-forms on $E_4$. Only the preferred chart $\varphi_{x_0}$ of each point $x_0$ is tested, and the derivative factor uses the preferred chart at $\varphi_{x_0}^{-1}(y)$, as described above.

**`IsClosedForm`.** Take $F$, $n$ and $\eta$ as above. $\eta$ is "closed" when, for every $x_0\in M$ and every $y\in\varphi_{x_0}(U_{x_0})$, the exterior derivative of $y\mapsto(\eta)_{x_0}(y)$ vanishes at $y$:
$$d\big((\eta)_{x_0}\big)(y)=0.$$
This exterior derivative is the $(n+1)$-form obtained by alternating the Fréchet derivative at $y$. If $(\eta)_{x_0}$ is not differentiable at $y$, the Fréchet derivative is $0$ by convention, so the condition holds automatically at such $y$. Smoothness is not required by this predicate.

**`endInChart`.** It takes an endomorphism field $A$, a point $x_0\in M$ and a point $y\in E_4$. Put $p=\varphi_{x_0}^{-1}(y)$. The result is the linear map $E_4\to E_4$
$$P\circ A(p)\circ L,$$
where:
- $L$ is the manifold derivative of $\varphi_{x_0}^{-1}$ at $y$, that is, the derivative of $\varphi_p\circ\varphi_{x_0}^{-1}$ at $y$;
- $P$ is the manifold derivative of $\varphi_{x_0}$ at $p$, that is, the derivative of $\varphi_{x_0}\circ\varphi_p^{-1}$ at $\varphi_p(p)$.

Each factor is $0$ if the corresponding map is not differentiable or not continuous there. $y$ outside the chart target gives a junk $p$.

**`IsAlmostComplex`.** An endomorphism field $J$ is "almost complex" when both of the following hold:
1. For every $x\in M$, $J(x)\circ J(x)=-\mathrm{id}_{E_4}$. This is a condition on the raw linear map $J(x)$ itself, with no chart involved.
2. For every $x_0\in M$, the map $y\mapsto P\circ J(\varphi_{x_0}^{-1}(y))\circ L$ from `endInChart` is $C^\infty$ on $\varphi_{x_0}(U_{x_0})$.

No integrability (vanishing Nijenhuis tensor) is required.

**`rePart`.** For a complex two-form $\Omega$, $\operatorname{Re}\Omega$ is the real two-form $x\mapsto \operatorname{Re}\circ\Omega(x)$, so that $(\operatorname{Re}\Omega)(x)(u,v)=\operatorname{Re}\big(\Omega(x)(u,v)\big)$.

**`wedge22`.** It takes two continuous alternating real bilinear forms $\alpha,\beta$ on $E_4$ and four vectors $v_0,v_1,v_2,v_3\in E_4$. It returns the real number
$$\alpha(v_0,v_1)\beta(v_2,v_3)-\alpha(v_0,v_2)\beta(v_1,v_3)+\alpha(v_0,v_3)\beta(v_1,v_2)+\alpha(v_1,v_2)\beta(v_0,v_3)-\alpha(v_1,v_3)\beta(v_0,v_2)+\alpha(v_2,v_3)\beta(v_0,v_1).$$
This is the signed sum over the six $(2,2)$-shuffles, with no normalising factor. It is defined as a plain function of the four vectors, not packaged as an alternating form.

**`IsType20`.** It takes an endomorphism field $J$ and a complex two-form $\Omega$. The predicate holds when, for every $x\in M$ and all $u,v\in E_4$,
$$\Omega(x)\big(J(x)u,\,v\big)=i\,\Omega(x)(u,v).$$
No chart is involved, and $J$ is not required to be almost complex here.

**`kahlerMetric`.** For a real two-form $\kappa$, an endomorphism field $J$, a point $x\in M$ and vectors $u,v\in E_4$:
$$g_{\kappa,J}(x)(u,v)=\kappa(x)\big(u,\,J(x)v\big).$$

**`IsKahlerForm`.** It takes an endomorphism field $J$ and a real two-form $\kappa$. The predicate holds when all of the following are true:
1. $\kappa$ is smooth, in the sense of `IsSmoothForm`.
2. $\kappa$ is closed, in the sense of `IsClosedForm`.
3. For every $x$ and all $u,v\in E_4$, $\kappa(x)(J(x)u,J(x)v)=\kappa(x)(u,v)$.
4. For every $x$ and every $u\neq0$ in $E_4$, $\kappa(x)(u,J(x)u)>0$.

$J$ itself is not required to be almost complex, or smooth, by this predicate.

**`IsK3`.** It takes an endomorphism field $J$ and a complex two-form $\Omega$. The predicate holds when all of the following are true:
1. $J$ is almost complex (`IsAlmostComplex`).
2. $\Omega$ is smooth (`IsSmoothForm`, with $F=\mathbb{C}$ as a real space).
3. $\Omega$ is closed (`IsClosedForm`).
4. $\Omega$ satisfies `IsType20` with respect to $J$.
5. For every $x\in M$, $\Omega(x)$ is not the zero alternating map.

No further condition is imposed on $M$ or $J$. In particular there is nothing about compactness, connectedness, simple connectivity, a smooth atlas or integrability of $J$.

**`affC`.** It maps the Riemann sphere $\hat{\mathbb{C}}=\mathbb{C}\cup\{\infty\}$ (one-point compactification) to $\mathbb{C}$. It sends $z\in\mathbb{C}$ to $z$ and sends $\infty$ to the junk value $0$.

**`invC`.** It maps $\hat{\mathbb{C}}$ to $\mathbb{C}$, sending $z\in\mathbb{C}$ to $z^{-1}$ and $\infty$ to $0$. By the convention $0^{-1}=0$, the point $0\in\mathbb{C}$ is also sent to $0$.

**`dC`.** For a function $\phi:M\to\mathbb{C}$ and a point $x\in M$, $d\phi_x:E_4\to\mathbb{C}$ is the real-linear manifold derivative of $\phi$ at $x$. Concretely, it is the Fréchet derivative of $\phi\circ\varphi_x^{-1}$ at $\varphi_x(x)$, with $\mathbb{C}$ viewed as $\mathbb{R}^2$. It is $0$ if $\phi$ is not continuous at $x$ or that coordinate expression is not differentiable there.

**`IsJHolomorphicAt`.** It takes an endomorphism field $J$, a function $\phi:M\to\mathbb{C}$ and a point $x$. The predicate holds when both of the following are true:
1. $\phi$ is $C^\infty$ at $x$. This means it is continuous at $x$ and $\phi\circ\varphi_x^{-1}$ is $C^\infty$ near $\varphi_x(x)$, where $\varphi_x$ is the preferred chart at $x$.
2. For every $u\in E_4$, $d\phi_x(J(x)u)=i\,d\phi_x(u)$.

**`IsHolomorphicToSphere`.** It takes an endomorphism field $J$ and a map $j:M\to\hat{\mathbb{C}}$. The predicate holds when $j$ is continuous and, for every $x\in M$:
- if $j(x)\neq\infty$, then $\operatorname{affC}\circ j$ is $J$-holomorphic at $x$;
- if $j(x)\neq0$, then $\operatorname{invC}\circ j$ is $J$-holomorphic at $x$.

These composites carry the junk values of `affC` and `invC`, namely the value $0$ at $\infty$ and, for `invC`, at $0$. Each condition is local at a point where the relevant junk value is not taken.

**`localCoord`.** For $j:M\to\hat{\mathbb{C}}$ and a point $x$, it is the function $M\to\mathbb{C}$ equal to $\operatorname{invC}\circ j$ if $j(x)=\infty$, and to $\operatorname{affC}\circ j$ otherwise. This includes the case $j(x)=0$. The choice is fixed by $x$ and then used on all of $M$.

**`IsCriticalPt`.** A point $x$ is critical for $j$ when $d(\operatorname{localCoord}_{j,x})_x=0$. $J$ plays no role. Because a non-differentiable function has derivative $0$ by convention, every point where the local coordinate expression of $j$ fails to be differentiable (or continuous) counts as critical.

**`criticalValues`.** For $j:M\to\hat{\mathbb{C}}$, this is the set of $b\in\hat{\mathbb{C}}$ for which some critical point $x$ of $j$ satisfies $j(x)=b$.

**`IsNondegenerateCriticalPt`.** A point $x$ is a nondegenerate critical point of $j$ when $x$ is critical and the following holds. Let $f=\operatorname{localCoord}_{j,x}\circ\varphi_x^{-1}:E_4\to\mathbb{C}$, and let $H=D(Df)(\varphi_x(x))$, a real-bilinear map $E_4\times E_4\to\mathbb{C}$. The requirement is that for every $u\neq0$ in $E_4$ there is some $v$ with $H(u,v)\neq0$. $H$ is computed as the Fréchet derivative of $y\mapsto Df(y)$ at $\varphi_x(x)$, and it is $0$ if $Df$ is not differentiable there; in that case the condition fails.

**`IsEllipticFibration`.** It takes an endomorphism field $J$ and a map $j:M\to\hat{\mathbb{C}}$. The predicate holds when all of the following are true:
1. $j$ satisfies `IsHolomorphicToSphere` for $J$.
2. $j$ is surjective onto $\hat{\mathbb{C}}$.
3. Every fibre $j^{-1}(\{b\})$, for $b\in\hat{\mathbb{C}}$, is connected. Here connected includes nonempty.

Nothing is said about the topology of the fibres beyond this, or about properness.

**`AllSingularFibresI1`.** For $j:M\to\hat{\mathbb{C}}$, the predicate holds when every critical point $x$ of $j$ is nondegenerate and is the only critical point in its fibre. That is, any critical $x'$ with $j(x')=j(x)$ equals $x$. There is no condition on the number of critical values. The predicate is vacuously true if $j$ has no critical points.

**`sectionAtInfty`.** For $\sigma:\hat{\mathbb{C}}\to M$, this is the map $\mathbb{C}\to M$ given by $w\mapsto\sigma(\infty)$ if $w=0$, and $w\mapsto\sigma(1/w)$ if $w\neq0$, where $1/w$ is regarded as a point of $\mathbb{C}\subset\hat{\mathbb{C}}$.

**`IsHolomorphicFromC`.** It takes an endomorphism field $J$ and a map $s:\mathbb{C}\to M$. The predicate holds when both of the following are true:
1. $s$ is $C^\infty$ everywhere, with $\mathbb{C}$ modelled as $\mathbb{R}^2$. At each $z$ this means $s$ is continuous there and $\varphi_{s(z)}\circ s$ is $C^\infty$ near $z$.
2. For all $z,a\in\mathbb{C}$, $ds_z(i\,a)=J(s(z))\big(ds_z(a)\big)$. Here $ds_z:\mathbb{C}\to E_4$ is the derivative of $\varphi_{s(z)}\circ s$ at $z$, and it is $0$ if that is not differentiable.

**`IsHolomorphicSection`.** It takes an endomorphism field $J$, a map $j:M\to\hat{\mathbb{C}}$ and a map $\sigma:\hat{\mathbb{C}}\to M$. The predicate holds when all of the following are true:
1. $j(\sigma(b))=b$ for every $b\in\hat{\mathbb{C}}$.
2. $z\mapsto\sigma(z)$, for $z\in\mathbb{C}$, satisfies `IsHolomorphicFromC` for $J$.
3. $\operatorname{sectionAtInfty}(\sigma)$, that is $w\mapsto\sigma(1/w)$ with $0\mapsto\sigma(\infty)$, satisfies `IsHolomorphicFromC` for $J$.

$J$ is not required to be almost complex here.

**`areaC`.** For $p,q\in\mathbb{C}$, it is the real number
$$\operatorname{area}(p,q)=\operatorname{Re}p\,\operatorname{Im}q-\operatorname{Im}p\,\operatorname{Re}q,$$
which equals $\operatorname{Im}(\bar p\,q)$.

**`BaseTwoForm`.** A record consisting of two functions $a_0,a_\infty:\mathbb{C}\to\mathbb{C}$ together with three proofs:
1. $a_0$ is $C^\infty$ on all of $\mathbb{C}$, viewed as $\mathbb{R}^2$.
2. $a_\infty$ is $C^\infty$ on all of $\mathbb{C}$, viewed as $\mathbb{R}^2$.
3. For every $w\neq0$,
$$a_\infty(w)=\frac{a_0(w^{-1})}{|w|^4}.$$

Nothing relates $a_\infty(0)$ to $a_0$ except through the smoothness of $a_\infty$. The factor $1/|w|^4$ is $|d(w^{-1})/dw|^2$.

**`pullbackBase`.** It takes $j:M\to\hat{\mathbb{C}}$, a record $\alpha=(a_0,a_\infty,\dots)$ of type `BaseTwoForm`, a point $x\in M$ and vectors $u,v\in E_4$. It returns the complex number given by two cases:
- If $j(x)=\infty$:
$$a_\infty(0)\cdot\operatorname{area}\big(d(\operatorname{invC}\circ j)_x u,\;d(\operatorname{invC}\circ j)_x v\big).$$
- Otherwise:
$$a_0\big(j(x)\big)\cdot\operatorname{area}\big(d(\operatorname{affC}\circ j)_x u,\;d(\operatorname{affC}\circ j)_x v\big).$$

In each case the real area is regarded as a complex number. The derivatives are those of `dC`, taken in the preferred chart at $x$, and they are $0$ when the composite is not differentiable (or not continuous) at $x$; in that case the value is $0$. The result is defined as a plain function of $(x,u,v)$, not packaged as an alternating form.
