**Setting and notation.** Points are $p=(p_0,p_1,p_2)\in\mathbb{R}^3$, with $\mathbb{R}^3$ carrying its Euclidean structure. Write
$$r(p)=\sqrt{p_1^2+p_2^2}$$
for the distance from $p$ to the $p_0$-axis. For a real $\varepsilon$, the domain is
$$D_\varepsilon=\{p : p_1^2+p_2^2<1\}\setminus\{p : p_1=p_2=0 \text{ and } p_0=n\varepsilon \text{ for some } n\in\mathbb{Z}\}.$$
This is the open solid cylinder of radius $1$ around the $p_0$-axis, unbounded in the $p_0$ direction, with the lattice points $(n\varepsilon,0,0)$, $n\in\mathbb{Z}$, removed.

**Coefficients.** For a real $\varepsilon$ and $n\in\mathbb{N}$, the coefficients are
$$c_\varepsilon(0)=\frac{2\left(-\gamma+\log(2\varepsilon)\right)}{\varepsilon},\qquad c_\varepsilon(n)=\frac{1}{n\varepsilon}\quad (n\ge 1),$$
where $\gamma$ is the Euler–Mascheroni constant.

**Partial sums.** For $j\in\mathbb{N}$, the partial sum is
$$S_j(\varepsilon,p)=\frac{1}{4\pi}\sum_{n=-j}^{j}\left(\frac{1}{\sqrt{(p_0+n\varepsilon)^2+p_1^2+p_2^2}}-c_\varepsilon(|n|)\right).$$
The sum runs over the integers $n$ with $-j\le n\le j$. So the $n=0$ term subtracts $c_\varepsilon(0)$ once, and each pair $n=\pm k$ subtracts $\frac{1}{k\varepsilon}$ twice in total.

Under the formal conventions, $1/0$ is read as $0$. In the theorem below, however, $r(p)>r_0>0$, so every square root is strictly positive and this convention plays no role.

**The quantity $V_0$.** $V_0(\varepsilon,p)$ is defined as "the limit of $S_j(\varepsilon,p)$ as $j\to\infty$", taken through a choice-based limit operator:

- If the sequence $(S_j(\varepsilon,p))_j$ converges, $V_0(\varepsilon,p)$ is its limit.
- If it does not converge, $V_0(\varepsilon,p)$ is some unspecified real number.

The theorem does not assert or assume that the sequence converges.

(A function $K_0(x)=\int_0^\infty e^{-x\cosh t}\,dt$ is also defined in the imported file. It is not used in this statement.)

**Statement.** There exists a real constant $C$ with the following property. The constant has no sign or other restriction, and it is chosen before $r_0$, so it is the same for all $r_0$. For every real $r_0$ with $0<r_0<1$ there exists a real $\varepsilon_0>0$ such that, for every real $\varepsilon$ with $0<\varepsilon<\varepsilon_0$ and every point $p\in D_\varepsilon$ with $r(p)>r_0$,
$$\left|\,V_0(\varepsilon,p)+\frac{1}{4\pi\varepsilon}\log\!\left(r(p)^2\right)\right|\;\le\;\frac{C}{\varepsilon}\,\exp\!\left(-\frac{2\pi\, r(p)}{\varepsilon}\right).$$

**Remarks on scope and edge cases.**

1. **Order of choices.** $\varepsilon_0$ may depend on $r_0$ but not on $\varepsilon$ or $p$. The bound must hold uniformly in $p_0\in\mathbb{R}$, which is unrestricted.
2. **Range of $r(p)$.** Because $p\in D_\varepsilon$ and $r(p)>r_0$, we have $r_0<r(p)<1$. Hence $p$ is off the axis, the removed lattice points are never at issue, and $\log(r(p)^2)$ is the ordinary logarithm of a number in $(r_0^2,1)$, so it is negative.
3. **No vacuity.** The hypotheses are satisfiable: for any admissible $r_0$ and $\varepsilon$ there are points $p$ with $r_0<r(p)<1$. The right-hand side has the sign of $C$, so any witness $C$ must in fact be $\ge 0$.
4. **Divergent case.** If the partial sums diverge at some $(\varepsilon,p)$, the inequality there is a claim about the unspecified value $V_0(\varepsilon,p)$, not about a genuine limit.
