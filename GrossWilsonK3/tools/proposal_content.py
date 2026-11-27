"""Human-facing text for the Gross–Wilson K3 mission proposal (plain Markdown + KaTeX;
JSON escaping is done by json.dumps at upload time)."""

PAPER = (
    "M. Gross and P.M.H. Wilson, Large complex structure limits of K3 surfaces, "
    "J. Differential Geom. 55 (2000), 475-546, arXiv:math/0008018 (v3, April 2001), "
    "https://arxiv.org/abs/math/0008018"
)

NAME = "Large Complex Structure Limits of K3 Surfaces (Gross–Wilson 2000)"

DESCRIPTION = r"""
## Motivation

The **Strominger–Yau–Zaslow (SYZ) conjecture** ([Strominger–Yau–Zaslow 1996](https://arxiv.org/abs/hep-th/9606040)) proposes that mirror symmetry for a Calabi–Yau manifold $X$ near a **large complex structure limit** is explained by a fibration of $X$ by special Lagrangian tori, with the mirror obtained by dualising the fibres. Special Lagrangian submanifolds are defined using the Ricci-flat Kähler metric, so the conjecture is really a statement about how Ricci-flat metrics behave as the complex structure degenerates. A metric formulation, made independently by Gross–Wilson (Conjecture 6.2 of the paper) and by Kontsevich–Soibelman ([2000](https://arxiv.org/abs/math/0011041)), predicts that, rescaled to bounded diameter, such Calabi–Yau $n$-folds converge in the **Gromov–Hausdorff** sense to an $n$-sphere whose metric is a Riemannian metric away from a codimension-2 singular set.

Gross and Wilson ([arXiv:math/0008018](https://arxiv.org/abs/math/0008018), J. Differential Geom. 55 (2000)) prove this picture for K3 surfaces, the first case beyond elliptic curves. After a hyperkähler rotation the question becomes: on a fixed elliptic K3 surface $f : X \to \mathbb{P}^1$, what does the Ricci-flat metric look like when the area $\epsilon$ of the fibres tends to $0$?

Timeline:

- 1978: [Yau](https://doi.org/10.1002/cpa.3160310304) proves the Calabi conjecture; every Kähler class on a K3 surface contains a unique Ricci-flat metric.
- 1990: [Greene–Shapere–Vafa–Yau](https://doi.org/10.1016/0550-3213(90)90248-C) introduce the **semi-flat metric** on elliptic fibrations.
- 1996: [Ooguri–Vafa](https://arxiv.org/abs/hep-th/9608079) write down an explicit hyperkähler metric near an $I_1$ fibre.
- 1990, 1992: [Kobayashi](https://doi.org/10.2969/aspm/01820257) and Anderson study other degenerations of Ricci-flat K3 metrics (orbifold limits, collapse).
- 2000: Gross–Wilson glue the Ooguri–Vafa metrics into the semi-flat metric, show the Ricci-flat metric is exponentially close to the glued metric away from the singular fibres (Theorem 5.6), and deduce Gromov–Hausdorff convergence to $\mathbb{P}^1$ with McLean's metric (Theorem 6.4).

## Setting

A **K3 surface** is a compact, connected, simply connected complex surface with a nowhere-vanishing holomorphic 2-form $\Omega$. An **elliptic fibration** $j : J \to \mathbb{P}^1$ is a surjective holomorphic map with connected fibres; its smooth fibres are elliptic curves. A singular fibre is of **Kodaira type $I_1$** if it has exactly one singular point, an ordinary node (locally $j = z_1 z_2$). For a generic elliptic K3 surface with a section, all singular fibres are of type $I_1$ and there are $24$ of them, at the points of the **discriminant locus** $\Delta \subset \mathbb{P}^1$.

An elliptic K3 surface $f : X \to \mathbb{P}^1$ has **Jacobian** $j$ when $X$ and $J$ are the same smooth manifold over $\mathbb{P}^1$ and $\Omega_X = \Omega_J + j^*\alpha$ for a 2-form $\alpha$ on $\mathbb{P}^1$ (Section 1 of the paper). A Kähler form $\omega$ is Ricci-flat exactly when $\omega^2$ is a constant multiple of $\Omega \wedge \bar\Omega$. With the paper's normalisation $\omega^2 = (\mathrm{Re}\,\Omega)^2$, the total volume is fixed. The **fibre area** is $\epsilon = \int_{f^{-1}(b)} \omega$, independent of $b$.

Over $B_0 = \mathbb{P}^1 \setminus \Delta$, choose a local coordinate $y$ and periods $\tau_1(y), \tau_2(y)$ of the fibre with respect to the holomorphic 1-form $\Omega / dy$, and set $W_0 = 1/\mathrm{Im}(\bar\tau_1 \tau_2)$. **McLean's metric** on the base is
$$ g_B = W_0^{-1}\, dy \otimes d\bar y, $$
singular at the points of $\Delta$ but at finite distance from them, so $\mathbb{P}^1$ becomes a compact metric space.

## Formalization targets

### Goal: Theorem 6.4

Let $j : J \to \mathbb{P}^1$ be an elliptic K3 surface with a section and only $I_1$ singular fibres, and let $f_i : X_i \to \mathbb{P}^1$ be elliptic K3 surfaces with Jacobian $j$, carrying Ricci-flat Kähler forms $\omega_i$ of fixed volume and fibre area $\epsilon_i \to 0$. Then
$$ (X_i,\ \epsilon_i\,\omega_i) \xrightarrow{\ \mathrm{GH}\ } (\mathbb{P}^1,\ W_0^{-1}\,dy \otimes d\bar y). $$

### Milestones: Lemma 3.1

The harmonic function behind the Ooguri–Vafa metric,
$$ V_0 = \lim_{j\to\infty} \frac{1}{4\pi}\sum_{n=-j}^{j}\left(\frac{1}{\sqrt{(u+n\epsilon)^2+|y|^2}} - a_{|n|}\right), $$
converges and is harmonic (a); has a Fourier–Bessel expansion (b); is exponentially close to $-\frac{1}{4\pi\epsilon}\log|y|^2$ away from $y=0$ (c); and stays positive after adding $f/\epsilon$ for suitable harmonic $f$ (d).

### Milestones: Proposition 2.8 and Lemma 4.1

For $S^1$-invariant Ricci-flat metrics in canonical form, $\omega=\frac{i}{2}(W(dx+b\,dy)\wedge\overline{(dx+b\,dy)}+W^{-1}dy\wedge d\bar y)$, with fibre volume $\epsilon_i\to0$:
$$W_i\to0\ \text{uniformly},\qquad \epsilon_i^{-1}W_i\,\mathrm{Im}\,\tau\to1\ \text{on a fixed fibre}$$
(Proposition 2.8). Near an $I_1$ fibre, a closed real $(1,1)$-form on $X_{U^*}$ is $i\partial\bar\partial\varphi$ exactly when its class vanishes and $\int_{X_b}\beta\,dx_1\wedge dx_2=0$, with Hölder control of $\varphi$ (Lemma 4.1).

## Significance

Theorem 6.4 proves the metric SYZ / Kontsevich–Soibelman picture in complex dimension 2. It shows that, in the limit, the elliptic fibres collapse to points and the base carries McLean's metric, the metric that SYZ predicts on the base of a special Lagrangian fibration. It is the model for later work on collapsing Calabi–Yau metrics: Gross–Tosatti–Zhang, Tosatti, and Odaka–Oshima.

The result is proved on paper but none of it is formalized. The mission needs the Kähler geometry of compact surfaces, Riemannian distances on manifolds, fibre integration and Gromov–Hausdorff convergence, plus, for the analytic milestones, potential theory in $\mathbb{R}^3$ and Bessel functions. Each of these is reusable beyond this mission.

## Difficulty

The obvious approach, comparing the Ricci-flat metric with the semi-flat metric directly, fails near the 24 singular fibres. There the semi-flat metric is undefined, and the fibre diameter is of order $(\epsilon\log\epsilon^{-1})^{1/2}$, larger than on smooth fibres. Global estimates are also delicate: with the volume fixed, the diameter grows like $\epsilon^{-1/2}$, so the Sobolev constant degenerates (to order $\epsilon^{5}$) and every elliptic estimate must track its $\epsilon$-dependence. The paper succeeds only because the glued Ooguri–Vafa / semi-flat metric is already Ricci-flat up to errors of order $e^{-C/\epsilon}$.

## Formalization scope

- **Manifolds and forms.** K3 surfaces live on a compact, connected, simply connected smooth 4-manifold modelled on $\mathbb{R}^4$. Complex structures are almost complex structures $J$; the holomorphic 2-form is a closed, nowhere-vanishing $(2,0)$-form, which makes $J$ integrable automatically. Differential forms are pointwise continuous alternating maps, smooth and closed in every chart.
- **The base.** $\mathbb{P}^1$ is `OnePoint ℂ`, read through its two affine charts.
- **Ricci-flatness** is encoded by the paper's normalisation $\omega_i^2 = (\mathrm{Re}\,\Omega_i)^2$.
- **Distances.** Riemannian distances are infima of lengths of $C^1$ curves (as lower integrals, so non-integrable speeds cannot produce junk zero lengths).
- **Gromov–Hausdorff convergence** follows the paper's Definition 6.1, via approximation maps.
- **Trivialisation.** The goal is not trivialised by junk values: McLean's speed is computed from the integral of $\mathrm{Im}(\overline{\iota_{\tilde v}\Omega}\wedge\iota_{\tilde v}\Omega)$ over an oriented parametrisation of the fibre, and is only set to $0$ on the finite set $\Delta$.

- **Local results** (Proposition 2.8, Lemma 4.1) are stated in the holomorphic canonical coordinates $(x,y)$ of the paper, with $X=T^*_B/\Lambda$ modelled as a lattice quotient of an open subset of $\mathbb{C}^2$.

**Not yet included.** Propositions 3.2, 3.5 and 3.8, Corollary 3.7, Lemma 4.3, Theorems 4.4, 4.5 and 5.6, and Lemmas 5.1–5.5 need further infrastructure: the Gibbons–Hawking / Ooguri–Vafa metric, the global semi-flat metric, translations by sections, the curvature and Ricci tensors and Laplacian of a metric on a manifold, and integration over the K3. The results of §5 are moreover about the specific glued metric constructed in the proof of Theorem 4.5. Contributions of these definitions are welcome, and so are the missing milestones.

## Selected references

- M. Gross, P.M.H. Wilson, *Large complex structure limits of K3 surfaces*, J. Differential Geom. 55 (2000), 475–546. https://arxiv.org/abs/math/0008018
- A. Strominger, S.-T. Yau, E. Zaslow, *Mirror symmetry is T-duality*, Nucl. Phys. B 479 (1996), 243–259. https://arxiv.org/abs/hep-th/9606040
- M. Kontsevich, Y. Soibelman, *Homological mirror symmetry and torus fibrations*, 2000. https://arxiv.org/abs/math/0011041
- H. Ooguri, C. Vafa, *Summing up Dirichlet instantons*, Phys. Rev. Lett. 77 (1996), 3296–3298. https://arxiv.org/abs/hep-th/9608079
- B. Greene, A. Shapere, C. Vafa, S.-T. Yau, *Stringy cosmic strings and noncompact Calabi–Yau manifolds*, Nucl. Phys. B 337 (1990), 1–36. https://doi.org/10.1016/0550-3213(90)90248-C
- S.-T. Yau, *On the Ricci curvature of a compact Kähler manifold and the complex Monge–Ampère equation, I*, Comm. Pure Appl. Math. 31 (1978), 339–411. https://doi.org/10.1002/cpa.3160310304
"""

