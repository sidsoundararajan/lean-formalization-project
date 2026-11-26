import Mathlib

/-!
# Gross–Wilson, *Large complex structure limits of K3 surfaces*: geometric setting

Everything lives on a smooth real 4-manifold `M` (model space `ℝ⁴`).  A complex structure is
encoded by an almost complex structure `J`, differential forms are encoded pointwise as
continuous alternating maps on the tangent space `T_x M = ℝ⁴`, and the base `ℙ¹` of an elliptic
fibration is the Riemann sphere `OnePoint ℂ`, handled through its two affine charts
`y` (away from `∞`) and `w = 1/y` (away from `0`).
-/

open scoped Manifold ContDiff
open Set

noncomputable section

namespace GrossWilson

/-- The model vector space `ℝ⁴` of a real 4-manifold. -/
abbrev E4 : Type := EuclideanSpace ℝ (Fin 4)

/-- The (boundaryless) model with corners `ℝ⁴`. -/
abbrev I4 : ModelWithCorners ℝ E4 E4 := 𝓘(ℝ, E4)

variable {M : Type*} [TopologicalSpace M] [ChartedSpace E4 M]

/-! ## Differential forms and tensor fields, pointwise and in charts -/

/-- A real-valued differential 2-form on `M`, given pointwise. -/
abbrev RealTwoForm (M : Type*) : Type _ := M → E4 [⋀^Fin 2]→L[ℝ] ℝ

/-- A complex-valued differential 2-form on `M`, given pointwise (real-multilinear, `ℂ`-valued). -/
abbrev ComplexTwoForm (M : Type*) : Type _ := M → E4 [⋀^Fin 2]→L[ℝ] ℂ

/-- A field of real-linear endomorphisms of the tangent spaces of `M`. -/
abbrev EndField (M : Type*) : Type _ := M → E4 →L[ℝ] E4

/-- Coordinate expression of an `F`-valued `n`-form `η` in the preferred chart at `x₀`:
the pull-back of `η` along the inverse chart, as a function on the chart's target in `ℝ⁴`. -/
def formInChart {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : ℕ}
    (η : M → E4 [⋀^Fin n]→L[ℝ] F) (x₀ : M) (y : E4) : E4 [⋀^Fin n]→L[ℝ] F :=
  (η ((extChartAt I4 x₀).symm y)).compContinuousLinearMap
    (mfderiv I4 I4 (extChartAt I4 x₀).symm y)

/-- An `F`-valued `n`-form is smooth if all of its chart expressions are `C^∞`. -/
def IsSmoothForm {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : ℕ}
    (η : M → E4 [⋀^Fin n]→L[ℝ] F) : Prop :=
  ∀ x₀ : M, ContDiffOn ℝ ∞ (formInChart η x₀) (extChartAt I4 x₀).target

/-- An `F`-valued `n`-form is closed (`dη = 0`) if its exterior derivative vanishes in every
chart. -/
def IsClosedForm {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : ℕ}
    (η : M → E4 [⋀^Fin n]→L[ℝ] F) : Prop :=
  ∀ x₀ : M, ∀ y ∈ (extChartAt I4 x₀).target, extDeriv (formInChart η x₀) y = 0

/-- Coordinate expression of an endomorphism field in the preferred chart at `x₀`. -/
def endInChart (A : EndField M) (x₀ : M) (y : E4) : E4 →L[ℝ] E4 :=
  (mfderiv I4 I4 (extChartAt I4 x₀) ((extChartAt I4 x₀).symm y)).comp
    ((A ((extChartAt I4 x₀).symm y)).comp (mfderiv I4 I4 (extChartAt I4 x₀).symm y))

/-- An almost complex structure: a smooth endomorphism field with `J ∘ J = -id`. -/
def IsAlmostComplex (J : EndField M) : Prop :=
  (∀ x : M, (J x).comp (J x) = -ContinuousLinearMap.id ℝ E4) ∧
    ∀ x₀ : M, ContDiffOn ℝ ∞ (endInChart J x₀) (extChartAt I4 x₀).target

/-- The real part of a complex 2-form. -/
def rePart (Ω : ComplexTwoForm M) : RealTwoForm M :=
  fun x => Complex.reCLM.compContinuousAlternatingMap (Ω x)

/-- The wedge product of two 2-forms on `ℝ⁴`, evaluated on four vectors:
`(α ∧ β)(v₀,v₁,v₂,v₃) = Σ_{(2,2)-shuffles σ} sgn σ · α(v_{σ0},v_{σ1}) β(v_{σ2},v_{σ3})`. -/
def wedge22 (α β : E4 [⋀^Fin 2]→L[ℝ] ℝ) (v : Fin 4 → E4) : ℝ :=
  α ![v 0, v 1] * β ![v 2, v 3] - α ![v 0, v 2] * β ![v 1, v 3]
    + α ![v 0, v 3] * β ![v 1, v 2] + α ![v 1, v 2] * β ![v 0, v 3]
    - α ![v 1, v 3] * β ![v 0, v 2] + α ![v 2, v 3] * β ![v 0, v 1]

