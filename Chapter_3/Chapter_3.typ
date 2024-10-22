#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)
#set text(font: "CMU Serif")
#let dcases(..args) = math.cases(..args.pos().map(math.display))
#counter(heading).update(2)

#let uavg = $overline(u)$

= Method of Traveling Waves
This chapter will discuss the method of solving a three dimension wave equation with initial condition.To achieve this we will follow the following steps:

1. Solve the one dimensional wave equation.

2. Solve the special case of the three dimensional wave equation.(Radially symmetric case)

3. Solve the general case of the three dimensional wave equation.

$
dcases(
  pdv(u,t,2) = a^2 (pdv(u,x,2) + pdv(u,y,2) + pdv(u,z,2))\
  eval(u)_(t=0) = phi(x,y,z)\
  eval(pdv(u,t))_(t=0) = psi(x,y,z)
)
$
== Initial Problem of One Dimensional Wave Equation
Given a one dimensional wave equation with initial conditions:
$
dcases(
  pdv(u,t,2) = a^2 pdv(u,x,2)\
  eval(u)_(t=0) = phi(x)\
  eval(pdv(u,t))_(t=0) = psi(x)
)
$
First we try to simplify it.This equation is a hyperbolic partial differential equation.Its characteristic equation is:
$
(dd(x))^2 - a^2 (dd(t))^2 = 0
$
We have two characteristic lines:
$
x+a t = C, x-a t = C
$
We do such transformation:
$
dcases(
  xi = x + a t\
  eta = x - a t
)
$
By differentiating we get:
$
pdv(u,x,2) = pdv(u,xi,2) + 2 pdv(u,xi,eta) + pdv(u,eta,2)\
pdv(u,t,2) =a^2 (pdv(u,xi,2) - 2 pdv(u,xi,eta) + pdv(u,eta,2))
$
Substitute these into the wave equation we get canonical form
$
pdv(u,xi,eta) = 0
$<316>
We integrate @eqt:316 with respect to $eta$:
$
pdv(u,xi) = f(xi)
$
Then we integrate it with respect to $xi$:
$
u(x,t) = integral f(xi) dd(xi) + f_2(eta) = f_1 (x+ a t) + f_2 (x - a t)
$<318>
Let us consider the initial conditions:
$
dcases(
  eval(u)_(t=0) = phi(x)\
  eval(pdv(u,t))_(t=0) = psi(x)
)
$<319>
We substitute @eqt:318 into @eqt:319:
$
dcases(
  f_1 (x) + f_2 (x) = phi(x)\
  a f_1^' (x) - a f_2^' (x) = psi(x)
)
$
We integrate the second equation with respect to $x$(*Here we do definite integral instead of indefinite integral because we do this way to get rid of the constant of integration*):
$
f_1 (x) - f_2 (x) = 1/a integral_0^x psi(xi) dd(xi) + C
$
Thus we can solve these two equations:
$
dcases(
  f_1 (x) = 1/2 phi(x) + 1/(2a) integral_0^x psi(xi) dd(xi) + C/2\
  f_2 (x) = 1/2 phi(x) - 1/(2a) integral_0^x psi(xi) dd(xi) - C/2
)
$
Then we get the final solution also called D'Alembert's formula:
$
u(x,t) = 1/2 [phi(x + a t) + phi(x - a t)] + 1/(2a) integral_(x-a t)^(x+a t) psi(xi) dd(xi)
$

== Special Case of Three Dimensional Wave Equation
If the three dimensional wave equation is radially symmetric.Then we can use the spherical coordinate system:

$
  
    pdv(u,t,2) = a^2(1/r^2 pdv(,r)(r^2 pdv(u,r)) + 1/(r^2 sin(theta)) pdv(,theta)(sin(theta) pdv(u,theta)) + 1/(r^2 sin^2(theta)) pdv(u,theta,2))\
  
$
Because the equation is radially symmetric,$u$ is independent of $theta$ and $phi$ in other words $pdv(u,theta) = pdv(u,phi) = 0$.Thus the equation becomes:
$
      pdv(u,t,2) = a^2(1/r^2 pdv(,r)(r^2 pdv(u,r)))
$<322>
@eqt:322 is called the radical symmetric wave equation.We can expand it:
$
      pdv(u,t,2) = a^2 (pdv(u,r,2) + 2/r pdv(u,r))
$<323>
We multiply $r$ to both sides of @eqt:322:
$
  pdv((r u),t,2)=r pdv(u,t,2) = a^2 (r pdv(u,r,2) + 2 pdv(u,r)) = a^2 (pdv((r u),r,2))