ITEMS = {
    "def_Geometry": dict(
        title="Gross–Wilson geometric setting: K3 surfaces and elliptic fibrations",
        source=PAPER + "; §1 (pp. 5-8), §2 (p. 8), §4 (pp. 34-35)",
        nl=r"""
This file sets up the geometric objects of Gross–Wilson on a smooth real 4-manifold $M$ (modelled on $\mathbb{R}^4$).

1. **Forms and tensors.** Real and complex 2-forms and endomorphism fields are given pointwise on $T_xM = \mathbb{R}^4$. A form is *smooth* or *closed* when its coordinate expression in every chart is $C^\infty$, respectively has vanishing exterior derivative. The wedge product of two 2-forms is the usual shuffle sum.
2. **Complex and Kähler structures.** An *almost complex structure* is a smooth field $J$ with $J^2=-1$. A complex 2-form $\Omega$ has *type $(2,0)$* if $\Omega(Ju,v)=i\,\Omega(u,v)$. A real 2-form $\omega$ is *Kähler* for $J$ if it is smooth, closed, $J$-invariant and $g(u,u)=\omega(u,Ju)>0$ for $u\ne0$, where $g(u,v)=\omega(u,Jv)$ is the associated metric.
3. **K3 structure.** An almost complex structure $J$ with a smooth, closed, nowhere-vanishing $(2,0)$-form $\Omega$ (on a compact, connected, simply connected $M$, imposed where used).
4. **Maps to $\mathbb{P}^1$.** $\mathbb{P}^1$ is the one-point compactification of $\mathbb{C}$ with affine coordinates $y$ and $w=1/y$. A map $j : M\to\mathbb{P}^1$ is *holomorphic* if it is continuous and $J$-holomorphic in both charts. An *elliptic fibration* is a surjective holomorphic map with connected fibres. Its *critical points* are where $dj=0$, and the *discriminant locus* $\Delta$ is the set of critical values. *All singular fibres are of type $I_1$* means every critical point is non-degenerate (nonsingular Hessian) and no fibre contains two critical points. A *holomorphic section* is $\sigma$ with $j\circ\sigma=\mathrm{id}$, holomorphic in both charts.
5. **2-forms on the base.** A smooth 2-form $\alpha = a_0(y)\,dy_1\wedge dy_2 = a_\infty(w)\,dw_1\wedge dw_2$ on $\mathbb{P}^1$, with $a_\infty(w)=a_0(1/w)/|w|^4$, and its pull-back $j^*\alpha$ to $M$.

These are the objects of Section 1 and Section 4 of the paper: an elliptic K3 surface $j : J \to \mathbb{P}^1$ with section and $I_1$ fibres, and the surfaces with Jacobian $j$, obtained by changing $\Omega$ to $\Omega + j^*\alpha$.

**Formalization Note** In real dimension 4, a closed nowhere-vanishing $(2,0)$-form forces $J$ to be integrable, so no separate Nijenhuis condition is imposed.
"""),
    "def_Distances": dict(
        title="Fibre integrals, Riemannian distance and McLean's metric on $\\mathbb{P}^1$",
        source=PAPER + "; §2 Example 2.2 (p. 10), §4 (p. 35, definition of $W_0$), Theorem 6.4 (p. 60) and its proof (p. 61)",
        nl=r"""
This file defines the distances that appear in Theorem 6.4.

1. **Fibre integrals.** For $b\in\mathbb{P}^1$, an *oriented parametrisation* of the fibre $j^{-1}(b)$ is a smooth $\mathbb{Z}^2$-periodic map $\varphi:\mathbb{R}^2\to M$ that descends to a bijection $\mathbb{R}^2/\mathbb{Z}^2\to j^{-1}(b)$. It is an immersion, positively oriented for $J$: $\partial_t\varphi = r\,\partial_s\varphi + s'\,J\partial_s\varphi$ with $s'>0$. Fibre integrals $\int_{j^{-1}(b)}$ are computed over $[0,1]^2$ using such a $\varphi$. In particular the fibre area of a Kähler form $\omega$ is $\int_{j^{-1}(b)}\omega$.
2. **Riemannian distance.** For a metric $g$ on $M$,
$$ d_g(x,y)=\inf\Big\{\int_0^1 \sqrt{g(\gamma'(t),\gamma'(t))}\,dt \ :\ \gamma\ C^1,\ \gamma(0)=x,\ \gamma(1)=y\Big\}. $$
3. **McLean's metric.** For $b\notin\Delta$ with local coordinate $y$, let $\tilde v$ be a tangent vector with $dy(\tilde v)=1$. Then
$$ W_0^{-1}(b) = \frac{i}{2}\int_{j^{-1}(b)} \iota_{\tilde v}\Omega\wedge\overline{\iota_{\tilde v}\Omega}, $$
which equals $\mathrm{Im}(\bar\tau_1\tau_2)$, the area of the period lattice in canonical coordinates $\Omega = dx\wedge dy$. The McLean distance on $\mathbb{P}^1$ is the infimum of lengths $\int_0^1 |c'(t)|\,W_0^{-1}(c(t))^{1/2}\,dt$ of $C^1$ curves, with speed taken to be $0$ at times when $c(t)\in\Delta$.

McLean's metric $W_0^{-1}dy\otimes d\bar y$ is the Gromov–Hausdorff limit of the rescaled Ricci-flat metrics in Theorem 6.4.

**Formalization Note** Lengths are lower Lebesgue integrals in $[0,\infty]$ and distances are their infima converted to real numbers.
"""),
    "def_GromovHausdorff": dict(
        title="Gromov–Hausdorff distance via approximation maps (Definition 6.1)",
        source=PAPER + "; §6, Definition 6.1 (p. 59)",
        nl=r"""
Let $(X,d_X)$ and $(Y,d_Y)$ be spaces with distance functions. Their **Gromov–Hausdorff distance is at most $\delta$** if there are maps $f:X\to Y$ and $g:Y\to X$, not necessarily continuous, such that for all $x,x_1,x_2\in X$ and $y,y_1,y_2\in Y$:
$$ |d_X(x_1,x_2)-d_Y(f x_1,f x_2)|<\delta,\qquad d_X(x,g(f(x)))<\delta, $$
$$ |d_Y(y_1,y_2)-d_X(g y_1,g y_2)|<\delta,\qquad d_Y(y,f(g(y)))<\delta. $$
The **Gromov–Hausdorff distance** $d_{GH}(X,Y)$ is the infimum of all such $\delta$. A sequence $(X,d_i)$ **converges** to $(Y,d_Y)$ if for every $\delta>0$ the distance is at most $\delta$ for all sufficiently large $i$.

This is the notion of convergence in Theorem 6.4. For compact metric spaces it is equivalent to the usual definition through $\delta$-dense subsets.
"""),
    "def_OoguriVafa": dict(
        title="The periodic harmonic function $V_0$ of the Ooguri–Vafa metric",
        source=PAPER + "; §3, Lemma 3.1 (p. 21); Abramowitz–Stegun 9.6.24 for $K_0$",
        nl=r"""
Write points of $\mathbb{R}^3$ as $(u,y_1,y_2)$ with $y=y_1+iy_2$, and fix $\epsilon>0$.

1. The **modified Bessel function** $K_0(x)=\int_0^\infty e^{-x\cosh t}\,dt$.
2. The constants $a_n = 1/(n\epsilon)$ for $n\ne0$ and $a_0 = 2(-\gamma+\log(2\epsilon))/\epsilon$, with $\gamma$ Euler's constant.
3. The partial sums
$$ T_j(u,y)=\frac{1}{4\pi}\sum_{n=-j}^{j}\left(\frac{1}{\sqrt{(u+n\epsilon)^2+y_1^2+y_2^2}}-a_{|n|}\right). $$
4. $V_0 = \lim_{j\to\infty} T_j$ (pointwise).
5. The domain $D\times\mathbb{R}\setminus\{0\}\times\epsilon\mathbb{Z}$, with $D$ the open unit disc, and $|y|=\sqrt{y_1^2+y_2^2}$.

$V_0$ is periodic in $u$ with period $\epsilon$ and has Taub–NUT type singularities at the points $(n\epsilon,0,0)$. Adding $f(y)/\epsilon$ for a harmonic $f$ gives the potential $V$ of the Gibbons–Hawking ansatz that produces the Ooguri–Vafa metric near an $I_1$ fibre.
"""),
    "thm_thm_6_4": dict(
        title="Theorem 6.4: K3 surfaces converge to $\\mathbb{P}^1$ with McLean's metric",
        source=PAPER + "; §6, Theorem 6.4 (p. 60)",
        nl=r"""
Let $j : J \to \mathbb{P}^1$ be an elliptically fibred K3 surface with a holomorphic section whose singular fibres are all of Kodaira type $I_1$. Let $\Omega_0$ be its holomorphic 2-form and $\Delta$ its discriminant locus. Let $f_i : X_i \to \mathbb{P}^1$ be a sequence of elliptically fibred K3 surfaces with Jacobian $j$, that is, $J$ with holomorphic 2-forms
$$ \Omega_i = \Omega_0 + j^*\alpha_i $$
for smooth 2-forms $\alpha_i$ on $\mathbb{P}^1$ and the corresponding complex structures. Let $\omega_i$ be Ricci-flat Kähler forms on $X_i$ with $\omega_i^2 = (\mathrm{Re}\,\Omega_i)^2$, so that $\int \omega_i^2$ is independent of $i$. Suppose the fibre areas satisfy
$$ \int_{f_i^{-1}(b)} \omega_i = \epsilon_i \to 0 . $$
Then the Riemannian manifolds $(X_i, \epsilon_i\,\omega_i)$ converge in the Gromov–Hausdorff sense to $\mathbb{P}^1$, with the distance induced by the singular Riemannian metric
$$ W_0^{-1}\, dy \otimes d\bar y $$
(McLean's metric). Here $W_0^{-1} = \mathrm{Im}(\bar\tau_1\tau_2)$ for periods $\tau_1, \tau_2$ of the fibres in canonical coordinates.

This is the metric form of the Strominger–Yau–Zaslow picture for K3 surfaces: as the fibres shrink, they collapse to points and the limit is the 2-sphere with McLean's metric, singular at 24 points.

**Formalization Note** "Jacobian $j$" is encoded as in Section 1 of the paper: the same smooth manifold, with $\Omega_i = \Omega_0 + j^*\alpha_i$. "Ricci-flat with $\omega_i^2$ independent of $i$" is encoded by the paper's normalisation $\omega_i\wedge\omega_i = \mathrm{Re}\,\Omega_i\wedge\mathrm{Re}\,\Omega_i$ pointwise, which on a compact surface with a holomorphic volume form is equivalent to Ricci-flatness with fixed volume. The fibre-area hypothesis is imposed for $b \notin \Delta$; the value is the same for every fibre. The rescaled metric $\epsilon_i\omega_i$ has distance $\sqrt{\epsilon_i}\,d_{\omega_i}$.
"""),
    "thm_lemma_3_1_a": dict(
        title="Lemma 3.1(a): the partial sums converge to a harmonic function $V_0$",
        source=PAPER + "; §3, Lemma 3.1(a) (p. 21)",
        nl=r"""
Fix $\epsilon>0$ and let $D\subset\mathbb{C}$ be the open unit disc. The partial sums
$$ T_j=\frac{1}{4\pi}\sum_{n=-j}^{j}\left(\frac{1}{\sqrt{(u+n\epsilon)^2+y_1^2+y_2^2}}-a_{|n|}\right),\qquad a_n=\begin{cases}1/(n\epsilon) & n\neq0\\ 2(-\gamma+\log(2\epsilon))/\epsilon & n=0\end{cases} $$
converge uniformly on compact subsets of $D\times\mathbb{R}\setminus\{0\}\times\epsilon\mathbb{Z}$ to a harmonic function $V_0$.

$V_0$ is the periodic harmonic potential at the core of the Ooguri–Vafa metric.
"""),
    "thm_lemma_3_1_b": dict(
        title="Lemma 3.1(b): Fourier–Bessel expansion of $V_0$",
        source=PAPER + "; §3, Lemma 3.1(b) (p. 21)",
        nl=r"""
Fix $\epsilon>0$. At every point $(u,y)$ of $D\times\mathbb{R}$ with $y\neq0$ ($D$ the unit disc), the function $V_0$ of Lemma 3.1(a) has the expansion
$$ V_0=-\frac{1}{4\pi\epsilon}\log|y|^2+\sum_{m\neq0}\frac{1}{2\pi\epsilon}\,e^{2\pi i m u/\epsilon}\,K_0\!\left(\frac{2\pi|m y|}{\epsilon}\right), $$
where $K_0$ is the modified Bessel function of the second kind of order $0$.

The expansion shows that, away from $y=0$, $V_0$ is a logarithm plus exponentially decaying terms. This is the source of the exponential decay of the Ooguri–Vafa metric to the semi-flat metric.
"""),
    "thm_lemma_3_1_c": dict(
        title="Lemma 3.1(c): $V_0$ is exponentially close to $-\\frac{1}{4\\pi\\epsilon}\\log|y|^2$",
        source=PAPER + "; §3, Lemma 3.1(c) (p. 21)",
        nl=r"""
There is a constant $C$ with the following property. For every $0<r_0<1$ there is $\epsilon_0>0$ such that for all $0<\epsilon<\epsilon_0$ and all points of $D\times\mathbb{R}$ with $|y|>r_0$,
$$ \left|V_0+\frac{1}{4\pi\epsilon}\log|y|^2\right|\le\frac{C}{\epsilon}\,e^{-2\pi|y|/\epsilon}. $$

This quantifies how fast the Ooguri–Vafa potential approaches the potential of the semi-flat metric as $\epsilon\to0$.
"""),
    "thm_lemma_3_1_d": dict(
        title="Lemma 3.1(d): positivity of $V_0 + f/\\epsilon$",
        source=PAPER + "; §3, Lemma 3.1(d) (p. 21)",
        nl=r"""
Let $0<r\le1$ and let $f$ be a real harmonic function on the disc $D_r$ of radius $r$, continuous up to its boundary, such that
$$ f(y)-\frac{1}{4\pi}\log|y|^2>0\qquad\text{for } 0<|y|\le r. $$
Then there is $\epsilon_0>0$ such that for all $0<\epsilon<\epsilon_0$,
$$ V_0+\frac{f(y)}{\epsilon}>0 $$
on $D_r\times\mathbb{R}$, away from the points $\{0\}\times\epsilon\mathbb{Z}$.

Positivity of $V=V_0+f/\epsilon$ is what makes the Gibbons–Hawking ansatz produce a genuine hyperkähler (Ooguri–Vafa) metric.

**Formalization Note** The paper leaves continuity of $f$ on the closed disc implicit, and the conclusion can fail without it, so it is assumed explicitly. The condition at $y=0$ is excluded, since $-\log|y|^2=+\infty$ there.
"""),
}

