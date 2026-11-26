import Mathlib
import Definitions.Def_GrossWilsonK3_OoguriVafa

open Filter Real

namespace GrossWilson

/-- Gross–Wilson, Lemma 3.1(a): for every `ε > 0` the partial sums `T_j` converge uniformly on
compact subsets of `D × ℝ − {0} × εℤ` to a harmonic function `V₀`. -/
theorem lemma_3_1_a (ε : ℝ) (hε : 0 < ε) :
    TendstoLocallyUniformlyOn (fun j : ℕ => ovPartialSum ε j) (ovV0 ε) atTop (ovDomain ε) ∧
      InnerProductSpace.HarmonicOnNhd (ovV0 ε) (ovDomain ε) := by
  sorry

/-- Gross–Wilson, Lemma 3.1(b): for `|y| ≠ 0`,
`V₀ = -(1/4πε) log |y|² + Σ_{m ≠ 0} (1/2πε) e^{2πimu/ε} K₀(2π|my|/ε)`. -/
theorem lemma_3_1_b (ε : ℝ) (hε : 0 < ε) (p : E3) (hp : p ∈ ovDomain ε) (hy : yNorm p ≠ 0) :
    (ovV0 ε p : ℂ) =
      ((-(1 / (4 * π * ε)) * Real.log (yNorm p ^ 2) : ℝ) : ℂ) +
        ∑' m : ℤ, if m = 0 then 0 else
          ((1 / (2 * π * ε) : ℝ) : ℂ) * Complex.exp (2 * π * Complex.I * m * p 0 / ε) *
            ((besselK0 (2 * π * |(m : ℝ)| * yNorm p / ε) : ℝ) : ℂ) := by
  sorry

/-- Gross–Wilson, Lemma 3.1(c): there is a constant `C` such that for every `0 < r₀ < 1` there is
`ε₀ > 0` with `|V₀ + (1/4πε) log |y|²| ≤ (C/ε) e^{-2π|y|/ε}` whenever `ε < ε₀` and `|y| > r₀`. -/
theorem lemma_3_1_c :
    ∃ C : ℝ, ∀ r₀ : ℝ, 0 < r₀ → r₀ < 1 → ∃ ε₀ : ℝ, 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ p ∈ ovDomain ε, r₀ < yNorm p →
        |ovV0 ε p + 1 / (4 * π * ε) * Real.log (yNorm p ^ 2)| ≤
          C / ε * Real.exp (-2 * π * yNorm p / ε) := by
  sorry

/-- Gross–Wilson, Lemma 3.1(d): if `r ≤ 1` and `f` is harmonic on the disc `D_r` (continuous up
to its boundary) with `f(y) - (1/4π) log |y|² > 0` for `0 < |y| ≤ r`, then for all small `ε > 0`,
`V₀ + f(y)/ε > 0` on `D_r × ℝ` (off the lattice points). -/
theorem lemma_3_1_d (r : ℝ) (hr0 : 0 < r) (hr : r ≤ 1) (f : ℂ → ℝ)
    (hf : InnerProductSpace.HarmonicOnNhd f (Metric.ball 0 r))
    (hfc : ContinuousOn f (Metric.closedBall 0 r))
    (hpos : ∀ y : ℂ, 0 < ‖y‖ → ‖y‖ ≤ r → 0 < f y - 1 / (4 * π) * Real.log (‖y‖ ^ 2)) :
    ∃ ε₀ : ℝ, 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ p ∈ ovDomain ε, yNorm p < r → 0 < ovV0 ε p + f ⟨p 1, p 2⟩ / ε := by
  sorry

end GrossWilson
