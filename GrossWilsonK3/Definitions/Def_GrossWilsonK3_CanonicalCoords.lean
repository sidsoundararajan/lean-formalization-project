import Mathlib

/-!
# Gross–Wilson §2 and §4: metrics in holomorphic canonical coordinates

Points of `T*_B ⊆ ℂ²` are pairs `p = (x, y)`: `y = y₁ + i y₂` is a holomorphic coordinate on the
base and `x = x₁ + i x₂` the canonical fibre coordinate, so that `Ω = dx ∧ dy`.  An elliptic
fibration over an open set of the base is `X = T*_B / Λ` for a lattice `Λ_y ⊆ ℂ` in each fibre.

* §2: a Kähler form in these coordinates is
  `ω = (i/2)(W (dx + b dy) ∧ conj(dx + b dy) + W⁻¹ dy ∧ dȳ)` (normalised so `ω² = (Im Ω)²`),
  and `dω = 0` is the pair of equations `∂_y W = ∂_x(W b)`, `∂_y(W b̄) = ∂_x(W(W⁻² + |b|²))`.
* §4: near an `I₁` fibre over `y = 0`, the periods are `τ₁` (single-valued) and `τ₂`
  (multi-valued, `τ₂ ↦ τ₂ + τ₁` around `y = 0`), encoded by a lift of `τ₂` to the logarithmic
  coordinate `s` with `y = eˢ`.
-/

open scoped ContDiff ENNReal NNReal ComplexConjugate
open Complex Set

noncomputable section

namespace GrossWilsonK3

/-- `ℂ²`, with points `p = (x, y)`. -/
abbrev C2 : Type := ℂ × ℂ

/-! ## Wirtinger derivatives on `ℂ²` -/

/-- `∂F/∂x₁` (real partial derivative in `Re x`). -/
def pX1 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (1, 0)
/-- `∂F/∂x₂` (real partial derivative in `Im x`). -/
def pX2 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (I, 0)
/-- `∂F/∂y₁` (real partial derivative in `Re y`). -/
def pY1 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (0, 1)
/-- `∂F/∂y₂` (real partial derivative in `Im y`). -/
def pY2 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (0, I)

/-- The Wirtinger derivative `∂_x = ½(∂_{x₁} - i ∂_{x₂})`. -/
def wX (F : C2 → ℂ) (p : C2) : ℂ := (pX1 F p - I * pX2 F p) / 2
/-- The Wirtinger derivative `∂_{x̄} = ½(∂_{x₁} + i ∂_{x₂})`. -/
def wXbar (F : C2 → ℂ) (p : C2) : ℂ := (pX1 F p + I * pX2 F p) / 2
/-- The Wirtinger derivative `∂_y = ½(∂_{y₁} - i ∂_{y₂})`. -/
def wY (F : C2 → ℂ) (p : C2) : ℂ := (pY1 F p - I * pY2 F p) / 2
/-- The Wirtinger derivative `∂_{ȳ} = ½(∂_{y₁} + i ∂_{y₂})`. -/
def wYbar (F : C2 → ℂ) (p : C2) : ℂ := (pY1 F p + I * pY2 F p) / 2

/-- A real-valued function regarded as complex-valued. -/
def ofRealFun (W : C2 → ℝ) : C2 → ℂ := fun p => (W p : ℂ)

/-! ## §2: `S¹`-invariant Ricci-flat metrics in canonical form (Construction 2.6) -/

/-- `π⁻¹(B)` for the open disc `B` of radius `R` centred at `0` in the `y`-plane. -/
def tubeOver (R : ℝ) : Set C2 := {p | ‖p.2‖ < R}