/-- `Ω` has type `(2,0)` with respect to `J`: `Ω(Ju, v) = i Ω(u, v)` (hence also in `v`). -/
def IsType20 (J : EndField M) (Ω : ComplexTwoForm M) : Prop :=
  ∀ (x : M) (u v : E4), Ω x ![J x u, v] = Complex.I * Ω x ![u, v]

/-- The symmetric bilinear form `g(u,v) = κ(u, J v)` attached to a 2-form `κ` and an almost
complex structure `J` (the paper's convention `g(ζ, ξ) = ω(ζ, Jξ)`). -/
def kahlerMetric (κ : RealTwoForm M) (J : EndField M) (x : M) (u v : E4) : ℝ :=
  κ x ![u, J x v]

/-- `κ` is a Kähler form for `J`: a smooth closed real 2-form, `J`-invariant, whose associated
`g(u,u) = κ(u, Ju)` is positive definite. -/
def IsKahlerForm (J : EndField M) (κ : RealTwoForm M) : Prop :=
  IsSmoothForm κ ∧ IsClosedForm κ ∧
    (∀ (x : M) (u v : E4), κ x ![J x u, J x v] = κ x ![u, v]) ∧
    ∀ (x : M) (u : E4), u ≠ 0 → 0 < kahlerMetric κ J x u u

/-- A K3 structure on the (compact, connected, simply connected) smooth 4-manifold `M`:
an almost complex structure `J` together with a smooth, closed, nowhere-vanishing complex 2-form
`Ω` of type `(2,0)` (a holomorphic symplectic form). -/
def IsK3 (J : EndField M) (Ω : ComplexTwoForm M) : Prop :=
  IsAlmostComplex J ∧ IsSmoothForm Ω ∧ IsClosedForm Ω ∧ IsType20 J Ω ∧ ∀ x : M, Ω x ≠ 0

/-! ## The Riemann sphere `ℙ¹ = OnePoint ℂ` and maps to and from it -/

/-- The affine coordinate `y` on `ℙ¹ \ {∞}` (with the junk value `0` at `∞`). -/
def affC (p : OnePoint ℂ) : ℂ := OnePoint.elim p 0 id

/-- The affine coordinate `w = 1/y` on `ℙ¹ \ {0}` (`w(∞) = 0`; junk value `0` at `y = 0`). -/
def invC (p : OnePoint ℂ) : ℂ := OnePoint.elim p 0 (fun z => z⁻¹)

/-- The differential `dφ_x : T_x M = ℝ⁴ → ℂ` of a function `φ : M → ℂ`. -/
def dC (φ : M → ℂ) (x : M) : E4 →L[ℝ] ℂ := mfderiv I4 𝓘(ℝ, ℂ) φ x

/-- A function `φ : M → ℂ` is smooth at `x` and `J`-holomorphic there:
`dφ_x (J u) = i · dφ_x u`. -/
def IsJHolomorphicAt (J : EndField M) (φ : M → ℂ) (x : M) : Prop :=
  ContMDiffAt I4 𝓘(ℝ, ℂ) ∞ φ x ∧ ∀ u : E4, dC φ x (J x u) = Complex.I * dC φ x u

/-- A continuous map `j : M → ℙ¹` is holomorphic for `J`: it is `J`-holomorphic in the affine
chart `y` near every point not sent to `∞`, and in the chart `w = 1/y` near every point not sent
to `0`. -/
def IsHolomorphicToSphere (J : EndField M) (j : M → OnePoint ℂ) : Prop :=
  Continuous j ∧ ∀ x : M,
    (j x ≠ OnePoint.infty → IsJHolomorphicAt J (affC ∘ j) x) ∧
      (j x ≠ ((0 : ℂ) : OnePoint ℂ) → IsJHolomorphicAt J (invC ∘ j) x)

open Classical in
/-- The affine coordinate of `ℙ¹` used near the fibre through `x`: `y` unless `j x = ∞`,
in which case `w = 1/y`. -/
def localCoord (j : M → OnePoint ℂ) (x : M) : M → ℂ :=
  if j x = OnePoint.infty then invC ∘ j else affC ∘ j

/-- `x` is a critical point of `j` (the differential of `j` vanishes at `x`). -/
def IsCriticalPt (j : M → OnePoint ℂ) (x : M) : Prop :=
  dC (localCoord j x) x = 0

/-- The discriminant locus `Δ ⊆ ℙ¹`: the critical values of `j`. -/
def criticalValues (j : M → OnePoint ℂ) : Set (OnePoint ℂ) :=
  {b | ∃ x, IsCriticalPt j x ∧ j x = b}

/-- `x` is a non-degenerate critical point of `j`: the second derivative of `j` at `x`, computed
in a chart, is a non-degenerate bilinear form (`H(u,·) ≠ 0` for `u ≠ 0`).  At a critical point
this condition does not depend on the chart; for a holomorphic map it says that locally
`j = z₁ z₂` in suitable holomorphic coordinates (an ordinary node of the fibre). -/
def IsNondegenerateCriticalPt (j : M → OnePoint ℂ) (x : M) : Prop :=
  IsCriticalPt j x ∧
    ∀ u : E4, u ≠ 0 → ∃ v : E4,
      fderiv ℝ (fderiv ℝ (localCoord j x ∘ (extChartAt I4 x).symm)) (extChartAt I4 x x) u v ≠ 0

/-- An elliptic fibration `j : M → ℙ¹` (for the complex structure `J`): a surjective holomorphic
map with connected fibres.  (On a K3 surface the smooth fibres of such a map are elliptic
curves.) -/
def IsEllipticFibration (J : EndField M) (j : M → OnePoint ℂ) : Prop :=
  IsHolomorphicToSphere J j ∧ Function.Surjective j ∧ ∀ b : OnePoint ℂ, IsConnected (j ⁻¹' {b})

/-- All singular fibres of `j` are of Kodaira type `I₁`: every critical point of `j` is
non-degenerate and no fibre contains two critical points (each singular fibre has exactly one
singular point, an ordinary node). -/
def AllSingularFibresI1 (j : M → OnePoint ℂ) : Prop :=
  ∀ x : M, IsCriticalPt j x →
    IsNondegenerateCriticalPt j x ∧ ∀ x' : M, IsCriticalPt j x' → j x' = j x → x' = x

open Classical in
/-- The section `σ` read in the affine chart `w = 1/y` of `ℙ¹` (with `w = 0 ↦ σ(∞)`). -/
def sectionAtInfty (σ : OnePoint ℂ → M) (w : ℂ) : M :=
  if w = 0 then σ OnePoint.infty else σ ((w⁻¹ : ℂ) : OnePoint ℂ)

/-- A map `s : ℂ → M` is smooth with `J`-complex-linear differential (holomorphic). -/
def IsHolomorphicFromC (J : EndField M) (s : ℂ → M) : Prop :=
  ContMDiff 𝓘(ℝ, ℂ) I4 ∞ s ∧
    ∀ z a : ℂ, mfderiv 𝓘(ℝ, ℂ) I4 s z (Complex.I * a) = J (s z) (mfderiv 𝓘(ℝ, ℂ) I4 s z a)

/-- `σ` is a holomorphic section of `j : M → ℙ¹`: `j ∘ σ = id`, and `σ` is holomorphic in both
affine charts of `ℙ¹`. -/
def IsHolomorphicSection (J : EndField M) (j : M → OnePoint ℂ) (σ : OnePoint ℂ → M) : Prop :=
  (∀ b, j (σ b) = b) ∧ IsHolomorphicFromC J (fun z : ℂ => σ (z : OnePoint ℂ)) ∧
    IsHolomorphicFromC J (sectionAtInfty σ)

/-! ## 2-forms on the base `ℙ¹` and their pull-backs -/

/-- The standard area form `dy₁ ∧ dy₂` on `ℂ = ℝ²`: `(p, q) ↦ Re p · Im q - Im p · Re q`. -/
def areaC (p q : ℂ) : ℝ := p.re * q.im - p.im * q.re

/-- A smooth complex-valued 2-form `α` on `ℙ¹`, given by its coefficients in the two affine
charts: `α = a₀(y) dy₁ ∧ dy₂ = aInf(w) dw₁ ∧ dw₂`, so `aInf(w) = a₀(1/w) / |w|⁴` for `w ≠ 0`. -/
structure BaseTwoForm where
  a₀ : ℂ → ℂ
  aInf : ℂ → ℂ
  smooth₀ : ContDiff ℝ ∞ a₀
  smoothInf : ContDiff ℝ ∞ aInf
  compat : ∀ w : ℂ, w ≠ 0 → aInf w = a₀ w⁻¹ / ((‖w‖ ^ 4 : ℝ) : ℂ)

open Classical in
/-- The pull-back `j^* α` of a 2-form on `ℙ¹` to `M`, evaluated on two tangent vectors
`u, v ∈ T_x M`; it is computed in the affine chart `y` of `ℙ¹` if `j x ≠ ∞` and in the chart
`w = 1/y` if `j x = ∞`. -/
def pullbackBase (j : M → OnePoint ℂ) (α : BaseTwoForm) (x : M) (u v : E4) : ℂ :=
  if j x = OnePoint.infty then
    α.aInf 0 *
      ((areaC (dC (invC ∘ j) x u) (dC (invC ∘ j) x v) : ℝ) : ℂ)
  else
    α.a₀ (affC (j x)) *
      ((areaC (dC (affC ∘ j) x u) (dC (affC ∘ j) x v) : ℝ) : ℂ)

end GrossWilson