ITEMS.update({
    "def_CanonicalCoords": dict(
        title="Holomorphic canonical coordinates: $S^1$-invariant metrics, $I_1$ periods and Hölder norms",
        source=PAPER + "; §2 (pp. 8-9, equations (2.1)-(2.2)), Construction 2.6 (pp. 14-18), §4 (pp. 34-36, definitions of $W_0$, $b_0$, $\\vartheta_v$, $\\vartheta_h$ and Lemma 4.1)",
        nl=r"""
This file sets up the local coordinate models of Sections 2 and 4. Points of $T^*_B\subseteq\mathbb{C}^2$ are $(x,y)$: $y=y_1+iy_2$ is a holomorphic coordinate on the base and $x=x_1+ix_2$ the canonical fibre coordinate, so $\Omega=dx\wedge dy$. Elliptic fibrations are $T^*_B/\Lambda$ for a family of lattices $\Lambda_y\subset\mathbb{C}$.

1. **Wirtinger derivatives** $\partial_x=\tfrac12(\partial_{x_1}-i\partial_{x_2})$, $\partial_{\bar x}$, $\partial_y$, $\partial_{\bar y}$.
2. **$S^1$-invariant Ricci-flat metrics in canonical form** (Construction 2.6) over the disc $B$ of radius $R$, with periods $\{1,\tau(y)\}$: the Kähler form
$$\omega=\tfrac{i}{2}\big(W(dx+b\,dy)\wedge\overline{(dx+b\,dy)}+W^{-1}dy\wedge d\bar y\big),$$
with smooth $W>0$ and $b$ independent of $x_1$ and descending to $X=(B\times\mathbb{C})/(\mathbb{Z}+\tau\mathbb{Z})$, that is $W(x+\tau,y)=W$ and $b(x+\tau,y)=b-\tau'(y)$. It is closed: $\partial_yW=\partial_x(Wb)$ and $\partial_y(W\bar b)=\partial_x(W(W^{-2}+|b|^2))$. The normalisation $\omega^2=(\mathrm{Im}\,\Omega)^2$ makes it Ricci-flat. The fibre volume is $\int_{X_y}W\,dx_1\wedge dx_2$.
3. **Periods near an $I_1$ fibre** (§4). $U$ is an open contractible neighbourhood of $0$ and $U^*=U\setminus\{0\}$. $\tau_1$ is a single-valued holomorphic period on $U^*$. The multi-valued period $\tau_2$ is given by its lift to $s$ with $y=e^s$, with monodromy $\tau_2\mapsto\tau_2+\tau_1$ and $\mathrm{Im}(\bar\tau_1\tau_2)>0$. From these come the lattice $\Lambda_y=\mathbb{Z}\tau_1+\mathbb{Z}\tau_2$,
$$W_0=\frac{1}{\mathrm{Im}(\bar\tau_1\tau_2)},\qquad b_0=-\frac{\mathrm{Im}(\tau_2\bar x)\,\partial_y\tau_1+\mathrm{Im}(\bar\tau_1x)\,\partial_y\tau_2}{\mathrm{Im}(\bar\tau_1\tau_2)},$$
and the frame $\vartheta_v=W_0(dx+b_0dy)$, $\vartheta_h=dy$.
4. **Forms on $X_{U^*}$.** Real $(1,1)$-forms $\omega=\tfrac{i}{2}(\alpha\vartheta_v\wedge\bar\vartheta_v+\beta\vartheta_h\wedge\bar\vartheta_v+\bar\beta\vartheta_v\wedge\bar\vartheta_h+\gamma\vartheta_h\wedge\bar\vartheta_h)$ are handled through their coefficients $h_{a\bar b}$ in $\omega=\tfrac{i}{2}\sum h_{a\bar b}\,dz_a\wedge d\bar z_b$. The file defines what it means for such a form to be closed, to equal $i\partial\bar\partial\varphi$, and to be exact on $X_{U^*}$ (zero class in $H^2$). It also defines the fibre integral $\int_{X_b}\beta\,dx_1\wedge dx_2$.
5. **Hölder norms** $\|f\|_{C^{k,\mu}(T)}$ on subsets of $\mathbb{C}^2=\mathbb{R}^4$, and sets containing a fundamental domain of each fibre.

**Formalization Note** The branch of $\tau_2$ at $y$ is taken at $s=\log y$ (principal logarithm). The lattice, $W_0$ and $b_0$ do not depend on this choice.
"""),
    "thm_prop_2_8": dict(
        title="Proposition 2.8: $S^1$-invariant Ricci-flat metrics collapse to semi-flat behaviour",
        source=PAPER + "; §2, Proposition 2.8 (p. 18)",
        nl=r"""
Let $\pi:X\to B$ be an elliptic fibration over the open disc $B$ of radius $R$ in $\mathbb{C}$, with periods $\{1,\tau(y)\}$ where $\tau$ is holomorphic and $\mathrm{Im}\,\tau>0$. Let $B_0\subset B$ be the concentric disc of radius $0<R_0<R$. Let $g_i$ be a sequence of $S^1$-invariant Ricci-flat metrics on $X$ in canonical form, with constant volume form ($\Omega=dx\wedge dy$ fixed), and let $\epsilon_i=\epsilon(g_i)$ be the volume of the fibres. Suppose $\epsilon_i\to0$. Then:

1. On $\pi^{-1}(B_0)$, $W_i:=W(g_i)\to0$ uniformly as $i\to\infty$.
2. On a fixed fibre, with periods $\{1,\tau\}$, $\epsilon_i^{-1}\,W_i\,\mathrm{Im}\,\tau\to1$ uniformly as $i\to\infty$.

This is a local version of the convergence to a semi-flat metric: for the semi-flat metric, $W=\epsilon/\mathrm{Im}\,\tau$ exactly.

**Formalization Note** $X$ is modelled as $(B\times\mathbb{C})/(\mathbb{Z}+\tau(y)\mathbb{Z})$ in canonical coordinates, with all $g_i$ in canonical form for the same coordinates (this is where the constant volume form is used). The fibre volume hypothesis is imposed on every fibre over $B$.
"""),
    "thm_lemma_4_1_a": dict(
        title="Lemma 4.1: when a closed $(1,1)$-form near an $I_1$ fibre is $i\\partial\\bar\\partial$-exact",
        source=PAPER + "; §4, Lemma 4.1, first assertion (p. 35)",
        nl=r"""
Let $U$ be a contractible neighbourhood of a point of the discriminant locus, with holomorphic coordinate $y$ vanishing there and $U\cap\Delta=\{0\}$. Let $U^*=U\setminus\{0\}$ and $X_{U^*}=f^{-1}(U^*)$, with periods $\tau_1,\tau_2$ and frame $\vartheta_v,\vartheta_h$ as in §4. Let $\omega$ be a real closed $(1,1)$-form on $X_{U^*}$,
$$\omega=\frac{i}{2}\big(\alpha\,\vartheta_v\wedge\bar\vartheta_v+\beta\,\vartheta_h\wedge\bar\vartheta_v+\bar\beta\,\vartheta_v\wedge\bar\vartheta_h+\gamma\,\vartheta_h\wedge\bar\vartheta_h\big).$$
There exists a function $\varphi$ on $X_{U^*}$ with $\omega=i\partial\bar\partial\varphi$ if and only if $\omega$ represents the zero cohomology class on $X_{U^*}$ and
$$\int_{X_b}\beta\,dx_1\wedge dx_2=0\qquad\text{for all } b\in U^*.$$

This $\partial\bar\partial$-lemma on the punctured neighbourhood of a singular fibre is what allows the Ooguri–Vafa metric to be glued to the semi-flat metric within the same Kähler class.

**Formalization Note** $X_{U^*}$ is modelled as $(U^*\times\mathbb{C})/\Lambda$. Functions and forms on $X_{U^*}$ are lattice-invariant ones on $U^*\times\mathbb{C}$. "Zero cohomology class" is encoded as $\omega=d\eta$ for a smooth real 1-form $\eta$ invariant under translations by local holomorphic lattice sections. $\varphi$ is taken real-valued and smooth.
"""),
    "thm_lemma_4_1_b": dict(
        title="Lemma 4.1: Hölder estimate for the $i\\partial\\bar\\partial$-potential",
        source=PAPER + "; §4, Lemma 4.1, second assertion (pp. 35-36)",
        nl=r"""
In the setting of Lemma 4.1, let $U_{r_1,r_2}=\{y\in U: r_1<|y|<r_2\}$. If $r_1<r_1'<r_2'<r_2$ and $\overline{U}_{r_1,r_2}\subseteq U^*$, then there is a constant $C$, depending only on $r_1,r_2,r_1',r_2'$ and the periods of $f$ over $U_{r_1,r_2}$, such that whenever $\omega$ satisfies the conditions of Lemma 4.1, the potential $\varphi$ can be chosen with
$$\|\varphi\|'_{C^{k+2,\alpha}}\le C\big(\|\alpha\|_{C^{k,\alpha}}+\|\beta\|_{C^{k,\alpha}}+\|\gamma\|_{C^{k,\alpha}}\big).$$
Here $C^{k,\alpha}$ norms of functions on $f^{-1}(U_{r_1,r_2})$ are computed as functions on $T^*_{U_{r_1,r_2}}\subset\mathbb{C}^2$, in the coordinates $x,y$, on a bounded open set containing a fundamental domain of each fibre. $\|\cdot\|'$ is the similar norm over $U_{r_1',r_2'}$.

The estimate controls the gluing correction uniformly in $\epsilon$. It feeds into Theorem 4.4 and the $C^{2,\alpha}$ estimate of Lemma 5.4.

**Formalization Note** The Hölder exponent is written $\mu$ (the paper reuses $\alpha$ for both the exponent and a coefficient). The bounded open sets $T$ (over $U_{r_1,r_2}$) and $T'$ (over $U_{r_1',r_2'}$) are arbitrary but fixed before $C$, matching the paper's remark that any two such choices give equivalent norms. $k\ge0$ and $0<\mu<1$ are arbitrary.
"""),
})

