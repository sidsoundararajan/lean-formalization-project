import Mathlib
import Definitions.Def_GrossWilsonK3_OoguriVafa

open Filter Real

namespace GrossWilsonK3

/-- Gross–Wilson, Lemma 3.1(a): for every `ε > 0` the partial sums `T_j` converge uniformly on
compact subsets of `D × ℝ − {0} × εℤ` to a harmonic function `V₀`. -/
theorem lemma_3_1_a (ε : ℝ) (hε : 0 < ε) :
    TendstoLocallyUniformlyOn (fun j : ℕ => ovPartialSum ε j) (ovV0 ε) atTop (ovDomain ε) ∧
      InnerProductSpace.HarmonicOnNhd (ovV0 ε) (ovDomain ε) := by
  sorry

end GrossWilsonK3
