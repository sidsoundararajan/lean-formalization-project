import Mathlib
import Definitions.Def_GrossWilsonK3_CanonicalCoords

open scoped ContDiff

namespace GrossWilsonK3

/-- Gross–Wilson, Lemma 4.1 (first part): a closed real `(1,1)`-form on `X_{U*}` is `i∂∂̄φ` for a
function `φ` on `X_{U*}` iff it represents the zero class and `∫_{X_b} β dx₁ ∧ dx₂ = 0` for all
`b ∈ U*`. -/
theorem lemma_4_1_a (U : Set ℂ) (τ₁ τ₂ : ℂ → ℂ) (hU : IsI1PeriodData U τ₁ τ₂)
    (α γ : C2 → ℝ) (β : C2 → ℂ)
    (hα : ContDiffOn ℝ ∞ α (puncturedTube U)) (hβ : ContDiffOn ℝ ∞ β (puncturedTube U))
    (hγ : ContDiffOn ℝ ∞ γ (puncturedTube U))
    (hαp : IsLatticePeriodic U τ₁ τ₂ α) (hβp : IsLatticePeriodic U τ₁ τ₂ β)
    (hγp : IsLatticePeriodic U τ₁ τ₂ γ)
    (hclosed : IsClosed11 U (frameCoeff τ₁ τ₂ α γ β)) :
    (∃ φ : C2 → ℝ, ContDiffOn ℝ ∞ φ (puncturedTube U) ∧ IsLatticePeriodic U τ₁ τ₂ φ ∧
        IsDdbarOf U (frameCoeff τ₁ τ₂ α γ β) φ) ↔
      (IsExactOnQuotient U τ₁ τ₂ (frameCoeff τ₁ τ₂ α γ β) ∧
        ∀ y ∈ U \ {0}, fibreIntegralC τ₁ τ₂ β y = 0) := by
  sorry

end GrossWilsonK3
