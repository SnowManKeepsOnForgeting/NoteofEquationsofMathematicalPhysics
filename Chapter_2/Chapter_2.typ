#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)
#set text(font: "CMU Serif")
#let dcases(..args) = math.cases(..args.pos().map(math.display))
#counter(heading).update(1)

= Method of Separation of Variables
== String Vibration Equation
Given a string vibration equation:
$
dcases(
  pdv(u,t,2) = a^2 pdv(u,x,2)\
  eval(u)_(x=0) = 0 "," eval(u)_(x=l) = 0\
  eval(u)_(t=0) = phi(x) "," eval(pdv(u,t))_(t=0) = psi(x) "," 0 <= x <= l
)
$
We assume the solution to be of the form:
$
u_n (x,t) = X_n (x)T_n (t)
$
And we superimpose the solutions to get the general solution:
$
u(x,t) = sum_(n=1)^oo C_n X_n (x)T_n (t)
$
We substitute $u_n (x,t) = X_n (x) T_n (t)$ into the string vibration equation to get:
$
(X^'' (x))/X(x) = (1/a^2) (T^'' (t))/T(t) = -lambda
$
Where $lambda$ is a constant.(LHS is independent of $t$ and RHS is independent of $x$ thus both should be equal to a constant otherwise the equation will not hold true for all $x$ and $t$).We divide $a^2$ to the RHS to make $X(x)$ part does not contain $a$ so we can solve it with the boundary conditions in next step.

We have two ODEs:
$
T^'' (t) + lambda a^2 T(t) = 0
$

$
X^'' (x) + lambda X(x) = 0
$
We solve the $X(x)$ ODE with the boundary conditions:
$
dcases(
  X^'' (x) + lambda X(x) = 0\
  X(0) = 0 "," X(l) = 0
)
$<217>

Then we discuss the different cases of $lambda$.

(1) $lambda < 0$

The general solution is:
$
X(x) = A e^(sqrt(-lambda)x) + B e^(-sqrt(-lambda)x)
$
And the boundary conditions give:
$
dcases(
  A+B=0\
  A e^(sqrt(-lambda)l) + B e^(-sqrt(-lambda)l) = 0
)
$
Because the determinant of the coefficient matrix is not zero, the only solution is $A = B = 0$ which is $X(x) eq.triple 0$.This is not a solution to the problem.

(2) $lambda = 0$

The general solution is:
$
X(x) = A x + B
$
To satisfy the boundary conditions we have:
$
A = B = 0
$
Which is not a solution to the problem.

(3) $lambda > 0$

Let $lambda = beta^2(beta >0)$.The general solution is:
$
X(x) = A cos(beta x) + B sin(beta x)
$
And the boundary conditions give:
$
dcases(
  X(0) = A =0\
  X(l) = A cos(beta x) + B sin(beta l) = 0
)
$
We have $A=0,beta = (n pi)/l,n=1,2,3dots$.(We don't consider the situation where $n = -1,-2dots$ because the coefficient $B$ can be negative)Thus we have:
$
lambda_n = (n^2 pi ^2)/l^2
$

$
X_n(x) = B_n sin((n pi )/l x)
$
We substitute $lambda = (n^2 pi ^2)/l^2$ into the $T(t)$ ODE to get:
$
T^''_n (t) + (n^2 pi ^2 a^2)/l^2 T_n (t) = 0
$
We have:
$
T_n (t)= C_n^' cos((n pi a )/l t) + D_n^' sin((n pi a)/l t)
$
Thus we can get the general solution:
$
u_n (x,t) = (C_n cos((n pi a)/l t) + D_n sin((n pi a)/l t) ) sin((n pi)/l x)
$where $C_n = B_n C_n^',D_n = B_n D_n^'$
And we superimpose the solutions to get solution:
$
u(x,t) = sum_(n=1)^oo (C_n cos((n pi a)/l t) + D_n sin((n pi a)/l t) ) sin((n pi)/l x)
$
We substitute the initial conditions to get the final solution(if RHS is convergent and can be differentiated term by term)
$
eval(u(x,t))_(t=0) = sum_(n=1)^oo C_n sin((n pi)/l x) = phi(x)
$
$
eval(pdv(u,t))_(t=0) = sum_(n=1)^oo (D_n (n pi a)/l) sin((n pi)/l x) = psi(x)
$
Just in case you've forgotten, fourier series is:
#set align(center)
#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt
)[
  $
  f(t) = a_0/2 + sum_(n=1)^oo (a_n cos(n omega t) + b_n sin(n omega t))\
  a_n = (2/T) integral_(t_0)^(t_0+T) f(t) cos(n omega t) dd(t)\
  b_n = (2/T) integral_(t_0)^(t_0+T) f(t) sin(n omega t) dd(t)
  $<->
]
#set align(left)
Thus we have；
$
dcases(
  C_n = (2/l) integral_0^l phi(x) sin((n pi)/l x) dd(x)\
  D_n = (2/(n pi a)) integral_0^l psi(x) sin((n pi)/l x) dd(x)
)
$
It works same for the second boundary condition.