/-- An `S¹`-invariant Ricci-flat metric in canonical form on `X = (B × ℂ)/(ℤ + τ(y) ℤ)`, `B` the
disc of radius `R`: the Kähler form `(i/2)(W (dx + b dy) ∧ conj(dx + b dy) + W⁻¹ dy ∧ dȳ)` with
smooth `W > 0` and `b`, both independent of `x₁` (the `S¹`-invariance), descending to `X`
(`W(x + τ, y) = W(x, y)` and `b(x + τ, y) = b(x, y) - τ'(y)`, the transformation rule that makes
`dx + b dy` invariant under `x ↦ x + τ(y)`), and closed (`dω = 0`, i.e. the two equations of §2). -/
structure IsS1InvRicciFlatCanonical (R : ℝ) (τ : ℂ → ℂ) (W : C2 → ℝ) (b : C2 → ℂ) : Prop where
  smoothW : ContDiffOn ℝ ∞ W (tubeOver R)
  smoothB : ContDiffOn ℝ ∞ b (tubeOver R)
  pos : ∀ p ∈ tubeOver R, 0 < W p
  s1Invariant : ∀ p ∈ tubeOver R, ∀ t : ℝ, W (p.1 + t, p.2) = W p ∧ b (p.1 + t, p.2) = b p
  periodic : ∀ p ∈ tubeOver R,
    W (p.1 + τ p.2, p.2) = W p ∧ b (p.1 + τ p.2, p.2) = b p - deriv τ p.2
  closed₁ : ∀ p ∈ tubeOver R, wY (ofRealFun W) p = wX (fun q => (W q : ℂ) * b q) p
  closed₂ : ∀ p ∈ tubeOver R,
    wY (fun q => (W q : ℂ) * conj (b q)) p =
      wX (fun q => (((W q)⁻¹ + W q * ‖b q‖ ^ 2 : ℝ) : ℂ)) p

/-- The volume `∫_{X_y} W dx₁ ∧ dx₂` of the fibre over `y` for periods `{1, τ(y)}`: the integral of
`W` over the fundamental parallelogram `{s + t τ(y) : s, t ∈ [0,1]}`, of area `Im τ(y)`. -/
def canonFibreVolume (τ : ℂ → ℂ) (W : C2 → ℝ) (y : ℂ) : ℝ :=
  (τ y).im * ∫ t in (0 : ℝ)..1, ∫ s in (0 : ℝ)..1, W ((s : ℂ) + t * τ y, y)

/-! ## §4: the punctured neighbourhood of an `I₁` fibre -/

