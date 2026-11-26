import Definitions.Def_GrossWilsonK3_Geometry

/-!
# Gross–Wilson: fibre integrals, Riemannian distances, and McLean's metric on the base

* Integrals over a smooth fibre `j⁻¹(b)` (an elliptic curve, topologically a torus) are computed
  through a smooth, `ℤ²`-periodic parametrisation `φ : ℝ² → M` that descends to a diffeomorphism
  `ℝ²/ℤ² ≅ j⁻¹(b)` and is positively oriented for the complex structure of the fibre.
* The distance of a Riemannian metric `g` is the infimum of lengths of `C¹` curves.
* McLean's metric on the base `B = ℙ¹` is `W₀⁻¹ dy ⊗ dȳ` with `W₀⁻¹ = Im(τ̄₁ τ₂)` the area of the
  period lattice of the fibre in the canonical fibre coordinate `x` (`Ω = dx ∧ dy`).  Intrinsically,
  for a tangent vector `v` at `b ∉ Δ` with lift `ṽ`, `|v|² = (i/2) ∫_{j⁻¹(b)} ι_ṽΩ ∧ conj(ι_ṽΩ)`.
-/

open scoped Manifold ContDiff ENNReal
open Set MeasureTheory

noncomputable section

namespace GrossWilson

variable {M : Type*} [TopologicalSpace M] [ChartedSpace E4 M]

/-- The partial derivative `∂φ/∂s` of a map `φ : ℝ × ℝ → M`, `(s, t) ↦ φ(s, t)`. -/
def partialS (φ : ℝ × ℝ → M) (p : ℝ × ℝ) : E4 := mfderiv 𝓘(ℝ, ℝ × ℝ) I4 φ p (1, 0)

/-- The partial derivative `∂φ/∂t` of a map `φ : ℝ × ℝ → M`, `(s, t) ↦ φ(s, t)`. -/
def partialT (φ : ℝ × ℝ → M) (p : ℝ × ℝ) : E4 := mfderiv 𝓘(ℝ, ℝ × ℝ) I4 φ p (0, 1)

/-- `φ : ℝ² → M` is an oriented parametrisation of the fibre `j⁻¹(b)`: it is smooth,
`ℤ²`-periodic, maps onto the fibre, is injective modulo `ℤ²` (so it descends to a bijection
`ℝ²/ℤ² → j⁻¹(b)`), and is an immersion that is positively oriented for the complex structure:
`∂φ/∂s ≠ 0` and `∂φ/∂t = r ∂φ/∂s + s' J(∂φ/∂s)` with `s' > 0`. -/
structure IsFibreParam (J : EndField M) (j : M → OnePoint ℂ) (b : OnePoint ℂ)
    (φ : ℝ × ℝ → M) : Prop where
  smooth : ContMDiff 𝓘(ℝ, ℝ × ℝ) I4 ∞ φ
  periodic : ∀ (p : ℝ × ℝ) (m n : ℤ), φ (p.1 + m, p.2 + n) = φ p
  mapsTo : ∀ p, j (φ p) = b
  surj : ∀ x, j x = b → ∃ p, φ p = x
  inj : ∀ p q, φ p = φ q → ∃ m n : ℤ, q = (p.1 + m, p.2 + n)
  oriented : ∀ p, partialS φ p ≠ 0 ∧
    ∃ r s : ℝ, 0 < s ∧ partialT φ p = r • partialS φ p + s • J (φ p) (partialS φ p)

open Classical in
/-- Integral over the fibre `j⁻¹(b)` of the 2-form-like integrand `F φ (s,t)` computed from an
oriented parametrisation `φ` of the fibre (over the fundamental domain `[0,1]²`).  It is `0` if the
fibre admits no such parametrisation (e.g. a singular fibre). -/
def fibreIntegral (J : EndField M) (j : M → OnePoint ℂ) (F : (ℝ × ℝ → M) → ℝ × ℝ → ℝ)
    (b : OnePoint ℂ) : ℝ :=
  if h : ∃ φ, IsFibreParam J j b φ then
    ∫ s in (0 : ℝ)..1, ∫ t in (0 : ℝ)..1, F h.choose (s, t)
  else 0

/-- `∫_{j⁻¹(b)} κ` for a real 2-form `κ` (fibres oriented by the complex structure `J`). -/
def fibreArea (J : EndField M) (j : M → OnePoint ℂ) (κ : RealTwoForm M) (b : OnePoint ℂ) : ℝ :=
  fibreIntegral J j (fun φ p => κ (φ p) ![partialS φ p, partialT φ p]) b

