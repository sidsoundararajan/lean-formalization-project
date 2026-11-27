**Setting.** Write points of $\mathbb{R}^3$ (Euclidean 3-space) as $p=(x_0,x_1,x_2)$, using the code's indexing: coordinate $0$ is the "axis" coordinate, and coordinates $1,2$ are the "transverse" coordinates. Let $\gamma$ be the Euler–Mascheroni constant. The theorem uses these custom notions:

- **Transverse norm.** $|p|_\perp := \sqrt{x_1^2+x_2^2}$.
- **Domain.** For a real $\varepsilon$,
$$D_\varepsilon := \{\,p : x_1^2+x_2^2<1\,\}\setminus\{\,p : x_1=0,\ x_2=0,\ x_0=n\varepsilon \text{ for some } n\in\mathbb{Z}\,\}.$$
This is the open solid cylinder of transverse radius $1$ around the $x_0$-axis, with the lattice points $(n\varepsilon,0,0)$, $n\in\mathbb{Z}$, removed. $x_0$ is unrestricted.
- **Coefficients.** For $n\in\mathbb{N}$,
$$c_\varepsilon(0)=\frac{2\big(-\gamma+\log(2\varepsilon)\big)}{\varepsilon},\qquad c_\varepsilon(n)=\frac{1}{n\varepsilon}\ \ (n\ge 1).$$
- **Partial sums.** For $j\in\mathbb{N}$,
$$S_{\varepsilon,j}(p)=\frac{1}{4\pi}\sum_{n=-j}^{j}\left(\frac{1}{\sqrt{(x_0+n\varepsilon)^2+x_1^2+x_2^2}}-c_\varepsilon(|n|)\right).$$
The constant $c_\varepsilon(0)$ is subtracted once, for the $n=0$ term, and $1/(|n|\varepsilon)$ is subtracted for each $n\neq 0$. (If a square root were $0$, the code would assign $1/0$ the junk value $0$; on $D_\varepsilon$ with $\varepsilon>0$ this never happens.)
- **Potential.** $V_0^\varepsilon(p):=\lim_{j\to\infty}S_{\varepsilon,j}(p)$ when this limit exists. If the sequence $(S_{\varepsilon,j}(p))_j$ does not converge, $V_0^\varepsilon(p)$ is an unspecified junk real number. The code does not assert convergence anywhere.

The function `besselK0` in the definition file is not used by this theorem.

**Hypotheses.** Fix a real $r$ and a function $f:\mathbb{C}\to\mathbb{R}$ such that:

1. $0<r\le 1$.
2. $f$ is harmonic at every point of the open disk $\{|y|<r\}$. In Mathlib's sense this means that near each such point $f$ is $C^2$ (as a function on $\mathbb{R}^2$) and has vanishing Laplacian. No regularity is assumed outside the open disk.
3. $f$ is continuous on the closed disk $\{|y|\le r\}$.
4. For every $y\in\mathbb{C}$ with $0<|y|\le r$:
$$f(y)-\frac{1}{4\pi}\log\big(|y|^2\big)>0,\quad\text{i.e. } f(y)>\tfrac{1}{2\pi}\log|y|.$$
The point $y=0$ is excluded from this condition. The condition can be satisfied: since $|y|\le r\le 1$, the right-hand side is $\le 0$, so for example any positive constant $f$ works.

**Conclusion.** There exists $\varepsilon_0>0$ (which may depend on $r$ and $f$) such that for every real $\varepsilon$ with $0<\varepsilon<\varepsilon_0$, and every point $p=(x_0,x_1,x_2)\in D_\varepsilon$ with $|p|_\perp<r$,
$$0< V_0^\varepsilon(p)+\frac{f(x_1+i\,x_2)}{\varepsilon}.$$
Here $f$ is evaluated at the complex number formed from the two transverse coordinates.

**Edge cases.**
- The inequality is strict.
- It must hold uniformly over all $x_0\in\mathbb{R}$, including points on the axis $x_1=x_2=0$ whenever $x_0\notin\varepsilon\mathbb{Z}$.
- Since $r\le 1$, the condition $|p|_\perp<r$ already places $p$ inside the cylinder.
- At any $p$ where the defining series fails to converge, the statement is about the junk value of $V_0^\varepsilon(p)$.
