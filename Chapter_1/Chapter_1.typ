#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)
#set text(font: "CMU Serif")
#let dcases(..args) = math.cases(..args.pos().map(math.display))
#counter(heading).update(0)
= PDE
== Concept of PDE
PDE includes relationship between variables more than 2.PDE can include integral.It is hard for to solve PDE.
Example:
$
pdv(f,x,2) - 2pdv(f,x,y) + pdv(f,y,2) = 0 
$


== Conduct Basic equation
*String vibration equation*
#figure(
  image("pic/StringVib.svg"), 
  caption: "String vibration"
)
Let us do force analysis to this segment of the string.At x axis,we have:
$
-T cos alpha + T' cos alpha' = 0
$
And the vibration of the string is very small,so we can assume that the angle is very small,so we have:
$
cos alpha approx cos alpha' approx 1\
T = T'
$
At y axis,we have:
$
-T sin alpha + T' sin alpha' - m g = m a
$
And we have:
$
sin alpha approx tan alpha = pdv(u(x,t),x)
$
For same reason,$sin alpha' approx tan alpha' = pdv(u(x+dd(x)),x)$.And we have $m = rho dd(s) =rho sqrt(1+[pdv(u(x,t),x)]^2)dd(x) approx rho dd(x),a = pdv(u(x,t),t,2)$.Thus we have the equation:
$
T[pdv(u(x+dd(x),t),x) - pdv(u(x,t),x)] - rho g dd(x) = rho pdv(u(x,t),t,2) dd(x)
$
By lagrange middle value theorem,we have:
$
exists xi in (x,x+dd(x)),pdv(u(x+dd(x),t),x) - pdv(u(x,t),x) = pdv(u(xi,t),x,2) dd(x)
$
And let $dd(x) -> 0,xi -> x$,we can reform the equation as:
$
T/rho pdv(u(x,t),x,2) - g = pdv(u(x,t),t,2)
$
Generally,when the tension of the string is big,the change of velocity of the string is much bigger than $g$.Thus we can ignore $g$,and we have:
$
pdv(u(x,t),t,2) = a^2 pdv(u(x,t),x,2),a^2 = T/rho
$<one_dimension_string_vibration>
It is easy to get the equation of the string vibration with external force:
$
pdv(u(x,t),t,2) = a^2 pdv(u(x,t),x,2) + f(x,t)
$
*Heat Conduction*
#figure(
  image("pic/HeatConduct.svg", width: 30%),
  caption: "Heat Conduction",
)
At moment $t$,the temperature of the point M is $u(x,y,z,t)$.$bold(n)$ is the normal vector of the surface.By fourier's law,we have:
$
dd(Q) = -k pdv(u,bold(n))dd(S)dd(t)
$
Thus the total heat conduction that goes through the surface is:
$
Q = integral_(t_1)^t_2 ( integral.double_S -k pdv(u,bold(n))dd(S)) dd(t) = integral.triple_V c rho [u(x,y,z,t_2) - u(x,y,z,t_1)] dd(V)
$
And LHS can be written as:
$
integral_(t_1)^t_2 ( integral.double_S -k pdv(u,bold(n))dd(S)) dd(t) =integral_(t_1)^(t_2) (integral.triple_V k Delta u dd(V))
$
And RHS can be written as:
$
integral.triple_V c rho [u(x,y,z,t_2) - u(x,y,z,t_1)] dd(V) = integral_(t_1)^t_2 (integral.triple_V c rho pdv(u,t) dd(V) )dd(t)
$
Because the time and space are arbitrary,we have:
$
pdv(u,t) = a^2 Delta u = a^2 (pdv(u,x,2) + pdv(u,y,2) + pdv(u,z,2)),a = k/(c rho)
$<three_dimension_heat_conduction>
If the field of the temperature is stable in other words $pdv(u,t) = 0$,the @eqt:three_dimension_heat_conduction is called Laplace equation
$
Delta u = pdv(u,x,2) + pdv(u,y,2) + pdv(u,z,2) = 0
$
If temperature is independent of time,we have Poisson equation:
$
Delta u = pdv(u,x,2) + pdv(u,y,2) + pdv(u,z,2) = f(x,y,z)
$
== Definite Condition
*Initial condition*
For the string vibration,initial condition of string vibration is the initial position and velocity of the string.Let us note $phi(x)$ as initial position and $psi(x)$ as initial velocity,we have:
$
dcases(
  u|_(t=0) = phi(x), 
  eval(pdv(u,t))_(t=0) = psi(x)
)
$
For the heat conduction,initial condition is the initial temperature of any point M,we have:
$
u(x,y,z,t)|_(t=0) = phi(x,y,z)
$
*Boundary condition*
There are three types of boundary condition.
+ Dirichlet boundary condition.If given the value of the function $u$ on the boundary $S$,then the boundary condition is called Dirichlet boundary condition.
  $
  u|_S = f
  $
