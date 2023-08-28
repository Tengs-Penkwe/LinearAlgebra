#import "template.typ": *
#import "@preview/algo:0.3.1": algo, i, d, comment, code

#show: project.with(
  title: "Linear Algebra Done Right",
  authors: (
    "Tengs",
  ),
)

#set heading(numbering: "1.1")
#set math.mat(delim: "[")

This is the answers and some simple note to the book _Linear Algebra Done Right_

Some other resources:
#show link: underline

#link("https://github.com/kenjihiranabe/The-Art-of-Linear-Algebra.git")[_The Art of Linear Algebra_]

= Vector Spaces

== $RR^n$ and $CC^n$

*List*

$FF^n$

1. Suppose $a$ and $b$ are real numbers, not both $0$. Find real numbers $c$ and $d$ such that $ 1/(a+b i) = c + d i $

  #answer()[$
  (c+d\i)(a+b\i) = 1 & arrow.l.r.double\
  (a\c - b\d) + (b\c + a\d)i = 1+0\i & arrow.l.r.double\
  cases(
    a\c - b\d = 1,
    b\c +a\d = 0  
  )
  $]

  #wrong()[$
  (a-b\i)/(a^2+b^2) = c+d\i arrow.r.double cases(c = a/(a^2+b^2), d=(-b)/(a^2+b^2))
  $It shows that each _imaginary number_ has a Multiplicative Inverse]

2. Show that $ (-1+sqrt(3)i)/2 $ is a cube root of 1.

  #answer()[$
    ((-1+sqrt(3)i)/2)^3 & = ((-1)^3+3(-1)^2sqrt(3)i+3(-1)3i^2+3sqrt(3)i^3)/8 \
    & = (-1+3sqrt(3)i+9-3sqrt(3)i)/8 \
    & = 1
  $]

3. Find two distinct square roots of $i$.
  
  #answer[$
  (x+y\i)^2 = 0 + i arrow.l.r.double \
  (x^2-y^2) + 2x\y\i = 0+i arrow.l.r.double \
  cases(x^2-y^2=0, 2x\y=1)
  $By staring at the equations, we can get 2 solutions $1/2+1/2i$ and $-1/2-1/2i$. $qed$]
  ``
  
  #wrong[
  given $i=e^(pi\i\/2)$, we know the roots are $e^(pi\i\/4)$ and $e^((pi\i\/2+2pi\i)\/2) = e^(5pi\i\/4)$
  $ e^(pi\i\/4) = cos pi/4 + i sin pi/4 = sqrt(2)/2(1+i) \
    e^(5pi\i\/4) = cos (5pi)/4 + i sin (5pi)/4 = sqrt(2)/2(1-i) $
  ]
  

4. Show that $alpha + beta = beta + alpha$ for all $alpha, beta in CC$

  #answer[$
  alpha + beta &= (a_1+a_2 i)+(b_1+b_2 i)  \
  & = (a_1 + b_1) + (a_2 +b_2)i \
  & = (b_1 + a_1) + (b_2 +a_2)i \
  & = beta + alpha
  $]

5. Show that $(alpha + beta) + lambda = alpha + (beta + lambda)$ for all $alpha, beta, lambda in CC$
  // #answer[$
  // (alpha + beta) + lambda &= [(a_1+a_2 i)+(b_1+b_2 i)] + (c_1 + c_2 i)  \
  // &= [a_1 + b_1 ]
  // $]

6. Show that $(alpha beta)lambda = alpha(beta lambda)$ for all $alpha, beta, lambda in CC$
  // #answer[$
  // (alpha beta)lambda &= [(a_1 + a_2 i)(b_1 + b_2 i)](c_1 + c_2 i) \ 
  // &= [(a_1b_1 - a_2b_2) + (a_1b_2 + a_2b_1)i](c_1 + c_2 i) \
  // &= 
  // $]

7. Show that for each $alpha in CC$, there exists a unique $beta in CC$ such that $alpha + beta = 0$

  #answer[
  Proof of Existence: suppose $alpha = a_1 + a_2 i$, and $a_1, a_2 in RR$, then $beta = -a_1 -a_2 i$ satisfies $alpha + beta = 0$
  $ alpha + beta &= (a_1 + a_2 i) + (-a_1 -a_2 i)\ 
  &= (a_1 -a_1) + (a_2 -a_2)i \
  &= 0
  $\
  Proof of uniqueness: suppose there is another $lambda$ that $alpha + lambda = 0$
  $ alpha + lambda = 0 & arrow.l.r.double\
  alpha + lambda = alpha + beta & arrow.l.r.double\
  lambda = beta &
  $
  ]

8. Show that for each $alpha in CC$ with $alpha != 0$, there exists a unique $beta in CC$ such that $alpha beta = 1$

9. Show that $lambda(alpha + beta) = lambda alpha + lambda beta$ for all $lambda, alpha, beta in CC$  

10. Find $x in RR^4$ such that $ (4,-3,1,7) + 2x = (5.9,-6,8) $

11. Explain why there does not exist $lambda in CC$ such that $ lambda(2- 3i, 5 + 4i, -6 + 7i) = (12- 5i, 7 + 22i, -32 - 9i) $

  #answer[assume there is $lambda = x+y\i$ and $x,y in RR$ satisfies the equation above, then we have $ cases((x+y i)(2-3i) = 12-5i, (x+y i)(5+4i)=7+22i,(x+y i)(6-7i)=32+9i) $ We have $ cases(2x+3y=12, 5x-4y=7, 6x+7y=32, -3x+2y=-5, 4x+5y=22,-7x+6y=9) space.quad arrow.r.double mat(2, 3, 12; 5, -4,7; 6,7,32; -3, 2, -5;4, 5, 22; -7, 6, 9) $
  The rank of this matrix is bigger than 2, so there is no solution.
  ]

12. Show that $(x+y)+z=x+(y+z)$ for all $x,y,z in FF^n$.

13. Show that $(a\b)x=a(b\x)$ for all $x in FF^n$ and all $a,b in FF$.

14. Show that $1x=x$ for all $x in FF^n$.

15. Show that $lambda(x+y)=lambda x+lambda y$ for all $lambda in FF$ and all $x,y in FF^n$.

  #answer[$
  lambda(x+y)&=lambda[(x_1, x_2, ..., x_n)+(y_1, y_2, ..., y_n)] \
  &= lambda(x_1 + y_1, x_2 + y_2, ..., x_n + y_n) \
  &= (lambda x_1 + lambda y_1, lambda x_2 + lambda y_2, ..., lambda x_n, lambda y_n) \
  &= (lambda x_1, lambda x_2, ..., lambda x_n) + (lambda y_1, lambda y_2, ..., lambda y_n) \
  &= lambda(x_1, x_2, ..., x_n) + lambda(y_1, y_2, ..., y_n) \
  &= lambda x + lambda y
  $]

16. Show that $(a+b)x = a\x + b\x$ for all $a,b in FF$ and all $x in FF^n$ 

== Vector Space


