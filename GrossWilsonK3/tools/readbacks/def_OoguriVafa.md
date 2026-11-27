**Ambient setting.** Everything is in a namespace `GrossWilsonK3`. Every declaration is a noncomputable definition, and none carries any hypotheses. In particular, the real parameter $\varepsilon$ that appears below is never assumed positive or nonzero.

**`E3`.** This is a type abbreviation for Euclidean 3-space $\mathbb{R}^3$, meaning $\mathbb{R}^{\{0,1,2\}}$ with the standard Euclidean inner product and norm. A point $p$ has coordinates $p_0, p_1, p_2$, and the file uses no other structure on it.

**`besselK0`.** For every real $x$ (no sign restriction), this is
$$K_0(x) := \int_{(0,\infty)} e^{-x\cosh t}\,dt,$$
a Lebesgue (Bochner) integral over the open half-line $t>0$.
- **$x>0$:** the integrand is integrable and the value is the usual integral.
- **$x \le 0$:** the integrand is not integrable, because it is $\ge 1$ on an infinite-measure set. The integral then takes the conventional junk value $K_0(x)=0$. So $K_0(0)=0$, and $K_0(x)=0$ for all $x<0$.
- No other declaration in this file uses this definition.

**`ovCoeff`.** For a real $\varepsilon$ and a natural number $n$, this is
$$c_\varepsilon(n) := \begin{cases} \dfrac{2\left(-\gamma + \log(2\varepsilon)\right)}{\varepsilon}, & n = 0,\\[2ex] \dfrac{1}{n\,\varepsilon}, & n \ge 1,\end{cases}$$
where $\gamma$ is the Euler–Mascheroni constant. The junk conventions are:
- Division by zero gives $0$, so $c_0(n)=0$ for every $n$.
- The logarithm is the convention $\log x = \log|x|$ with $\log 0 = 0$. So for $\varepsilon<0$ the $n=0$ value is $2(-\gamma+\log(2|\varepsilon|))/\varepsilon$.
- For $\varepsilon<0$ and $n\ge1$, the value $1/(n\varepsilon)$ is negative.

**`ovPartialSum`.** For a real $\varepsilon$, a natural number $j$ and a point $p\in\mathbb{R}^3$, this is
$$S_{\varepsilon,j}(p) := \frac{1}{4\pi}\sum_{n=-j}^{j}\left( \frac{1}{\sqrt{(p_0+n\varepsilon)^2 + p_1^2 + p_2^2}} - c_\varepsilon(|n|)\right).$$
The sum runs over all integers $n$ with $-j\le n\le j$, so it has $2j+1$ terms.
- The $n=0$ term subtracts $c_\varepsilon(0)$ once.
- Each pair $\pm n$ with $n\ne0$ subtracts $1/(|n|\varepsilon)$ twice in total, once for $n$ and once for $-n$.
- For $j=0$ only the $n=0$ term is present: $S_{\varepsilon,0}(p) = \frac{1}{4\pi}\left(1/\|p\| - c_\varepsilon(0)\right)$.
- When a square root vanishes, the reciprocal is the junk value $1/0=0$ instead of a singularity. This happens when $p_1=p_2=0$ and $p_0=-n\varepsilon$.
- When $\varepsilon=0$, every term becomes $1/\|p\|$ (or $0$ if $p=0$), with nothing subtracted.

**`ovV0`.** For a real $\varepsilon$ and $p\in\mathbb{R}^3$, $V_0^\varepsilon(p)$ is the limit as $j\to\infty$ of the real sequence $j\mapsto S_{\varepsilon,j}(p)$, provided that limit exists. If the sequence does not converge, for example if it diverges or oscillates, $V_0^\varepsilon(p)$ is an unspecified real number chosen by the choice operator, and nothing can be said about it. Convergence is neither assumed nor established here, for any $\varepsilon$ or $p$, including the junk-valued cases above.

**`ovDomain`.** For a real $\varepsilon$, this is the subset of $\mathbb{R}^3$
$$D_\varepsilon := \{p : p_1^2+p_2^2 < 1\}\ \setminus\ \{p : p_1 = 0,\ p_2 = 0,\ p_0 = n\varepsilon \text{ for some } n\in\mathbb{Z}\}.$$
- It is the open solid infinite cylinder of radius $1$ around the $p_0$-axis, with $p_0$ unrestricted.
- The removed points are the axis points whose $p_0$-coordinate is an integer multiple of $\varepsilon$.
- For $\varepsilon=0$ only the origin is removed.
- For $\varepsilon<0$ the removed set is the same as for $|\varepsilon|$.

**`yNorm`.** For $p\in\mathbb{R}^3$, this is $|y|(p) := \sqrt{p_1^2+p_2^2}$, the Euclidean distance from $p$ to the $p_0$-axis. It ignores $p_0$.
