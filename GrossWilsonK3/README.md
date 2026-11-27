# Gross–Wilson: Large complex structure limits of K3 surfaces (Lean 4 draft)

Lean 4 / Mathlib statements for a [Prove2Me](https://prove2.me) mission formalizing

> M. Gross and P.M.H. Wilson, *Large complex structure limits of K3 surfaces*,
> J. Differential Geom. 55 (2000), 475–546. [arXiv:math/0008018](https://arxiv.org/abs/math/0008018) (v3 used).

This is a **draft**: statements only (every theorem ends in `sorry`). The statements have not yet
been proved. They have blind read-backs and are uploaded to Prove2Me as a draft mission proposal awaiting review.

## Contents

| File | Paper | What it contains |
|------|-------|------------------|
| `Definitions/Def_GrossWilsonK3_Geometry.lean` | §1, §4 | Forms and almost complex structures on a smooth 4-manifold, Kähler forms, K3 surfaces, holomorphic maps to `ℙ¹ = OnePoint ℂ`, elliptic fibrations, `I₁` singular fibres, holomorphic sections, pull-backs of 2-forms from `ℙ¹` |
| `Definitions/Def_GrossWilsonK3_Distances.lean` | §4, §6 | Fibre integrals, Riemannian distance, McLean's metric `W₀⁻¹ dy ⊗ dȳ` on the base |
| `Definitions/Def_GrossWilsonK3_GromovHausdorff.lean` | Definition 6.1 | Gromov–Hausdorff distance via approximation maps |
| `Definitions/Def_GrossWilsonK3_OoguriVafa.lean` | §3 | The periodic harmonic function `V₀`, its partial sums `T_j`, and the Bessel function `K₀` |
| `Theorems/Thm_GrossWilsonK3_thm_6_4.lean` | Theorem 6.4 | Goal: Gromov–Hausdorff convergence of `(Xᵢ, εᵢωᵢ)` to `ℙ¹` with McLean's metric |
| `Theorems/Thm_GrossWilsonK3_lemma_3_1_{a,b,c,d}.lean` | Lemma 3.1(a)–(d) | Convergence, Bessel expansion, exponential decay and positivity of `V₀` |

## Encoding choices worth checking

- **Complex structures.** A K3 surface is a compact, connected, simply connected smooth 4-manifold
  with an almost complex structure `J` and a smooth, closed, nowhere-vanishing `(2,0)`-form `Ω`.
  Integrability of `J` follows from these conditions in real dimension 4.
- **Jacobian.** Following §1 and the proof of Theorem 4.5, a surface `Xᵢ` with Jacobian `j` is the
  same manifold with holomorphic 2-form `Ωᵢ = Ω₀ + j^*αᵢ` for a 2-form `αᵢ` on `ℙ¹`.
- **Ricci-flat metrics.** Encoded by the paper's normalisation `ωᵢ² = (Re Ωᵢ)²`. On a compact
  surface with a holomorphic volume form this is equivalent to Ricci-flatness with fixed total
  volume.
- **`I₁` fibres.** Every critical point of `j` is non-degenerate, and no fibre contains two of them.
- **Lemma 3.1(d)** additionally assumes `f` is continuous up to the boundary of the disc; the paper
  leaves this implicit, and the conclusion can fail without it.

## Not yet formalized

Theorems 4.4, 4.5 and 5.6, Lemmas 5.1–5.5, and Propositions 2.8, 3.2, 3.5 and 3.8 are not stated
yet. They need infrastructure that Mathlib does not have, such as the Levi-Civita curvature tensor
on manifolds, Hölder norms in canonical coordinates, and the semi-flat and Ooguri–Vafa metrics.

## Building

The files use Prove2Me's module layout (`import Definitions.Def_…`). From this folder:

```bash
lake update && lake exe cache get && lake build
```

The paper itself is not included in this repository.
