import Lake
open Lake DSL

package «grossWilsonK3» where
  leanOptions := #[⟨`autoImplicit, false⟩]

-- Same Mathlib revision as Prove2Me's default environment (Lean v4.33.1).
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @
  "0df444a360eaa60ab8c11dca51a86af692955474"

lean_lib «Definitions» where
@[default_target]
lean_lib «Theorems» where