MILESTONES_NEW = {
    "thm_prop_2_8": (
        "Proposition 2.8 — $W_i\\to0$ and $\\epsilon_i^{-1}W_i\\,\\mathrm{Im}\\,\\tau\\to1$",
        "For a sequence of $S^1$-invariant Ricci-flat metrics in canonical form on an elliptic fibration over a disc with periods $\\{1,\\tau\\}$ and fibre volumes $\\epsilon_i\\to0$, $W_i\\to0$ uniformly over a smaller disc, and on a fixed fibre $\\epsilon_i^{-1}W_i\\,\\mathrm{Im}\\,\\tau\\to1$ uniformly.",
    ),
    "thm_lemma_4_1_a": (
        "Lemma 4.1 — $i\\partial\\bar\\partial$-lemma on $X_{U^*}$",
        "A real closed $(1,1)$-form $\\omega=\\frac{i}{2}(\\alpha\\vartheta_v\\wedge\\bar\\vartheta_v+\\beta\\vartheta_h\\wedge\\bar\\vartheta_v+\\bar\\beta\\vartheta_v\\wedge\\bar\\vartheta_h+\\gamma\\vartheta_h\\wedge\\bar\\vartheta_h)$ on $X_{U^*}$ is $i\\partial\\bar\\partial\\varphi$ iff $[\\omega]=0$ in $H^2(X_{U^*})$ and $\\int_{X_b}\\beta\\,dx_1\\wedge dx_2=0$ for all $b\\in U^*$.",
    ),
    "thm_lemma_4_1_b": (
        "Lemma 4.1 — Hölder estimate for the potential",
        "For $r_1<r_1'<r_2'<r_2$ with $\\overline{U}_{r_1,r_2}\\subseteq U^*$, $\\varphi$ can be chosen with $\\|\\varphi\\|'_{C^{k+2,\\alpha}}\\le C(\\|\\alpha\\|_{C^{k,\\alpha}}+\\|\\beta\\|_{C^{k,\\alpha}}+\\|\\gamma\\|_{C^{k,\\alpha}})$, $C$ depending only on the radii and the periods.",
    ),
}

