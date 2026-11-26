import Mathlib

/-!
# Gross–Wilson §3: the periodic harmonic function `V₀` behind the Ooguri–Vafa metric

Points of `ℝ³` are written `p = (u, y₁, y₂)` with `u = p 0`, `y₁ = p 1`, `y₂ = p 2`, and
`y = y₁ + i y₂`.  For `ε > 0`, `V₀` is a harmonic function on `D × ℝ` minus the lattice
`{0} × εℤ` (`D` the unit disc), periodic in `u` with Taub–NUT type singularities
`1/(4π|p - (nε,0,0)|)` at the lattice points.
-/

open Filter Real MeasureTheory Set

noncomputable section

namespace GrossWilson

/-- `ℝ³`, with coordinates `(u, y₁, y₂)`. -/
abbrev E3 : Type := EuclideanSpace ℝ (Fin 3)

/-- The modified Bessel function `K₀(x) = ∫₀^∞ e^{-x cosh t} dt` (for `x > 0`;
Abramowitz–Stegun 9.6.24). -/
def besselK0 (x : ℝ) : ℝ := ∫ t in Ioi (0 : ℝ), Real.exp (-x * Real.cosh t)

/-- The renormalising constants of Lemma 3.1: `aₙ = 1/(nε)` for `n ≠ 0` and
`a₀ = 2(-γ + log(2ε))/ε`, with `γ` Euler's constant. -/
def ovCoeff (ε : ℝ) (n : ℕ) : ℝ :=
  if n = 0 then 2 * (-Real.eulerMascheroniConstant + Real.log (2 * ε)) / ε else 1 / (n * ε)

/-- The partial sums of Lemma 3.1:
`T_j(u, y) = (1/4π) Σ_{n=-j}^{j} ( 1/√((u + nε)² + y₁² + y₂²) - a_{|n|} )`. -/
def ovPartialSum (ε : ℝ) (j : ℕ) (p : E3) : ℝ :=
  1 / (4 * π) * ∑ n ∈ Finset.Icc (-(j : ℤ)) j,
    (1 / Real.sqrt ((p 0 + n * ε) ^ 2 + p 1 ^ 2 + p 2 ^ 2) - ovCoeff ε n.natAbs)

/-- `V₀ = lim_{j → ∞} T_j` (pointwise limit; junk value where the limit does not exist). -/
def ovV0 (ε : ℝ) (p : E3) : ℝ := limUnder atTop (fun j : ℕ => ovPartialSum ε j p)

/-- The domain `D × ℝ − {0} × εℤ ⊆ ℝ³` of `V₀`, `D` the open unit disc in the `y`-plane. -/
def ovDomain (ε : ℝ) : Set E3 :=
  {p | p 1 ^ 2 + p 2 ^ 2 < 1} \ {p | p 1 = 0 ∧ p 2 = 0 ∧ ∃ n : ℤ, p 0 = n * ε}

/-- `|y| = √(y₁² + y₂²)` for `p = (u, y₁, y₂)`. -/
def yNorm (p : E3) : ℝ := Real.sqrt (p 1 ^ 2 + p 2 ^ 2)

end GrossWilson
