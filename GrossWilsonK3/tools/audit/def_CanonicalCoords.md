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

### Definition file `Definitions.Def_GrossWilsonK3_CanonicalCoords` (the item to read back)

```lean
import Mathlib

open scoped ContDiff ENNReal NNReal ComplexConjugate
open Complex Set

noncomputable section

namespace GrossWilsonK3

abbrev C2 : Type := ℂ × ℂ

def pX1 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (1, 0)

def pX2 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (I, 0)

def pY1 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (0, 1)

def pY2 (F : C2 → ℂ) (p : C2) : ℂ := fderiv ℝ F p (0, I)

def wX (F : C2 → ℂ) (p : C2) : ℂ := (pX1 F p - I * pX2 F p) / 2

def wXbar (F : C2 → ℂ) (p : C2) : ℂ := (pX1 F p + I * pX2 F p) / 2

def wY (F : C2 → ℂ) (p : C2) : ℂ := (pY1 F p - I * pY2 F p) / 2

def wYbar (F : C2 → ℂ) (p : C2) : ℂ := (pY1 F p + I * pY2 F p) / 2

def ofRealFun (W : C2 → ℝ) : C2 → ℂ := fun p => (W p : ℂ)

def tubeOver (R : ℝ) : Set C2 := {p | ‖p.2‖ < R}

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

def canonFibreVolume (τ : ℂ → ℂ) (W : C2 → ℝ) (y : ℂ) : ℝ :=
  (τ y).im * ∫ t in (0 : ℝ)..1, ∫ s in (0 : ℝ)..1, W ((s : ℂ) + t * τ y, y)

structure IsI1PeriodData (U : Set ℂ) (τ₁ τ₂ : ℂ → ℂ) : Prop where
  isOpen : IsOpen U
  zero_mem : (0 : ℂ) ∈ U
  contractible : ContractibleSpace U
  holo₁ : DifferentiableOn ℂ τ₁ (U \ {0})
  holo₂ : DifferentiableOn ℂ τ₂ (Complex.exp ⁻¹' U)
  monodromy : ∀ s : ℂ, Complex.exp s ∈ U →
    τ₂ (s + 2 * Real.pi * I) = τ₂ s + τ₁ (Complex.exp s)
  pos : ∀ s : ℂ, Complex.exp s ∈ U → 0 < (conj (τ₁ (Complex.exp s)) * τ₂ s).im

def tau2At (τ₂ : ℂ → ℂ) (y : ℂ) : ℂ := τ₂ (Complex.log y)

def dTau2At (τ₂ : ℂ → ℂ) (y : ℂ) : ℂ := deriv τ₂ (Complex.log y) / y

def periodLattice (τ₁ τ₂ : ℂ → ℂ) (y : ℂ) : Set ℂ :=
  {l | ∃ m n : ℤ, l = (m : ℂ) * τ₁ y + (n : ℂ) * tau2At τ₂ y}

def puncturedTube (U : Set ℂ) : Set C2 := {p | p.2 ∈ U \ {0}}

def W0 (τ₁ τ₂ : ℂ → ℂ) (y : ℂ) : ℝ := 1 / (conj (τ₁ y) * tau2At τ₂ y).im

def b0 (τ₁ τ₂ : ℂ → ℂ) (p : C2) : ℂ :=
  -(((tau2At τ₂ p.2 * conj p.1).im : ℂ) * deriv τ₁ p.2 +
      ((conj (τ₁ p.2) * p.1).im : ℂ) * dTau2At τ₂ p.2) /
    ((conj (τ₁ p.2) * tau2At τ₂ p.2).im : ℂ)

def IsLatticePeriodic {F : Type*} (U : Set ℂ) (τ₁ τ₂ : ℂ → ℂ) (f : C2 → F) : Prop :=
  ∀ p ∈ puncturedTube U, ∀ l ∈ periodLattice τ₁ τ₂ p.2, f (p.1 + l, p.2) = f p

def frameCoeff (τ₁ τ₂ : ℂ → ℂ) (α γ : C2 → ℝ) (β : C2 → ℂ) (a b : Fin 2) (p : C2) : ℂ :=
  let w : ℂ := W0 τ₁ τ₂ p.2
  let c : ℂ := b0 τ₁ τ₂ p
  match a, b with
  | 0, 0 => α p * w ^ 2
  | 0, 1 => α p * w ^ 2 * conj c + conj (β p) * w
  | 1, 0 => α p * w ^ 2 * c + β p * w
  | 1, 1 => α p * w ^ 2 * ‖c‖ ^ 2 + β p * w * conj c + conj (β p) * w * c + γ p

def wZ (a : Fin 2) (F : C2 → ℂ) (p : C2) : ℂ := if a = 0 then wX F p else wY F p

def wZbar (a : Fin 2) (F : C2 → ℂ) (p : C2) : ℂ := if a = 0 then wXbar F p else wYbar F p

def IsClosed11 (U : Set ℂ) (h : Fin 2 → Fin 2 → C2 → ℂ) : Prop :=
  ∀ p ∈ puncturedTube U, ∀ b : Fin 2, wX (h 1 b) p = wY (h 0 b) p

def IsDdbarOf (U : Set ℂ) (h : Fin 2 → Fin 2 → C2 → ℂ) (φ : C2 → ℝ) : Prop :=
  ∀ p ∈ puncturedTube U, ∀ a b : Fin 2, h a b p = 2 * wZ a (wZbar b (ofRealFun φ)) p

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

def fibreIntegralC (τ₁ τ₂ : ℂ → ℂ) (β : C2 → ℂ) (y : ℂ) : ℂ :=
  ((conj (τ₁ y) * tau2At τ₂ y).im : ℂ) *
    ∫ t in (0 : ℝ)..1, ∫ s in (0 : ℝ)..1, β ((s : ℂ) * τ₁ y + (t : ℂ) * tau2At τ₂ y, y)

def annulusC (r₁ r₂ : ℝ) : Set ℂ := {y | r₁ < ‖y‖ ∧ ‖y‖ < r₂}

def ContainsFundamentalDomains (τ₁ τ₂ : ℂ → ℂ) (T : Set C2) (V : Set ℂ) : Prop :=
  T ⊆ {p | p.2 ∈ V} ∧ ∀ y ∈ V, ∀ x : ℂ, ∃ l ∈ periodLattice τ₁ τ₂ y, (x + l, y) ∈ T

def holderNorm {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) (μ : ℝ)
    (f : C2 → F) (T : Set C2) : ℝ≥0∞ :=
  (∑ j ∈ Finset.range (k + 1), ⨆ p ∈ T, (‖iteratedFDeriv ℝ j f p‖₊ : ℝ≥0∞)) +
    ⨆ p ∈ T, ⨆ q ∈ T, ⨆ (_ : p ≠ q),
      ENNReal.ofReal (‖iteratedFDeriv ℝ k f p - iteratedFDeriv ℝ k f q‖ / ‖p - q‖ ^ μ)

end GrossWilsonK3
```
