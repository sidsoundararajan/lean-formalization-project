import Mathlib
import Definitions.Def_GrossWilsonK3_OoguriVafa

open Filter Real

namespace GrossWilsonK3

/-- Gross–Wilson, Lemma 3.1(b): for `|y| ≠ 0`,
`V₀ = -(1/4πε) log |y|² + Σ_{m ≠ 0} (1/2πε) e^{2πimu/ε} K₀(2π|my|/ε)`. -/
theorem lemma_3_1_b (ε : ℝ) (hε : 0 < ε) (p : E3) (hp : p ∈ ovDomain ε) (hy : yNorm p ≠ 0) :
    (ovV0 ε p : ℂ) =
      ((-(1 / (4 * π * ε)) * Real.log (yNorm p ^ 2) : ℝ) : ℂ) +
        ∑' m : ℤ, if m = 0 then 0 else
          ((1 / (2 * π * ε) : ℝ) : ℂ) * Complex.exp (2 * π * Complex.I * m * p 0 / ε) *
            ((besselK0 (2 * π * |(m : ℝ)| * yNorm p / ε) : ℝ) : ℂ) := by
  sorry

end GrossWilsonK3
