# Plan: the remaining Gross–Wilson milestones (§3–§5)

Status of the mission draft:

- **Already formalized:** Proposition 2.8, Lemma 3.1(a)–(d), Lemma 4.1 (both parts), and Theorem 6.4 (the goal).
- **Not yet stated:** Propositions 3.2, 3.5 and 3.8, Corollary 3.7, Lemma 4.3, Theorems 4.4, 4.5 and 5.6, and Lemmas 5.1–5.5.

Those results cannot be stated faithfully until the infrastructure below exists. The plan is ordered by dependency. Each layer is a separate definition file and should get its own blind audit.

## Layer A: Riemannian quantities on the 4-manifold

Mathlib has no Levi-Civita connection, curvature tensor or Laplace–Beltrami operator on a manifold. All three can be written in the preferred chart at each point (the encoding already used for forms in `Def_GrossWilsonK3_Geometry`):

1. The metric matrix $g_{ij}$ in the chart, its inverse $g^{ij}$, and the Christoffel symbols $\Gamma^k_{ij} = \tfrac12 g^{kl}(\partial_i g_{jl} + \partial_j g_{il} - \partial_l g_{ij})$.
2. The Riemann tensor $R^l{}_{ijk}$, the Ricci tensor, and the pointwise norm $\|R\|^2 = R_{ijkl}R^{ijkl}$. These give $\|R\|_{C^0}$ and the Ricci lower bound $\inf\{\mathrm{Ric}(v,v) : |v|=1\}$.
3. The Laplace–Beltrami operator $\Delta F = g^{ij}(\partial_i\partial_j F - \Gamma^k_{ij}\partial_k F)$.
4. The complex Hessian $i\partial\bar\partial u = -\tfrac12\,d(du\circ J)$ as a real 2-form, and $F_\epsilon = \log\big((\mathrm{Re}\,\Omega)^2 / \omega^2\big)$.
5. Integration of a function against $\omega^2$ over the compact K3, via a smooth partition of unity subordinate to charts. This is needed for $\int u\,\omega^2 = 0$, $L^p$ norms (Lemmas 5.1–5.2) and Green's functions (Lemma 5.5).

These pieces are reusable well beyond this mission.

## Layer B: the Gibbons–Hawking ansatz and the Ooguri–Vafa metric (§2–§3)

1. A principal $S^1$-bundle over $U \subseteq \mathbb{R}^3$ with a connection form $\theta$, and the hyperkähler triple $\omega_i = du_i\wedge\theta/2\pi i + V\,du_j\wedge du_k$ for positive harmonic $V$ with $*dV = d\theta/2\pi i$ (Construction 2.3).
2. The Ooguri–Vafa metric. Apply the ansatz with $V = V_0 + f/\epsilon$ (Lemma 3.1) on the circle bundle over $(D_r\times\mathbb{R}\setminus\{0\}\times\epsilon\mathbb{Z})/\epsilon\mathbb{Z}$, then extend over the added points (Proposition 3.2).
3. The predicate "$\omega$ is an Ooguri–Vafa metric on $f^{-1}(U)$". It holds when there is a fibre-preserving biholomorphism from $f^{-1}(U)$ to the model of item 2 that matches $\Omega$ and pulls the model metric back to $\omega$.

This unlocks Propositions 3.2, 3.5 and 3.8 and Corollary 3.7, which need Layer A for diameters and $\|R\|$.

## Layer C: the global semi-flat metric and translations (§1, §4)

1. The canonical map $\phi : T^*_B \to X^\#$, with zero section $\sigma_0$ and $\phi^*\Omega = dx\wedge dy$, and the exact sequence $0\to R^1f_*\mathbb{Z}\to T^*_B\to X^\#\to 0$ ([14], Proposition 7.2). This identifies $X_0$ locally with the coordinate model already in `Def_GrossWilsonK3_CanonicalCoords`.
2. The standard semi-flat metric $\omega_{SF}$ on $X_0$ (Example 2.2), and "semi-flat, not necessarily standard".
3. The fibrewise group law, and translation $T_\sigma$ by a (holomorphic, or merely $C^\infty$) section.

This unlocks Lemma 4.3 and, with Layers A and B, the statements of Theorems 4.4 and 4.5.

## Layer D: §5

Lemmas 5.1–5.5 and Theorem 5.6 concern "$\omega_\epsilon$ as in Theorem 4.5", that is, the specific glued metric built in the proof of Theorem 4.5. There are two faithful options:

- **(i)** Formalize the gluing construction itself (Layers A–C plus cutoff functions and the $B$-field fundamental domain of Remark 4.6) and state §5 for that metric.
- **(ii)** Fold §5 into the existence statement: "there exist metrics $\omega_\epsilon$ with the properties of Theorem 4.5 such that the Ricci-flat potential $u_\epsilon$ satisfies Lemmas 5.2–5.4 and Theorem 5.6". This is an existential combination of 4.5 and 5.6, which is what the paper proves.

Stating §5 for every metric with 4.5's listed properties would be a generalization the paper does not prove, because Lemma 5.4 uses details of the construction. So it should be avoided.

## Suggested order

A (1–3) → B → C → Theorems 4.4/4.5 → A (4–5) → Layer D via option (ii). Each step ends with a compile, blind read-backs, and an upload to the draft proposal before the human review.