open Classical in
/-- A tangent vector `ṽ ∈ T_x M` with `dy(ṽ) = 1`, for a local coordinate `y : M → ℂ` of the
base pulled back to `M` (junk value `0` if none exists, i.e. at a critical point). -/
def liftOne (y : M → ℂ) (x : M) : E4 :=
  if h : ∃ v : E4, dC y x v = 1 then h.choose else 0

/-- The density of McLean's metric at `b ∉ Δ`, in the base coordinate `y` (pulled back to `M`):
`W₀⁻¹(b) = (i/2) ∫_{j⁻¹(b)} ι_ṽΩ ∧ conj(ι_ṽΩ)` with `dy(ṽ) = 1`, where for an oriented
parametrisation `φ`, `(i/2) α ∧ ᾱ (∂_s φ, ∂_t φ) = Im(conj(α(∂_s φ)) · α(∂_t φ))`.  For
holomorphic canonical coordinates (`Ω = dx ∧ dy`) this is the area `Im(τ̄₁τ₂)` of the period
lattice of the fibre. -/
def mcLeanDensity (J : EndField M) (Ω : ComplexTwoForm M) (j : M → OnePoint ℂ) (y : M → ℂ)
    (b : OnePoint ℂ) : ℝ :=
  fibreIntegral J j
    (fun φ p => (starRingEnd ℂ (Ω (φ p) ![liftOne y (φ p), partialS φ p]) *
      Ω (φ p) ![liftOne y (φ p), partialT φ p]).im) b

/-- A curve `c : ℝ → ℙ¹` that is continuous and `C¹` in both affine charts of `ℙ¹`. -/
def IsC1SphereCurve (c : ℝ → OnePoint ℂ) : Prop :=
  Continuous c ∧ ∀ t : ℝ,
    (c t ≠ OnePoint.infty → ContDiffAt ℝ 1 (affC ∘ c) t) ∧
      (c t ≠ ((0 : ℂ) : OnePoint ℂ) → ContDiffAt ℝ 1 (invC ∘ c) t)

open Classical in
/-- The speed of a `C¹` curve `c` in `ℙ¹` for McLean's metric `W₀⁻¹ dy ⊗ dȳ`, computed in the
affine chart `y` (or `w = 1/y` at `∞`); it is set to `0` at times when `c` is in the discriminant
locus `Δ`, where the metric is singular. -/
def baseSpeed (J : EndField M) (Ω : ComplexTwoForm M) (j : M → OnePoint ℂ)
    (c : ℝ → OnePoint ℂ) (t : ℝ) : ℝ :=
  if c t ∈ criticalValues j then 0
  else if c t = OnePoint.infty then
    ‖deriv (invC ∘ c) t‖ * Real.sqrt (mcLeanDensity J Ω j (invC ∘ j) (c t))
  else
    ‖deriv (affC ∘ c) t‖ * Real.sqrt (mcLeanDensity J Ω j (affC ∘ j) (c t))

/-- McLean's (singular) distance on `ℙ¹`: the infimum of the McLean lengths of `C¹` curves. -/
def mcLeanDist (J : EndField M) (Ω : ComplexTwoForm M) (j : M → OnePoint ℂ)
    (b₁ b₂ : OnePoint ℂ) : ℝ :=
  (⨅ (c : ℝ → OnePoint ℂ) (_ : IsC1SphereCurve c ∧ c 0 = b₁ ∧ c 1 = b₂),
    ∫⁻ t in Icc (0 : ℝ) 1, ENNReal.ofReal (baseSpeed J Ω j c t)).toReal

/-- The velocity `γ'(t) ∈ T_{γ(t)} M` of a curve `γ : ℝ → M`. -/
def curveVel (γ : ℝ → M) (t : ℝ) : E4 := mfderiv 𝓘(ℝ, ℝ) I4 γ t 1

/-- The distance between `x` and `y` for a Riemannian metric `g` on `M`: the infimum over `C¹`
curves `γ` from `x` to `y` of `∫₀¹ √(g(γ', γ'))`. -/
def riemDist (g : M → E4 → E4 → ℝ) (x y : M) : ℝ :=
  (⨅ (γ : ℝ → M) (_ : ContMDiff 𝓘(ℝ, ℝ) I4 1 γ ∧ γ 0 = x ∧ γ 1 = y),
    ∫⁻ t in Icc (0 : ℝ) 1,
      ENNReal.ofReal (Real.sqrt (g (γ t) (curveVel γ t) (curveVel γ t)))).toReal

end GrossWilson
