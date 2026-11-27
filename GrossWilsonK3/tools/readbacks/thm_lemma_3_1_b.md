**Read-back of `lemma_3_1_b`.**

**Setting and notation.** A point $p \in \mathbb{R}^3$ (Euclidean 3-space) has coordinates $p = (p_0, p_1, p_2)$, indexed from $0$. The first coordinate $p_0$ is the distinguished "axis" direction. Write
$$y(p) = \sqrt{p_1^2 + p_2^2}$$
for the distance from $p$ to the $p_0$-axis. This is the definition `yNorm`.

**Binders and hypotheses.** The statement holds for every real $\varepsilon$ and every $p \in \mathbb{R}^3$ that satisfy all of the following:

1. $\varepsilon > 0$.
2. $p$ lies in the set $D_\varepsilon$ (`ovDomain`). This is the open solid cylinder $\{p_1^2 + p_2^2 < 1\}$ minus the lattice points on the axis, $\{(n\varepsilon, 0, 0) : n \in \mathbb{Z}\}$.
3. $y(p) \neq 0$, which means $(p_1, p_2) \neq (0,0)$.

Hypothesis 3 already puts $p$ off the axis, so the only extra condition that hypothesis 2 adds is $p_1^2 + p_2^2 < 1$. The hypotheses can be satisfied, for example by $p = (0, \tfrac12, 0)$.

**Left-hand side: the definition $V_0^\varepsilon(p)$ (`ovV0`).** Define coefficients $c_\varepsilon(n)$ for $n \in \mathbb{N}$:
$$c_\varepsilon(0) = \frac{2\bigl(-\gamma + \log(2\varepsilon)\bigr)}{\varepsilon}, \qquad c_\varepsilon(n) = \frac{1}{n\varepsilon} \quad (n \ge 1).$$
Here $\gamma$ is the Euler–Mascheroni constant.

For $j \in \mathbb{N}$, define the symmetric partial sum
$$S_j(p) = \frac{1}{4\pi} \sum_{n=-j}^{j} \left( \frac{1}{\sqrt{(p_0 + n\varepsilon)^2 + p_1^2 + p_2^2}} - c_\varepsilon(|n|) \right).$$
For $n = 0$ the subtracted constant is the special value $c_\varepsilon(0)$. For $n \neq 0$ it is $1/(|n|\varepsilon)$.

Under the hypotheses, every square root in $S_j(p)$ is strictly positive, so no division by zero occurs.

Then $V_0^\varepsilon(p)$ is defined as $\lim_{j\to\infty} S_j(p)$, taken along the natural numbers. The definition does not check whether this limit exists. If the sequence $(S_j(p))_j$ does not converge, $V_0^\varepsilon(p)$ is an unspecified real number with no mathematical meaning.

**Bessel function $K_0$ (`besselK0`).** For real $x$, define
$$K_0(x) = \int_0^\infty e^{-x\cosh t}\,dt$$
as a Lebesgue integral. By convention the integral is $0$ when the integrand is not integrable, for example when $x \le 0$. In the theorem every argument is $2\pi|m|\,y(p)/\varepsilon$ with $m \neq 0$, $y(p) > 0$ and $\varepsilon > 0$. So every argument is strictly positive and the integral converges.

**Assertion.** The theorem claims the following equality in $\mathbb{C}$, with the real number $V_0^\varepsilon(p)$ viewed as a complex number:
$$V_0^\varepsilon(p) = -\frac{1}{4\pi\varepsilon}\log\bigl(y(p)^2\bigr) + \sum_{m \in \mathbb{Z},\ m \neq 0} \frac{1}{2\pi\varepsilon}\, \exp\!\left(\frac{2\pi i\, m\, p_0}{\varepsilon}\right) K_0\!\left(\frac{2\pi |m|\, y(p)}{\varepsilon}\right).$$
The $m = 0$ term of the series is set to $0$. Since $y(p) > 0$, the logarithm is the ordinary real logarithm of a positive number.

**How the series is read.** The series over $m \in \mathbb{Z}$ is an unconditional sum of complex numbers. By convention, if the family is not summable, the sum is defined to be $0$, and the theorem then asserts $V_0^\varepsilon(p) = -\frac{1}{4\pi\varepsilon}\log\bigl(y(p)^2\bigr)$.

**Consequences and edge cases.**

- The left side is real, so the equality also forces the imaginary part of the right side to be $0$.
- If $\lim_j S_j(p)$ does not exist, the statement equates the right-hand side with an unspecified value.
- The statement does not claim that the limit exists or that the series converges. It claims only the equality of these values, conventions included.
