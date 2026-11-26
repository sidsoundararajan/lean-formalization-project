import Mathlib

/-!
# Gross–Wilson, Definition 6.1: Gromov–Hausdorff distance via approximation maps

Distances are given as plain functions `d : X → X → ℝ`, so that the definition applies directly to
the distance functions of Riemannian metrics.
-/

open Filter

noncomputable section

namespace GrossWilson

/-- Definition 6.1: the Gromov–Hausdorff distance between `(X, dX)` and `(Y, dY)` is at most `δ`
(in the paper's strict-inequality form): there are maps `f : X → Y` and `g : Y → X`, not
necessarily continuous, with `|dX(x₁,x₂) - dY(f x₁, f x₂)| < δ`, `dX(x, g(f x)) < δ`, and the two
symmetric properties for `Y`. -/
def GHWithin {X Y : Type*} (dX : X → X → ℝ) (dY : Y → Y → ℝ) (δ : ℝ) : Prop :=
  ∃ (f : X → Y) (g : Y → X),
    (∀ x₁ x₂, |dX x₁ x₂ - dY (f x₁) (f x₂)| < δ) ∧ (∀ x, dX x (g (f x)) < δ) ∧
    (∀ y₁ y₂, |dY y₁ y₂ - dX (g y₁) (g y₂)| < δ) ∧ (∀ y, dY y (f (g y)) < δ)

/-- Definition 6.1: the Gromov–Hausdorff distance `d_GH(X, Y)`, the infimum of all `δ` for which
`GHWithin dX dY δ` holds. -/
def ghDist {X Y : Type*} (dX : X → X → ℝ) (dY : Y → Y → ℝ) : ℝ :=
  sInf {δ : ℝ | GHWithin dX dY δ}

/-- A sequence of metric spaces `(X, dᵢ)` converges in the Gromov–Hausdorff sense to `(Y, dY)`:
for every `δ > 0`, `d_GH((X, dᵢ), (Y, dY)) < δ` for all large `i` (equivalently `GHWithin dᵢ dY δ`
holds eventually). -/
def GHConverges {X Y : Type*} (d : ℕ → X → X → ℝ) (dY : Y → Y → ℝ) : Prop :=
  ∀ δ : ℝ, 0 < δ → ∀ᶠ i in atTop, GHWithin (d i) dY δ

end GrossWilson