+ Neumann boundary condition.If given the value of the normal derivative of the function $u$ on the boundary $S$,then the boundary condition is called Neumann boundary condition.
  $
  eval(pdv(u,bold(n)))_S = f
  $
+ Robin boundary condition.If given the value of the linear combination of the function $u$ and the normal derivative of the function $u$ on the boundary $S$,then the boundary condition is called Robin boundary condition.
  $
  eval((u + sigma pdv(u,bold(n))))_S = f 
  $
== Definite Problem
A definite problem without initial condition is called boundary problem.A definite problem without boundary condition is called initial problem or Cauchy problem.A differential equation with initial condition and boundary condition is called mixed problem.

We judge whether a definite problem conforms to the actual situation by three dimension:
+ Existence of the solution.
+ Uniqueness of the solution.
+ Stability of the solution.

Formation of a general two order liner PDE with $n$ variables should be:
$
L u eq.triple sum_(i,k=1)^(n) A_(i,k) pdv(u,x_i,x_k) +  sum_(i=1)^(n) B_i pdv(u,x_i) + C u = f
$
If we have 2 variables,we have:
$
a_11 (x,y) pdv(u,x,2) + 2a_12 (x,y) pdv(u,x,y) + a_22 (x,y) pdv(u,y,2) + b_1 (x,y) pdv(u,x) + b_2 (x,y) pdv(u,y) + c(x,y) u = f(x,y)
$
Linear PDE owns a important property that the sum of two solutions is still a solution which is called superposition principle.

== Classification of two order liner PDE
Given a two order liner PDE:
$
a_11 pdv(u,x,2) + 2a_12 pdv(u,x,y) + a_22 pdv(u,y,2) + b_1 pdv(u,x) + b_2 pdv(u,y) + c u + f=0
$<two_order_linear_PDE>
We apply the following transformation on variables:
$
cases(x = x(xi,eta),y = y(xi,eta)) "also as" cases(xi = xi(x,y),eta = eta(x,y)),"where jacobian matrix" J = pdv((xi,eta),(x,y)) != 0
$
We have:
$
pdv(u,x) = pdv(u,xi) pdv(xi,x) + pdv(u,eta) pdv(eta,x),pdv(u,y) = pdv(u,xi) pdv(xi,y) + pdv(u,eta) pdv(eta,y)
$
And second order partial derivative can be written as:
$
pdv(u,x,2) &= pdv(,x)(pdv(u,xi)pdv(xi,x) + pdv(u,eta)pdv(eta,x))\
&= pdv(u,xi,2)(pdv(xi,x))^2 + 2pdv(u,xi,eta)pdv(xi,x)pdv(eta,x) + pdv(u,eta,2)(pdv(eta,x))^2 + pdv(u,xi)pdv(xi,x,2) + pdv(u,eta)pdv(eta,x,2) 
$

$
pdv(u,x,y) &= pdv(,y)(pdv(u,xi)pdv(xi,x) + pdv(u,eta)pdv(eta,x))\
&= pdv(u,xi,2)pdv(xi,x)pdv(xi,y) + pdv(u,xi,eta)(pdv(xi,x)pdv(eta,y) + pdv(xi,y)pdv(eta,x)) + pdv(u,eta,2)pdv(eta,x)pdv(eta,y) + pdv(u,xi)pdv(xi,y,x) + pdv(u,eta)pdv(eta,y,x)
$

$
pdv(u,y,2) &= pdv(,y)(pdv(u,xi)pdv(xi,y) + pdv(u,eta)pdv(eta,y))\
&= pdv(u,xi,2)(pdv(xi,y))^2 + 2pdv(u,xi,eta)pdv(xi,y)pdv(eta,y) + pdv(u,eta,2)(pdv(eta,y))^2 + pdv(u,xi)pdv(xi,y,2) + pdv(u,eta)pdv(eta,y,2)
$

