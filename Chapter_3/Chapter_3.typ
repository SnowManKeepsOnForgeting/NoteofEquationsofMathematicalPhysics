#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)
#set text(font: "CMU Serif")
#let dcases(..args) = math.cases(..args.pos().map(math.display))
#counter(heading).update(2)

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