/-- Period data near an `I₁` fibre over `y = 0` (§4, before Lemma 4.1).  `U ⊆ ℂ` is an open
contractible neighbourhood of `0`, `τ₁` is a single-valued holomorphic period on `U* = U \ {0}`,
and the multi-valued period `τ₂` is given by its lift to the logarithmic coordinate `s`
(`y = eˢ`): holomorphic in `s`, with monodromy `τ₂(s + 2πi) = τ₂(s) + τ₁(eˢ)`, and
`Im(τ̄₁ τ₂) > 0`. -/
structure IsI1PeriodData (U : Set ℂ) (τ₁ τ₂ : ℂ → ℂ) : Prop where
  isOpen : IsOpen U
  zero_mem : (0 : ℂ) ∈ U
  contractible : ContractibleSpace U
  holo₁ : DifferentiableOn ℂ τ₁ (U \ {0})
  holo₂ : DifferentiableOn ℂ τ₂ (Complex.exp ⁻¹' U)
  monodromy : ∀ s : ℂ, Complex.exp s ∈ U →
    τ₂ (s + 2 * Real.pi * I) = τ₂ s + τ₁ (Complex.exp s)
  pos : ∀ s : ℂ, Complex.exp s ∈ U → 0 < (conj (τ₁ (Complex.exp s)) * τ₂ s).im

/-- The value at `y` of (a branch of) the multi-valued period `τ₂`. -/
def tau2At (τ₂ : ℂ → ℂ) (y : ℂ) : ℂ := τ₂ (Complex.log y)

/-- `∂_y τ₂` at `y` (`= (dτ₂/ds)/y`, independent of the branch). -/
def dTau2At (τ₂ : ℂ → ℂ) (y : ℂ) : ℂ := deriv τ₂ (Complex.log y) / y

/-- The period lattice `Λ_y = ℤ τ₁(y) + ℤ τ₂(y)` (independent of the branch of `τ₂`). -/
def periodLattice (τ₁ τ₂ : ℂ → ℂ) (y : ℂ) : Set ℂ :=
  {l | ∃ m n : ℤ, l = (m : ℂ) * τ₁ y + (n : ℂ) * tau2At τ₂ y}

/-- `X_{U*}` as a subset of `T*_{U*} = U* × ℂ`. -/
def puncturedTube (U : Set ℂ) : Set C2 := {p | p.2 ∈ U \ {0}}

/-- `W₀(y) = 1 / Im(τ̄₁ τ₂)` (§4). -/
def W0 (τ₁ τ₂ : ℂ → ℂ) (y : ℂ) : ℝ := 1 / (conj (τ₁ y) * tau2At τ₂ y).im

/-- `b₀(x, y) = -(Im(τ₂ x̄) ∂_y τ₁ + Im(τ̄₁ x) ∂_y τ₂) / Im(τ̄₁ τ₂)` (§4). -/
def b0 (τ₁ τ₂ : ℂ → ℂ) (p : C2) : ℂ :=
  -(((tau2At τ₂ p.2 * conj p.1).im : ℂ) * deriv τ₁ p.2 +
      ((conj (τ₁ p.2) * p.1).im : ℂ) * dTau2At τ₂ p.2) /
    ((conj (τ₁ p.2) * tau2At τ₂ p.2).im : ℂ)

/-- A function `F` on `U* × ℂ` that descends to `X_{U*}`: invariant under translation of `x` by
the lattice `Λ_y`. -/
def IsLatticePeriodic {F : Type*} (U : Set ℂ) (τ₁ τ₂ : ℂ → ℂ) (f : C2 → F) : Prop :=
  ∀ p ∈ puncturedTube U, ∀ l ∈ periodLattice τ₁ τ₂ p.2, f (p.1 + l, p.2) = f p

/-- The coefficients `h_{ab̄}` (`a, b ∈ {x, y}`, index `0 = x`, `1 = y`) of the real `(1,1)`-form
`ω = (i/2)(α ϑ_v ∧ ϑ̄_v + β ϑ_h ∧ ϑ̄_v + β̄ ϑ_v ∧ ϑ̄_h + γ ϑ_h ∧ ϑ̄_h)`, with
`ϑ_v = W₀(dx + b₀ dy)`, `ϑ_h = dy`, written as `ω = (i/2) Σ h_{ab̄} dz_a ∧ dz̄_b`. -/
def frameCoeff (τ₁ τ₂ : ℂ → ℂ) (α γ : C2 → ℝ) (β : C2 → ℂ) (a b : Fin 2) (p : C2) : ℂ :=
  let w : ℂ := W0 τ₁ τ₂ p.2
  let c : ℂ := b0 τ₁ τ₂ p
  match a, b with
  | 0, 0 => α p * w ^ 2
  | 0, 1 => α p * w ^ 2 * conj c + conj (β p) * w
  | 1, 0 => α p * w ^ 2 * c + β p * w
  | 1, 1 => α p * w ^ 2 * ‖c‖ ^ 2 + β p * w * conj c + conj (β p) * w * c + γ p

/-- The Wirtinger derivative `∂_{z_a}` (`a = 0`: `x`, `a = 1`: `y`). -/
def wZ (a : Fin 2) (F : C2 → ℂ) (p : C2) : ℂ := if a = 0 then wX F p else wY F p

/-- The Wirtinger derivative `∂_{z̄_a}` (`a = 0`: `x̄`, `a = 1`: `ȳ`). -/
def wZbar (a : Fin 2) (F : C2 → ℂ) (p : C2) : ℂ := if a = 0 then wXbar F p else wYbar F p

/-- The real `(1,1)`-form with coefficients `h` is closed on `X_{U*}`:
`∂_x h_{y b̄} = ∂_y h_{x b̄}` for `b ∈ {x, y}` (`∂ω = 0`, and then `∂̄ω = conj(∂ω) = 0`). -/
def IsClosed11 (U : Set ℂ) (h : Fin 2 → Fin 2 → C2 → ℂ) : Prop :=
  ∀ p ∈ puncturedTube U, ∀ b : Fin 2, wX (h 1 b) p = wY (h 0 b) p

/-- The real `(1,1)`-form with coefficients `h` equals `i∂∂̄φ` on `X_{U*}`:
`h_{ab̄} = 2 ∂_a ∂_{b̄} φ`. -/
def IsDdbarOf (U : Set ℂ) (h : Fin 2 → Fin 2 → C2 → ℂ) (φ : C2 → ℝ) : Prop :=
  ∀ p ∈ puncturedTube U, ∀ a b : Fin 2, h a b p = 2 * wZ a (wZbar b (ofRealFun φ)) p

/-- The real `(1,1)`-form with coefficients `h` represents the zero class in `H²(X_{U*}, ℝ)`: it is
`dη` for a smooth real 1-form `η = c_x dx + c_y dy + conj(c_x dx + c_y dy)` on `X_{U*}`.  That `η`
descends to `X_{U*}` means invariance under every translation `(x, y) ↦ (x + λ(y), y)` by a local
holomorphic section `λ` of the lattice: `c_x ∘ T = c_x` and `c_y ∘ T + (c_x ∘ T) λ' = c_y`.  That
`dη = ω` means the `(2,0)`-part `∂_x c_y - ∂_y c_x` vanishes and the `(1,1)`-part is
`∂_a c̄_b - ∂_{b̄} c_a = (i/2) h_{ab̄}`. -/
def IsExactOnQuotient (U : Set ℂ) (τ₁ τ₂ : ℂ → ℂ) (h : Fin 2 → Fin 2 → C2 → ℂ) : Prop :=
  ∃ c : Fin 2 → C2 → ℂ,
    (∀ a, ContDiffOn ℝ ∞ (c a) (puncturedTube U)) ∧
    (∀ (N : Set ℂ) (l : ℂ → ℂ), IsOpen N → N ⊆ U \ {0} → DifferentiableOn ℂ l N →
      (∀ y ∈ N, l y ∈ periodLattice τ₁ τ₂ y) → ∀ y ∈ N, ∀ x : ℂ,
        c 0 (x + l y, y) = c 0 (x, y) ∧
        c 1 (x + l y, y) + c 0 (x + l y, y) * deriv l y = c 1 (x, y)) ∧
    (∀ p ∈ puncturedTube U, wX (c 1) p - wY (c 0) p = 0) ∧
    ∀ p ∈ puncturedTube U, ∀ a b : Fin 2,
      wZ a (fun q => conj (c b q)) p - wZbar b (c a) p = I / 2 * h a b p

/-- `∫_{X_y} β dx₁ ∧ dx₂`: the integral of `β` over the fundamental parallelogram
`{s τ₁(y) + t τ₂(y) : s, t ∈ [0,1]}` of the fibre, of area `Im(τ̄₁ τ₂)`. -/
def fibreIntegralC (τ₁ τ₂ : ℂ → ℂ) (β : C2 → ℂ) (y : ℂ) : ℂ :=
  ((conj (τ₁ y) * tau2At τ₂ y).im : ℂ) *
    ∫ t in (0 : ℝ)..1, ∫ s in (0 : ℝ)..1, β ((s : ℂ) * τ₁ y + (t : ℂ) * tau2At τ₂ y, y)

/-- The annulus `U_{r₁,r₂} = {r₁ < |y| < r₂}`. -/
def annulusC (r₁ r₂ : ℝ) : Set ℂ := {y | r₁ < ‖y‖ ∧ ‖y‖ < r₂}

/-- `T ⊆ T*_V` contains a fundamental domain of each fibre over `V`: every point `(x, y)` with
`y ∈ V` has a lattice translate `(x + λ, y)` in `T`. -/
def ContainsFundamentalDomains (τ₁ τ₂ : ℂ → ℂ) (T : Set C2) (V : Set ℂ) : Prop :=
  T ⊆ {p | p.2 ∈ V} ∧ ∀ y ∈ V, ∀ x : ℂ, ∃ l ∈ periodLattice τ₁ τ₂ y, (x + l, y) ∈ T

/-- The `C^{k,μ}` norm of `f : ℂ² → F` on `T`, with `ℂ² = ℝ⁴`:
`Σ_{j ≤ k} sup_T ‖D^j f‖ + sup_{p ≠ q ∈ T} ‖D^k f(p) - D^k f(q)‖ / ‖p - q‖^μ`
(valued in `[0, ∞]`). -/
def holderNorm {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) (μ : ℝ)
    (f : C2 → F) (T : Set C2) : ℝ≥0∞ :=
  (∑ j ∈ Finset.range (k + 1), ⨆ p ∈ T, (‖iteratedFDeriv ℝ j f p‖₊ : ℝ≥0∞)) +
    ⨆ p ∈ T, ⨆ q ∈ T, ⨆ (_ : p ≠ q),
      ENNReal.ofReal (‖iteratedFDeriv ℝ k f p - iteratedFDeriv ℝ k f q‖ / ‖p - q‖ ^ μ)

end GrossWilsonK3
