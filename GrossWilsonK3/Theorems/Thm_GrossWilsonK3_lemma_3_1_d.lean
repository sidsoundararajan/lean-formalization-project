import Mathlib
import Definitions.Def_GrossWilsonK3_OoguriVafa

open Filter Real

namespace GrossWilsonK3

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

end GrossWilsonK3
