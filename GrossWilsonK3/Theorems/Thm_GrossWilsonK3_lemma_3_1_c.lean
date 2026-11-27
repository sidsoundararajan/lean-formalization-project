import Mathlib
import Definitions.Def_GrossWilsonK3_OoguriVafa

open Filter Real

namespace GrossWilsonK3

/-- Gross–Wilson, Lemma 3.1(c): there is a constant `C` such that for every `0 < r₀ < 1` there is
`ε₀ > 0` with `|V₀ + (1/4πε) log |y|²| ≤ (C/ε) e^{-2π|y|/ε}` whenever `ε < ε₀` and `|y| > r₀`. -/
theorem lemma_3_1_c :
    ∃ C : ℝ, ∀ r₀ : ℝ, 0 < r₀ → r₀ < 1 → ∃ ε₀ : ℝ, 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ p ∈ ovDomain ε, r₀ < yNorm p →
        |ovV0 ε p + 1 / (4 * π * ε) * Real.log (yNorm p ^ 2)| ≤
          C / ε * Real.exp (-2 * π * yNorm p / ε) := by
  sorry

end GrossWilsonK3
