import Mathlib
import Definitions.Def_GrossWilsonK3_CanonicalCoords

open scoped ContDiff ENNReal

namespace GrossWilsonK3

/-- Gross–Wilson, Lemma 4.1 (estimate): on annuli `U_{r₁',r₂'} ⋐ U_{r₁,r₂} ⋐ U*`, the potential
`φ` can be chosen with `‖φ‖'_{C^{k+2,μ}} ≤ C(‖α‖_{C^{k,μ}} + ‖β‖_{C^{k,μ}} + ‖γ‖_{C^{k,μ}})`,
the norms taken on bounded open sets `T'`, `T` containing a fundamental domain of each fibre. -/
theorem lemma_4_1_b (U : Set ℂ) (τ₁ τ₂ : ℂ → ℂ) (hU : IsI1PeriodData U τ₁ τ₂)
    (r₁ r₁' r₂' r₂ : ℝ) (h₀ : 0 < r₁) (h₁ : r₁ < r₁') (h₂ : r₁' < r₂') (h₃ : r₂' < r₂)
    (hann : {y : ℂ | r₁ ≤ ‖y‖ ∧ ‖y‖ ≤ r₂} ⊆ U \ {0})
    (k : ℕ) (μ : ℝ) (hμ₀ : 0 < μ) (hμ₁ : μ < 1)
    (T T' : Set C2) (hT : IsOpen T) (hTb : Bornology.IsBounded T)
    (hTf : ContainsFundamentalDomains τ₁ τ₂ T (annulusC r₁ r₂))
    (hT' : IsOpen T') (hT'b : Bornology.IsBounded T')
    (hT'f : ContainsFundamentalDomains τ₁ τ₂ T' (annulusC r₁' r₂')) :
    ∃ C : ℝ, ∀ (α γ : C2 → ℝ) (β : C2 → ℂ),
      ContDiffOn ℝ ∞ α (puncturedTube U) → ContDiffOn ℝ ∞ β (puncturedTube U) →
      ContDiffOn ℝ ∞ γ (puncturedTube U) →
      IsLatticePeriodic U τ₁ τ₂ α → IsLatticePeriodic U τ₁ τ₂ β → IsLatticePeriodic U τ₁ τ₂ γ →
      IsClosed11 U (frameCoeff τ₁ τ₂ α γ β) →
      IsExactOnQuotient U τ₁ τ₂ (frameCoeff τ₁ τ₂ α γ β) →
      (∀ y ∈ U \ {0}, fibreIntegralC τ₁ τ₂ β y = 0) →
      ∃ φ : C2 → ℝ, ContDiffOn ℝ ∞ φ (puncturedTube U) ∧ IsLatticePeriodic U τ₁ τ₂ φ ∧
        IsDdbarOf U (frameCoeff τ₁ τ₂ α γ β) φ ∧
        holderNorm (k + 2) μ φ T' ≤
          ENNReal.ofReal C * (holderNorm k μ α T + holderNorm k μ β T + holderNorm k μ γ T) := by
  sorry

end GrossWilsonK3