Substitute the above equations into @eqt:two_order_linear_PDE we have:
$
A_11 pdv(u,xi,2) + 2A_12 pdv(u,xi,eta) + A_22 pdv(u,eta,2) + B_1 pdv(u,xi) + B_2 pdv(u,eta) + C u + F = 0
$
where:
$
dcases(
  A_11 = a_11 (pdv(xi,x))^2 + 2a_12 pdv(xi,x)pdv(xi,y) + a_22 (pdv(xi,x))^2,\
  A_12 = a_11 pdv(xi,x)pdv(eta,x) + a_12 (pdv(xi,x)pdv(eta,y) + pdv(xi,y)pdv(eta,x)) + a_22 pdv(xi,y)pdv(eta,y),\
  A_22 = a_11 (pdv(eta,x))^2 + 2a_12 pdv(eta,x)pdv(eta,y) + a_22 (pdv(eta,y))^2,\
  B_1 = a_11 pdv(xi,x,2) + 2a_12 pdv(xi,x,y) + a_22 pdv(xi,y,2) + b_1 pdv(xi,x) + b_2 pdv(xi,y),\
  B_2 = a_11 pdv(eta,x,2) + 2a_12 pdv(eta,x,y) + a_22 pdv(eta,y,2) + b_1 pdv(eta,x) + b_2 pdv(eta,y),\
  C= c,\
  F = f
)
$
If we let $A_11 = 0$,we have:
$
a_11 (pdv(z,x))^2 + 2a_12 pdv(z,x)pdv(z,y) + a_22 (pdv(y,x))^2 = 0
$<1.5.9>
If the above equation have a solution $z = phi(x,y)$,then let $xi = phi(x,y)$ we have $A_11 = 0$.If the above equation have another linearly independent solution $z = psi(x,y)$,then let $xi = psi(x,y)$ we have $A_22 = 0$.

To solve @eqt:1.5.9 we can use the following method.Transform the equation into:
$
a_11 (-pdv(z,x)/pdv(z,y)) - 2a_12 ( -pdv(z,x)/pdv(z,y)) + a_22 = 0
$
By implicit function theorem,implicit function $z(x,y(x)) = C$ satisfies:
$
a_11 (dv(y,x))^2 - 2a_12 dv(y,x) + a_22 = 0
$<characteristic_equation>
The above equation is called characteristic equation of @eqt:two_order_linear_PDE. Its solution is called characteristic curve of @eqt:two_order_linear_PDE.

$Delta(x,y) = a_12^2(x,y) - a_11 (x,y)a_22 (x,y)$.We classify PDE by the value of $Delta(x,y)$.If $Delta(x,y) > 0$,we have hyperbolic PDE.If $Delta(x,y) = 0$,we have parabolic PDE.If $Delta(x,y) < 0$,we have elliptic PDE.

== Simplify PDE
We can simplify PDE by characteristic equation.

*Hyperbolic PDE*

If $Delta(x,y) > 0$,the PDE a hyperbolic PDE.It has two linearly independent characteristic curves $z = phi(x,y),z = psi(x,y)$.We can transform the PDE into:
$
dcases(
  xi = phi(x,y),eta = psi(x,y)
)
$
And we have:
$
pdv(u,xi,eta) = -1/(2A_12) (B_1 pdv(u,xi) + B_2 pdv(u,eta) +C u + F)
$<162>
We can do such transformation on above equation to eliminate the cross term $pdv(u,xi,eta)$.
$
dcases(xi = alpha + beta ,eta = alpha - beta) "also as" dcases(alpha = (xi + eta)/2,beta = (xi - eta)/2)
$
And we have:
$
pdv(u,alpha,2) - pdv(u,beta,2) = -1/(2A_12) [(B_1+B_2)pdv(u,alpha) + (B_1-B_2)pdv(u,beta) + 2C u + 2F]
$<164>
Both @eqt:162 and @eqt:164 are canonical form of hyperbolic PDE.

*Parabolic PDE*

If $Delta(x,y) = 0$,the PDE a parabolic PDE.It has one linearly independent characteristic curve $z = phi(x,y)$.We can transform the PDE into:
$
dcases(
  xi = phi(x,y),eta = eta(x,y)
)
$where $eta(x,y)$ is any function satisfies $J = pdv((xi,eta),(x,y)) != 0$

And we have:
$
pdv(u,eta,2) = -1/A_22 (B_1 pdv(u,xi) + B_2 pdv(u,eta) + C u + F)
$

*Elliptic PDE*

If $Delta(x,y) < 0$,the PDE a elliptic PDE.It has two conjugate characteristic curve.
$
phi(x,y)=c,overline(phi)(x,y) =c
$
We can transform the PDE into:
$
dcases(
  xi = phi(x,y),eta = overline(phi)(x,y)
)
$
And we have:
$
pdv(u,xi,eta) = -1/(2A_12) (B_1 pdv(u,xi) + B_2 pdv(u,eta) +C u + F)
$where $xi,eta$ are complex function.Furthermore,we do such transformation for convenience:
$
dcases(
  xi = Re(phi(x,y)),eta = Im(phi(x,y))
)
$
And we have:
$
pdv(u,xi,2) + pdv(u,eta,2) = -1/A_12 [(B_1+B_2) pdv(u,xi) + i (B_1 -B_2) pdv(u,eta) + 2C u + 2F]
$