**`GHWithin`**: For any two types $X$ and $Y$ (any universe; either may be empty), any two real-valued functions $d_X : X \times X \to \mathbb{R}$ and $d_Y : Y \times Y \to \mathbb{R}$, and any real number $\delta$, the proposition $\mathrm{GHWithin}(d_X, d_Y, \delta)$ holds when there exist arbitrary functions $f : X \to Y$ and $g : Y \to X$ satisfying all four of the following strict inequalities:
$$
\begin{aligned}
&(1)\ \forall x_1, x_2 \in X:\ \big|d_X(x_1,x_2) - d_Y(f(x_1), f(x_2))\big| < \delta,\\
&(2)\ \forall x \in X:\ d_X\big(x, g(f(x))\big) < \delta,\\
&(3)\ \forall y_1, y_2 \in Y:\ \big|d_Y(y_1,y_2) - d_X(g(y_1), g(y_2))\big| < \delta,\\
&(4)\ \forall y \in Y:\ d_Y\big(y, f(g(y))\big) < \delta.
\end{aligned}
$$
No metric axioms are assumed for $d_X$ or $d_Y$. They need not be symmetric, nonnegative, zero on the diagonal, or satisfy the triangle inequality. No continuity or other regularity is required of $f$ or $g$. Conditions (2) and (4) have no absolute value, so they bound the signed value $d_X(x, g(f(x)))$ (resp. $d_Y(y, f(g(y)))$) from above only. Nothing requires $\delta > 0$. However, if $X$ is nonempty, (1) with any $x_1, x_2$ forces $\delta > 0$; likewise (3) forces $\delta > 0$ if $Y$ is nonempty. The edge cases are:
- If $X$ and $Y$ are both empty, the empty functions exist, all four conditions hold vacuously, and the proposition is true for every real $\delta$, including $\delta \le 0$.
- If exactly one of $X, Y$ is empty, one of $f$ or $g$ cannot exist, and the proposition is false for every $\delta$.

The property is upward closed in $\delta$: if it holds for $\delta$, it holds for every $\delta' \ge \delta$.

**`ghDist`**: For types $X, Y$ and functions $d_X, d_Y$ as above (again no metric axioms), $\mathrm{ghDist}(d_X, d_Y)$ is the real number
$$
\mathrm{ghDist}(d_X, d_Y) = \inf\,\{\delta \in \mathbb{R} : \mathrm{GHWithin}(d_X, d_Y, \delta)\},
$$
where the infimum follows the convention for real numbers: it is the usual infimum when the set is nonempty and bounded below, and otherwise it is $0$. The cases are:
- **$X$ and $Y$ both nonempty.** The set is contained in $(0, \infty)$. If it is nonempty, the value is its genuine infimum, which is $\ge 0$. If it is empty (no pair $f, g$ makes the four quantities in (1)–(4) bounded above), the value is the junk value $0$.
- **Exactly one of $X, Y$ empty.** The set is empty, so the value is $0$.
- **Both empty.** The set is all of $\mathbb{R}$, which is not bounded below, so the value is $0$.

So a value of $0$ does not distinguish "arbitrarily close" from "no admissible $f, g$ for any $\delta$". The quantity is the infimum of thresholds $\delta$ as defined in `GHWithin`, with no factor such as $\tfrac12$ applied.

**`GHConverges`**: For a single fixed type $X$, a sequence $(d_i)_{i \in \mathbb{N}}$ of real-valued functions $d_i : X \times X \to \mathbb{R}$ on that same type, a type $Y$, and a function $d_Y : Y \times Y \to \mathbb{R}$ (no metric axioms on any of them), $\mathrm{GHConverges}(d, d_Y)$ is the proposition
$$
\forall \delta > 0\ \ \exists N \in \mathbb{N}\ \ \forall i \ge N:\ \ \mathrm{GHWithin}(d_i, d_Y, \delta).
$$
That is, for every positive $\delta$ and every sufficiently large $i$, there exist functions $f_i : X \to Y$ and $g_i : Y \to X$ (which may depend on $i$ and $\delta$) satisfying conditions (1)–(4) above with $d_X = d_i$. Every term of the sequence lives on the same underlying type $X$, and only the function $d_i$ varies with $i$. The definition is stated directly via `GHWithin` and does not refer to `ghDist`, so it is not literally "$\mathrm{ghDist}(d_i, d_Y) \to 0$". Because of the junk value $0$ in `ghDist`, that would be a different condition. The edge cases are:
- If $X$ and $Y$ are both empty, the proposition is true.
- If exactly one of them is empty, the proposition is false.