MILESTONES = {
    "thm_lemma_3_1_a": (
        "Lemma 3.1(a) — convergence and harmonicity of $V_0$",
        "The partial sums $T_j$ converge uniformly on compact subsets of $D\\times\\mathbb{R}\\setminus\\{0\\}\\times\\epsilon\\mathbb{Z}$ to a harmonic function $V_0$, where $D$ is the unit disc.",
    ),
    "thm_lemma_3_1_b": (
        "Lemma 3.1(b) — Fourier–Bessel expansion of $V_0$",
        "For $|y|\\neq0$, $V_0=-\\frac{1}{4\\pi\\epsilon}\\log|y|^2+\\sum_{m\\neq0}\\frac{1}{2\\pi\\epsilon}e^{2\\pi imu/\\epsilon}K_0(2\\pi|my|/\\epsilon)$, with $K_0$ the modified Bessel function.",
    ),
    "thm_lemma_3_1_c": (
        "Lemma 3.1(c) — exponential decay to the logarithm",
        "There is $C$ such that for each $0<r_0<1$ there is $\\epsilon_0>0$ with $|V_0+\\frac{1}{4\\pi\\epsilon}\\log|y|^2|\\le\\frac{C}{\\epsilon}e^{-2\\pi|y|/\\epsilon}$ for all $\\epsilon<\\epsilon_0$ and $|y|>r_0$.",
    ),
    "thm_lemma_3_1_d": (
        "Lemma 3.1(d) — positivity of $V_0+f/\\epsilon$",
        "If $r\\le1$ and $f$ is harmonic on the disc $D_r$ with $f(y)-\\frac{1}{4\\pi}\\log|y|^2>0$ for $|y|\\le r$, then for all small $\\epsilon$, $V_0+f(y)/\\epsilon>0$ on $D_r\\times\\mathbb{R}$.",
    ),
}