$
This is a one dimensional wave equation with initial conditions with respect to $r u$.General Solution of it is:
$
  r u = f_1 (r + a t) + f_2 (r - a t)
$
Also as:
$
  u(r,t) = (f_1 (r + a t) + f_2 (r - a t))/r
$
By substituting the initial conditions we get the final solution.

== General Case of Three Dimensional Wave Equation
$
  dcases(
    pdv(u,t,2) = a^2 (pdv(u,x,2) + pdv(u,y,2) + pdv(u,z,2))\
    eval(u)_(t=0) = phi(x,y,z)\
    eval(pdv(u,t))_(t=0) = psi(x,y,z)
  )
$<331>
Let us consider the general case of the three dimensional wave equation.Because $u$ is not radically symmetric,$u$ is a function of $x,y,z$ and $t$.But if a given point $M(x,y,z)$,we consider the average of the values of $u$ in the sphere with radius $r$ and center $M$.This value is independent of $x,y,z$ since the point $M$ is given in other words this value is a function of $r$ and $t$.We denote this value as $uavg(r,t)$.Thus we have:
$
  uavg(r,t) = 1/(4 pi r^2)integral.double_(S_r^M) u(xi,eta,zeta,t) dd(S)
$<332>where $xi=x+r sin(theta)cos(phi),eta = y + r sin(theta)sin(phi), zeta = z + r cos(theta)$.

It is easy to see that 
$
  lim_(r->0) uavg(r,t) = u(x,y,z,t)
$
Because $u$ is continuous.Thus we have:
$
  uavg(0,t) = u(x,y,z,t)
$
We integrate @eqt:331 over the sphere with radius $r$ and center $M$:
$
  1/(4 pi r^2)integral.double_(S_r^M) pdv(u,t,2) dd(S) =  a^2/(4 pi r^2)integral.double_(S_r^M) laplace u dd(S)
$
Also
$
pdv(,t,2)(1/(4 pi r^2)integral.double_(S_r^M) u dd(S)) = a^2 laplace integral.double_(S_r^M) u dd(S)
$
We substitute @eqt:332 into the above equation:
$
  pdv(uavg,t,2) = a^2 laplace uavg
$<337>
Thus let us conduct the following transformation.We have:
$
  (xi - x)^2 + (eta - y)^2 + (zeta - z)^2 = r^2
$

$
  pdv(uavg,x) = pdv(uavg,r) pdv(r,x) = pdv(uavg,r) (x-xi)/r\
  pdv(uavg,x,2) = pdv(uavg,r,2)((x -xi)/r)^2 + pdv(uavg,r)(r^2 - (x-xi)^2)/r^3
$
Similarly we obtain:
$
  pdv(uavg,y,2) = pdv(uavg,r,2)((y -eta)/r)^2 + pdv(uavg,r)(r^2 - (y-eta)^2)/r^3
$

$
  pdv(uavg,z,2) = pdv(uavg,r,2)((z -zeta)/r)^2 + pdv(uavg,r)(r^2 - (z-zeta)^2)/r^3
$
Thus we have:
$
  laplace uavg = pdv(uavg,x,2) + pdv(uavg,y,2) + pdv(uavg,z,2) = pdv(uavg,r,2) + 2/r pdv(uavg,r)
$
We substitute this into @eqt:337:
$
  pdv(uavg,t,2) = a^2 (pdv(uavg,r,2) + 2/r pdv(uavg,r))
$
This is a radical symmetric wave equation.Thus we get the general solution:
$
  r uavg(r,t) = f(r+a t)+g(r-a t)
$<3314>let $r = 0$ we have:
$
f(a t) = - g(-a t)\
f^' (a t) = g^' (-a t)
$<3315>
We take the partial derivative of @eqt:3314 with respect to $r$:
$
  uavg + r pdv(uavg,r) = f^' (r+a t) + g^' (r-a t)
$
Let $r = 0$ We have:
$
uavg(0,t) = f^' (a t) + g^' (-a t) = 2 f^' (a t)   
$
To obtain $f^' (a t)$ ,we take the partial derivative of @eqt:3314 with respect to $t$:
$
  pdv(,t)(r uavg) = a f^' (r+a t) - a g^' (r-a t)
$
We have:
$
  a pdv(,r)(r,uavg) + pdv(,t)(r uavg) = 2 a f^' (r+a t)
$