== Heat Conduct Equation
Given a heat conduct equation:
$
dcases(
  pdv(u,t) = a pdv(u,x,2)","0<x<l","t>0\
  eval(pdv(u,x))_(x=0) = 0 "," eval(pdv(u,x))_(x=l) = 0","t>0\
  eval(u)_(t=0) = phi(x)","0<=x<=l
)
$

We assume the solution to be of the form:
$
u(x,t) = X(x)T(t)
$
Substitute $u(x,t) = X(x)T(t)$ into the heat conduct equation to get:
$
(T^' (t))/(a^2 T(t)) = (X^'' (x))/X(x) = -lambda
$
We use boundary conditions to solve the $X(x)$ ODE:
$
dcases(
  X^'' (x) + lambda X(x) = 0\
  X^' (0) = 0 "," X^' (l) = 0
)
$
Then we discuss the different cases of $lambda$.

(1) $lambda < 0$
The general solution is:
$
X(x) = A e^(sqrt(-lambda)x) + B e^(-sqrt(-lambda)x)
$
And we have:
$
dcases(
  sqrt(-lambda) A - sqrt(-lambda) B = 0\
  sqrt(-lambda) A e^(sqrt(-lambda)l) - sqrt(-lambda) B e^(-sqrt(-lambda)l) = 0
)
$
The determinant of the coefficient matrix is:
$
mat(delim: "|",sqrt(-lambda),-sqrt(-lambda);
sqrt(-lambda)e^(sqrt(-lambda)l),-sqrt(-lambda)e^(-sqrt(-lambda)l)) != 0
$
Thus the only solution is $A = B = 0$ which is $X(x) eq.triple 0$.This is not a solution to the problem.

(2) $lambda = 0$

The general solution is:
$
X(x) = A x + B
$
And we have:
$
A = 0
$
Thus we have:$X(x) = B,B != 0$

(3) $lambda > 0$

Let $lambda = beta^2(beta >0)$.The general solution is:
$
X(x) = A cos(beta x) + B sin(beta x)
$

And we have:
$
dcases(
  B beta = 0\
  - A beta sin(beta l) + B beta cos(beta l) = 0
)
$
Thus we have:
$
beta = (n pi)/l,n=1,2,3dots\
lambda_n = ((n pi)/l)^2
$

$
X_n (x) = A_n cos((n pi)/l x)
$
Form discussion above we know that $lambda = 0$ can be also considered as a special case of $lambda > 0$.Thus we have the general solution:
$
X_n (x) = A_n cos((n pi)/l x),n=0,1,2,3dots
$
We substitute $lambda_n = ((n pi)/l)^2,n=0,1,2,3dots$ into the $T(t)$ ODE:
$
T^' (t) + (n^2 pi^2 a^2)/l^2 T(t) = 0
$
The general solution is:
$
T_n (t) = C_n e^(- (n^2 pi^2 a^2)/l^2 t)
$
So we have gotten the general solution:
$
u_n (x,t) = a_n cos((n pi)/l x) e^(- (n^2 pi^2 a^2)/l^2 t),a_n = A_n C_n
$
We have initial condition to get the coefficient $a_n$:
$
u(t,0) = a_0/2 + sum_(n=1)^oo a_n cos((n pi)/l x) = phi(x)
$
By fourier transformation we have:
$
a_n = (2/l) integral_0^l phi(x) cos((n pi)/l x) dd(x)
$

== Laplace Equation in a Rectangular Region
Given a Laplace equation in a rectangular region:
$
dcases(
  pdv(u,x,2) + pdv(u,y,2) = 0\
  u(0,y) = f_1(y)","u(a,y) = f_2(y)\
  u(x,0) = g_1(x)","u(x,b) = g_2(x)
)
$
We notice that in this equation the boundary conditions are not homogeneous, so we can't use the method of separation of variables directly. We can use the method of superposition to solve this problem.We assume the solution to be of the form:$u = u_1 + u_2$ where $u_1,u_2$ are solutions to the following equations:

$u_1$ is a solution to the following problem:
$
dcases(
  pdv(u_1,x,2) + pdv(u_1,y,2) = 0\
  u_1 (0,y) = 0","u_1 (a,y) = 0\
  u_1 (x,0) = g_1(x)","u_1 (x,b) = g_2(x)
)
$
And $u_2$ is a solution to the following problem:
$
dcases(
  pdv(u_2,x,2) + pdv(u_2,y,2) = 0\
  u_2 (0,y) = f_1(y)","u_2 (a,y) = f_2(y)\
  u_2 (x,0) = 0","u_2 (x,b) = 0
)
$
In this way we have transformed a non-homogeneous boundary condition problem into two homogeneous boundary condition problems. We can use the method of separation of variables to solve these two problems respectively.We only solve the $u_1$ problem here, the $u_2$ problem is similar.
$
dcases(
  pdv(u_2,x,2) + pdv(u_2,y,2) = 0\
  u_1 (0,y) = 0","u_1 (a,y) = 0\
  u_1 (x,0) = g_1(x)","u_1 (x,b) = g_2(x)
)
$
We assume the solution to be of the form:
$
u(x,y) = X(x)Y(y)
$
We substitute $u(x,y) = X(x)Y(y)$ into the equation to get:
$
(X^'' (x)) / X(x) = - (Y^'' (y)) / Y(y) = -lambda
$
Thus we have two ODEs:
$
dcases(
  X^'' (x) + lambda X(x) = 0\
  Y^'' (y) - lambda Y(y) = 0
)
$
We solve the $X(x)$ ODE with the boundary conditions:
$
dcases(
  X^'' (x) + lambda X(x) = 0\
  X(0) = 0 "," X(a) = 0
)
$
It is as same as @eqt:217 thus we have:
$
lambda_n = (n^2 pi^2)/a^2,X_n (x) = C_n sin((n pi)/a x),n=1,2,3dots
$
We substitute $lambda_n = (n^2 pi ^2)/a^2$ into the $Y(y)$ ODE to get:
$
Y^'' (y) - (n^2 pi^2)/a^2 Y(y) = 0
$
The general solution is:
$
Y_n (y) = D_n e^((n pi)/a y) + E_n e^(- (n pi)/a y),n=1,2,3dots
$
Thus we have the general solution:
$
u_n (x,y) = (A_n e^((n pi)/a y) + B_n e^(- (n pi)/a y)) sin((n pi)/a x),A_n=C_n D_n,B_n=C_n E_n
$
And we have:
$
dcases(
  u(x,0) = (A_n + B_n) sin((n pi)/a x) = g_1(x)\
  u(x,b) = (A_n e^((n pi)/a b) + B_n e^(- (n pi)/a b)) sin((n pi)/a x) = g_2(x)
)
$
We can get the coefficients $A_n,B_n$ by fourier transformation of $g_1(x),g_2(x)$.
$
dcases(
  A_n + B_n = (2/a) integral_0^a g_1(x) sin((n pi)/a x) dd(x)\
  A_n e^((n pi)/a b) + B_n e^(- (n pi)/a b) = (2/a) integral_0^a g_2(x) sin((n pi)/a x) dd(x)
)
$
== Laplace Equation in a Circular Region
Given a Laplace equation in a circular region:
$
dcases(
  pdv(u,x,2) + pdv(u,y,2) = 0\
  eval(u(x,y))_(x^2 + y^2 = r_0^2) = f(x,y)
)
$
Because the boundary condition is a circle,we consider this problem in polar coordinates:
$
dcases(
  pdv(u,r,2) + (1/r) pdv(u,r) + (1/r^2) pdv(u,theta,2) = 0\
  eval(u(r,theta))_(r = r_0) = f(theta)\
  |u(0,theta)| < oo\
  u(r,theta) = u(r,theta + 2 pi)
)
$
The third condition is natural condition.Why we add this condition is that we need more condition to determine a coefficient in later discussion.The fourth condition is periodic condition.

Now we solve this equation with the method of separation of variables.We assume the solution to be of the form:
$
u(r,theta) = R(r)Theta(theta)
$
We substitute $u(r,theta) = R(r)Theta(theta)$ into the equation to get:
$
(r^2 R^'' (r) + r R^' (r)) / R(r) = - (Theta^'' (theta)) / Theta(theta) = lambda
$
Thus we have two ODEs:
$
dcases(
  r^2 R^'' (r) + r R^' (r) + lambda R(r) = 0\
  |R(0)| < oo
)
$

$
dcases(
  Theta^'' (theta) + lambda Theta(theta) = 0\
  Theta(theta) = Theta(theta + 2 pi)
)
$
We solve the $Theta(theta)$ ODE first because it is easier to solve.We discuss the different cases of $lambda$.

(1) $lambda < 0$
The general solution is:
$
Theta(theta) = A e^(sqrt(-lambda)theta) + B e^(-sqrt(-lambda)theta)
$
It don't satisfy the periodic condition,thus $lambda < 0$ is not a solution to the problem.

(2) $lambda = 0$ 

The general solution is:
$
Theta(theta) = A theta + B
$
It satisfy the periodic condition when $Theta(theta) = B,B!=0$.

(3) $lambda > 0$ 

Let $lambda = beta ^2$.The general solution is:
$
Theta(theta) = A cos(beta theta) + B sin(beta theta)
$
To satisfy the periodic condition $beta$ is a integer $n,n=1,2,3dots$.Thus we have:
$
Theta_n (theta) = A_n cos(n theta) + B_n sin(n theta),lambda=n^2,n=1,2,3dots
$
And we substitute $lambda = n^2$ into the $R(r)$ ODE to get:
$
dcases(
  r^2 R^'' (r) + r R^' (r) + n^2 R(r) = 0\
  |R(0)| < oo
)
$
This is a Euler equation.Because of $r>0$,we assume $r = e^t$.
$

$