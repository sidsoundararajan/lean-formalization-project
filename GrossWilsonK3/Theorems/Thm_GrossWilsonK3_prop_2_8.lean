import Mathlib
import Definitions.Def_GrossWilsonK3_CanonicalCoords

open Filter Topology

namespace GrossWilsonK3

/-- Gross–Wilson, Proposition 2.8. -/
theorem prop_2_8 (R R₀ : ℝ) (hR₀ : 0 < R₀) (hR : R₀ < R) (τ : ℂ → ℂ)
    (hτ : DifferentiableOn ℂ τ (Metric.ball 0 R))
    (hτim : ∀ y ∈ Metric.ball (0 : ℂ) R, 0 < (τ y).im)
    (W : ℕ → C2 → ℝ) (b : ℕ → C2 → ℂ) (ε : ℕ → ℝ)
    (hg : ∀ i, IsS1InvRicciFlatCanonical R τ (W i) (b i))
    (hvol : ∀ i, ∀ y ∈ Metric.ball (0 : ℂ) R, canonFibreVolume τ (W i) y = ε i)
    (hε : Tendsto ε atTop (𝓝 0)) :
    TendstoUniformlyOn W (fun _ => 0) atTop (tubeOver R₀) ∧
      ∀ y₀ ∈ Metric.ball (0 : ℂ) R,
        TendstoUniformly (fun i (x : ℂ) => (ε i)⁻¹ * W i (x, y₀) * (τ y₀).im) (fun _ => 1)
          atTop := by
  sorry

end GrossWilsonK3
