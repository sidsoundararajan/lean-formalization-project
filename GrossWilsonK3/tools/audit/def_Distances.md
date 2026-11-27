# Auditor role

# Role: Mission Auditor — Writing Read-backs

A **read-back** is a natural-language rendering of what a Lean 4 declaration *literally asserts* — the artifact's own testimony. A read-back is not a summary and not an explanation. Its audience is a human auditor who compares it against the author's stated intent to catch unfaithful formalizations before they are published; any gap between the two is exactly what they are looking for.

Read-backs are attached to draft theorem/definition items in a mission proposal (see [mission_captain.md](mission_captain.md)), stay editable until the human clicks **Submit Proposal**, and are then recorded permanently alongside the published theorem, where moderators read them during review.

## Independence is the point

A read-back is only useful if it is written blind. If you are the mission captain, do not write your own read-backs — launch an **independent sub-agent** with a fresh context, and give it *only*:

- the Lean code of the declaration: its `formal_statement` (or the definition's code), plus the `preamble` it depends on;
- this file.

Never give the auditor the informal statement, the source material, the mission pitch, or your own intent. An auditor who knows what the code is "supposed to say" will read that meaning into it — and the discrepancies the human needs to see disappear.

## The principles

You are writing a **read-back** for a Lean 4 declaration: a natural-language rendering of what the code literally asserts. Follow these principles:

1. **Translate the code, not the intent.** State only what the Lean statement actually says. Never import context from the informal description, the mission, or your own understanding of what the author "meant". If the code says less than the intent, your read-back must say less.

2. **Account for every binder and hypothesis.** Every universally or existentially quantified variable, every explicit and implicit argument, every typeclass assumption must appear in the read-back. Omitting a hypothesis is the worst failure mode.

3. **Expand non-standard definitions.** If the statement refers to definitions from this bundle (or anything that is not a well-known notion), unfold what they mean inline. A read-back that says "the inner product" when the code uses a custom `demo_innerProduct` has hidden exactly what the auditor needs to see.

4. **Surface degenerate and edge cases.** Make explicit what the quantifiers silently include: n = 0, empty sets, junk values from total functions (division by zero, `Nat` subtraction), vacuously satisfiable hypotheses. If a hypothesis could be impossible to satisfy, say so — a vacuous theorem is the classic faithfulness trap.

5. **Preserve logical precision.** Keep the exact strength of every connective: ≤ vs <, ∃ vs ∃!, iff vs implication, the precise direction of every inequality and inclusion. Do not round to the "morally equivalent" claim.

6. **Write for a mathematician who does not read Lean.** Plain mathematical English, standard notation where it helps. Try not to mention Lean syntax. Write in **Markdown+KaTex**; use lists and display blocks to make it clear. Avoid using sem-Lean ASCII. More importantly, use real math notation instead of Lean syntax. For example, write $P_i$ instead of P i; write $A^{m, n}$ instead of A m n.

7. **No judgment, no advocacy.** Do not assess whether the formalization is correct, faithful, or well-designed, and do not defend it. Discrepancies are for the human auditor to find by comparing your read-back with the stated intent.


## Format of read-back

Your read-back should adhere to the following standard.

1. **One self-contained paragraph per declaration.** The read-back must be understandable without opening the source file. Prefer completeness over elegance; this is fine print, not prose.

2. **Escape every LaTeX backslash in the JSON payload.** JSON forbids a raw backslash in a string, so write `\\mu`, `\\frac`, `\\ge` in the request body; the platform stores and renders them as `\mu`, `\frac`, `\ge`. A single raw backslash (e.g. `"$\mu$"` typed literally) makes the whole request fail with a JSON parse error like `Bad escaped character in JSON`. Every example in this file is written in this payload form (`\\ge`, `\\nu`); the platform renders them with single backslashes.

3. Use standard mathematical notation and KaTeX. Replace unreadable Lean expressions such as `banditMeasure ν π n` with conventional notation `$B_{\\nu,\\pi}^n$` and explain their meaning.

4. Give context for every variable and symbol in the theorem.

5. Use display-math block properly to increase readability.

6. Use paragraph breaks properly for readability.

## Attaching the read-back

The captain attaches the auditor's output to the draft item via the `readback` field, with `readback_model` naming the model that wrote it (e.g. `claude-opus-4-8`) — on the item `POST` or `PATCH`, exactly like any other draft field. See **Read-backs** in [mission_captain.md](mission_captain.md) for the endpoint mechanics. Read-backs apply to draft `theorem`/`definition` items only — `reference` items point at already-published content and take none.

Re-run the auditor after any edit to the Lean statement: a read-back of an older version of the code is worse than none, because it testifies about the wrong artifact.


# Code to read back

### Definition file `Definitions.Def_GrossWilsonK3_Distances` (the item to read back)

```lean
import Definitions.Def_GrossWilsonK3_Geometry

open scoped Manifold ContDiff ENNReal
open Set MeasureTheory

noncomputable section

namespace GrossWilsonK3

variable {M : Type*} [TopologicalSpace M] [ChartedSpace E4 M]

def partialS (φ : ℝ × ℝ → M) (p : ℝ × ℝ) : E4 := mfderiv 𝓘(ℝ, ℝ × ℝ) I4 φ p (1, 0)

def partialT (φ : ℝ × ℝ → M) (p : ℝ × ℝ) : E4 := mfderiv 𝓘(ℝ, ℝ × ℝ) I4 φ p (0, 1)

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

def fibreIntegral (J : EndField M) (j : M → OnePoint ℂ) (F : (ℝ × ℝ → M) → ℝ × ℝ → ℝ)
    (b : OnePoint ℂ) : ℝ :=
  if h : ∃ φ, IsFibreParam J j b φ then
    ∫ s in (0 : ℝ)..1, ∫ t in (0 : ℝ)..1, F h.choose (s, t)
  else 0

def fibreArea (J : EndField M) (j : M → OnePoint ℂ) (κ : RealTwoForm M) (b : OnePoint ℂ) : ℝ :=
  fibreIntegral J j (fun φ p => κ (φ p) ![partialS φ p, partialT φ p]) b

open Classical in

def liftOne (y : M → ℂ) (x : M) : E4 :=
  if h : ∃ v : E4, dC y x v = 1 then h.choose else 0

def mcLeanDensity (J : EndField M) (Ω : ComplexTwoForm M) (j : M → OnePoint ℂ) (y : M → ℂ)
    (b : OnePoint ℂ) : ℝ :=
  fibreIntegral J j
    (fun φ p => (starRingEnd ℂ (Ω (φ p) ![liftOne y (φ p), partialS φ p]) *
      Ω (φ p) ![liftOne y (φ p), partialT φ p]).im) b

def IsC1SphereCurve (c : ℝ → OnePoint ℂ) : Prop :=
  Continuous c ∧ ∀ t : ℝ,
    (c t ≠ OnePoint.infty → ContDiffAt ℝ 1 (affC ∘ c) t) ∧
      (c t ≠ ((0 : ℂ) : OnePoint ℂ) → ContDiffAt ℝ 1 (invC ∘ c) t)

open Classical in

def baseSpeed (J : EndField M) (Ω : ComplexTwoForm M) (j : M → OnePoint ℂ)
    (c : ℝ → OnePoint ℂ) (t : ℝ) : ℝ :=
  if c t ∈ criticalValues j then 0
  else if c t = OnePoint.infty then
    ‖deriv (invC ∘ c) t‖ * Real.sqrt (mcLeanDensity J Ω j (invC ∘ j) (c t))
  else
    ‖deriv (affC ∘ c) t‖ * Real.sqrt (mcLeanDensity J Ω j (affC ∘ j) (c t))

def mcLeanDist (J : EndField M) (Ω : ComplexTwoForm M) (j : M → OnePoint ℂ)
    (b₁ b₂ : OnePoint ℂ) : ℝ :=
  (⨅ (c : ℝ → OnePoint ℂ) (_ : IsC1SphereCurve c ∧ c 0 = b₁ ∧ c 1 = b₂),
    ∫⁻ t in Icc (0 : ℝ) 1, ENNReal.ofReal (baseSpeed J Ω j c t)).toReal

def curveVel (γ : ℝ → M) (t : ℝ) : E4 := mfderiv 𝓘(ℝ, ℝ) I4 γ t 1

def riemDist (g : M → E4 → E4 → ℝ) (x y : M) : ℝ :=
  (⨅ (γ : ℝ → M) (_ : ContMDiff 𝓘(ℝ, ℝ) I4 1 γ ∧ γ 0 = x ∧ γ 1 = y),
    ∫⁻ t in Icc (0 : ℝ) 1,
      ENNReal.ofReal (Real.sqrt (g (γ t) (curveVel γ t) (curveVel γ t)))).toReal

end GrossWilsonK3
```

### Imported definition file `Definitions.Def_GrossWilsonK3_Geometry`

```lean
import Mathlib

open scoped Manifold ContDiff
open Set

noncomputable section

namespace GrossWilsonK3

abbrev E4 : Type := EuclideanSpace ℝ (Fin 4)

abbrev I4 : ModelWithCorners ℝ E4 E4 := 𝓘(ℝ, E4)

variable {M : Type*} [TopologicalSpace M] [ChartedSpace E4 M]

abbrev RealTwoForm (M : Type*) : Type _ := M → E4 [⋀^Fin 2]→L[ℝ] ℝ

abbrev ComplexTwoForm (M : Type*) : Type _ := M → E4 [⋀^Fin 2]→L[ℝ] ℂ

abbrev EndField (M : Type*) : Type _ := M → E4 →L[ℝ] E4

def formInChart {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : ℕ}
    (η : M → E4 [⋀^Fin n]→L[ℝ] F) (x₀ : M) (y : E4) : E4 [⋀^Fin n]→L[ℝ] F :=
  (η ((extChartAt I4 x₀).symm y)).compContinuousLinearMap
    (mfderiv I4 I4 (extChartAt I4 x₀).symm y)

def IsSmoothForm {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : ℕ}
    (η : M → E4 [⋀^Fin n]→L[ℝ] F) : Prop :=
  ∀ x₀ : M, ContDiffOn ℝ ∞ (formInChart η x₀) (extChartAt I4 x₀).target

def IsClosedForm {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : ℕ}
    (η : M → E4 [⋀^Fin n]→L[ℝ] F) : Prop :=
  ∀ x₀ : M, ∀ y ∈ (extChartAt I4 x₀).target, extDeriv (formInChart η x₀) y = 0

def endInChart (A : EndField M) (x₀ : M) (y : E4) : E4 →L[ℝ] E4 :=
  (mfderiv I4 I4 (extChartAt I4 x₀) ((extChartAt I4 x₀).symm y)).comp
    ((A ((extChartAt I4 x₀).symm y)).comp (mfderiv I4 I4 (extChartAt I4 x₀).symm y))

def IsAlmostComplex (J : EndField M) : Prop :=
  (∀ x : M, (J x).comp (J x) = -ContinuousLinearMap.id ℝ E4) ∧
    ∀ x₀ : M, ContDiffOn ℝ ∞ (endInChart J x₀) (extChartAt I4 x₀).target

def rePart (Ω : ComplexTwoForm M) : RealTwoForm M :=
  fun x => Complex.reCLM.compContinuousAlternatingMap (Ω x)

def wedge22 (α β : E4 [⋀^Fin 2]→L[ℝ] ℝ) (v : Fin 4 → E4) : ℝ :=
  α ![v 0, v 1] * β ![v 2, v 3] - α ![v 0, v 2] * β ![v 1, v 3]
    + α ![v 0, v 3] * β ![v 1, v 2] + α ![v 1, v 2] * β ![v 0, v 3]
    - α ![v 1, v 3] * β ![v 0, v 2] + α ![v 2, v 3] * β ![v 0, v 1]

def IsType20 (J : EndField M) (Ω : ComplexTwoForm M) : Prop :=
  ∀ (x : M) (u v : E4), Ω x ![J x u, v] = Complex.I * Ω x ![u, v]

def kahlerMetric (κ : RealTwoForm M) (J : EndField M) (x : M) (u v : E4) : ℝ :=
  κ x ![u, J x v]

def IsKahlerForm (J : EndField M) (κ : RealTwoForm M) : Prop :=
  IsSmoothForm κ ∧ IsClosedForm κ ∧
    (∀ (x : M) (u v : E4), κ x ![J x u, J x v] = κ x ![u, v]) ∧
    ∀ (x : M) (u : E4), u ≠ 0 → 0 < kahlerMetric κ J x u u

def IsK3 (J : EndField M) (Ω : ComplexTwoForm M) : Prop :=
  IsAlmostComplex J ∧ IsSmoothForm Ω ∧ IsClosedForm Ω ∧ IsType20 J Ω ∧ ∀ x : M, Ω x ≠ 0

def affC (p : OnePoint ℂ) : ℂ := OnePoint.elim p 0 id

def invC (p : OnePoint ℂ) : ℂ := OnePoint.elim p 0 (fun z => z⁻¹)

def dC (φ : M → ℂ) (x : M) : E4 →L[ℝ] ℂ := mfderiv I4 𝓘(ℝ, ℂ) φ x

def IsJHolomorphicAt (J : EndField M) (φ : M → ℂ) (x : M) : Prop :=
  ContMDiffAt I4 𝓘(ℝ, ℂ) ∞ φ x ∧ ∀ u : E4, dC φ x (J x u) = Complex.I * dC φ x u

def IsHolomorphicToSphere (J : EndField M) (j : M → OnePoint ℂ) : Prop :=
  Continuous j ∧ ∀ x : M,
    (j x ≠ OnePoint.infty → IsJHolomorphicAt J (affC ∘ j) x) ∧
      (j x ≠ ((0 : ℂ) : OnePoint ℂ) → IsJHolomorphicAt J (invC ∘ j) x)

open Classical in

def localCoord (j : M → OnePoint ℂ) (x : M) : M → ℂ :=
  if j x = OnePoint.infty then invC ∘ j else affC ∘ j

def IsCriticalPt (j : M → OnePoint ℂ) (x : M) : Prop :=
  dC (localCoord j x) x = 0

def criticalValues (j : M → OnePoint ℂ) : Set (OnePoint ℂ) :=
  {b | ∃ x, IsCriticalPt j x ∧ j x = b}

def IsNondegenerateCriticalPt (j : M → OnePoint ℂ) (x : M) : Prop :=
  IsCriticalPt j x ∧
    ∀ u : E4, u ≠ 0 → ∃ v : E4,
      fderiv ℝ (fderiv ℝ (localCoord j x ∘ (extChartAt I4 x).symm)) (extChartAt I4 x x) u v ≠ 0

def IsEllipticFibration (J : EndField M) (j : M → OnePoint ℂ) : Prop :=
  IsHolomorphicToSphere J j ∧ Function.Surjective j ∧ ∀ b : OnePoint ℂ, IsConnected (j ⁻¹' {b})

def AllSingularFibresI1 (j : M → OnePoint ℂ) : Prop :=
  ∀ x : M, IsCriticalPt j x →
    IsNondegenerateCriticalPt j x ∧ ∀ x' : M, IsCriticalPt j x' → j x' = j x → x' = x

open Classical in

def sectionAtInfty (σ : OnePoint ℂ → M) (w : ℂ) : M :=
  if w = 0 then σ OnePoint.infty else σ ((w⁻¹ : ℂ) : OnePoint ℂ)

def IsHolomorphicFromC (J : EndField M) (s : ℂ → M) : Prop :=
  ContMDiff 𝓘(ℝ, ℂ) I4 ∞ s ∧
    ∀ z a : ℂ, mfderiv 𝓘(ℝ, ℂ) I4 s z (Complex.I * a) = J (s z) (mfderiv 𝓘(ℝ, ℂ) I4 s z a)

def IsHolomorphicSection (J : EndField M) (j : M → OnePoint ℂ) (σ : OnePoint ℂ → M) : Prop :=
  (∀ b, j (σ b) = b) ∧ IsHolomorphicFromC J (fun z : ℂ => σ (z : OnePoint ℂ)) ∧
    IsHolomorphicFromC J (sectionAtInfty σ)

def areaC (p q : ℂ) : ℝ := p.re * q.im - p.im * q.re

structure BaseTwoForm where
  a₀ : ℂ → ℂ
  aInf : ℂ → ℂ
  smooth₀ : ContDiff ℝ ∞ a₀
  smoothInf : ContDiff ℝ ∞ aInf
  compat : ∀ w : ℂ, w ≠ 0 → aInf w = a₀ w⁻¹ / ((‖w‖ ^ 4 : ℝ) : ℂ)

open Classical in

def pullbackBase (j : M → OnePoint ℂ) (α : BaseTwoForm) (x : M) (u v : E4) : ℂ :=
  if j x = OnePoint.infty then
    α.aInf 0 *
      ((areaC (dC (invC ∘ j) x u) (dC (invC ∘ j) x v) : ℝ) : ℂ)
  else
    α.a₀ (affC (j x)) *
      ((areaC (dC (affC ∘ j) x u) (dC (affC ∘ j) x v) : ℝ) : ℂ)

end GrossWilsonK3
```
