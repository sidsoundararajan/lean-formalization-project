import Mathlib
import Definitions.Def_GrossWilsonK3_Geometry
import Definitions.Def_GrossWilsonK3_Distances
import Definitions.Def_GrossWilsonK3_GromovHausdorff

open scoped Manifold ContDiff
open Filter Topology

namespace GrossWilsonK3

/-- Gross–Wilson, Theorem 6.4.  `(M, J₀, Ω₀)` is a K3 surface with an elliptic fibration
`j : M → ℙ¹` that has a holomorphic section and only `I₁` singular fibres.  The surfaces `Xᵢ`
with Jacobian `j` are the same manifold `M` with holomorphic 2-form `Ωᵢ = Ω₀ + j^*αᵢ` and complex
structure `Jᵢ`.  The `ωᵢ` are Ricci-flat Kähler forms normalised by `ωᵢ² = (Re Ωᵢ)²` (so `∫ ωᵢ²`
does not depend on `i`), with fibre area `εᵢ → 0`.  Then `(M, εᵢ ωᵢ)` converges in the
Gromov–Hausdorff sense to `ℙ¹` with McLean's metric `W₀⁻¹ dy ⊗ dȳ`. -/
theorem thm_6_4
    {M : Type} [TopologicalSpace M] [ChartedSpace E4 M] [IsManifold I4 ∞ M] [T2Space M]
    [CompactSpace M] [ConnectedSpace M] [SimplyConnectedSpace M]
    (J₀ : EndField M) (Ω₀ : ComplexTwoForm M) (j : M → OnePoint ℂ) (σ₀ : OnePoint ℂ → M)
    (hK3 : IsK3 J₀ Ω₀) (hfib : IsEllipticFibration J₀ j) (hI1 : AllSingularFibresI1 j)
    (hσ₀ : IsHolomorphicSection J₀ j σ₀)
    (α : ℕ → BaseTwoForm) (Ω : ℕ → ComplexTwoForm M) (J : ℕ → EndField M)
    (κ : ℕ → RealTwoForm M) (ε : ℕ → ℝ)
    (hΩ : ∀ i x u v, Ω i x ![u, v] = Ω₀ x ![u, v] + pullbackBase j (α i) x u v)
    (hJ : ∀ i, IsAlmostComplex (J i)) (hΩJ : ∀ i, IsType20 (J i) (Ω i))
    (hκ : ∀ i, IsKahlerForm (J i) (κ i))
    (hRicciFlat : ∀ i x v, wedge22 (κ i x) (κ i x) v = wedge22 (rePart (Ω i) x) (rePart (Ω i) x) v)
    (harea : ∀ i b, b ∉ criticalValues j → fibreArea J₀ j (κ i) b = ε i)
    (hε : Tendsto ε atTop (𝓝 0)) :
    GHConverges (fun i x y => Real.sqrt (ε i) * riemDist (kahlerMetric (κ i) (J i)) x y)
      (mcLeanDist J₀ Ω₀ j) := by
  sorry

end GrossWilsonK3
