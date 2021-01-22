function [expr] = abbrevian_fun (EXPR) 
%  abbreviates sin/cos terms of a given symbolic expression or matrix 
% 4 using all angle variables from omni-wrist platform thesis work
% : -Ron  Nyzen 
syms t1 t2 t3 t4 t5 t6 t7  real
syms C1 C2 C3 C4 C5 C6 C7 S1 S2 S3 S4 S5 S6 S7 real
% syms pl p2 p3 p4 Lb Lal Lar Lu Lp 
% syms c4 c5 c6 cp3 cp4 s4 s5 s6 sp3 sp4 
% syms a  b  c  x  y z  sa ca sb cb sc cc 
expr=subs(EXPR,cos(t1),C1) ; 
expr=subs(expr, cos(t2),  C2) ; 
expr=subs(expr, cos(t3),  C3) ; 
expr=subs(expr, cos(t4),  C4) ; 
expr=subs(expr, cos(t5),  C5) ; 
expr=subs(expr, cos(t6),  C6) ;
expr=subs(expr, cos(t7),  C7) ;

expr=subs(expr, sin(t2),  S2) ; 
expr=subs(expr, sin(t3),  S3) ; 
expr=subs(expr, sin(t4),  S4) ; 
expr=subs(expr, sin(t5),  S5) ; 
expr=subs(expr, sin(t6),  S6) ;
expr=subs(expr, sin(t7),  S7) ;
% expr=subs(mmmm,sin(t1),Sl) ; 
% expr=subs (expr, cos (pl) , cpl) ; 
% expr=subs (expr, cos (p2) 42 )  ; 
% expr=subs (expr, cos (Q4/2),  c4) ; 
% expr=subs (expr, cos (Q5/2)  ,c5) ; 
% expr=subs (expr, cos (Q6)  ,c6) ; 
% expr=subs (expr, cos (p3) ,  cp3) ; 
% expr=subs (expr, cos (p4 )  , cp4 )  ; 
% expr=subs (expr, sin (Q1/2)  , sl) ; 
% expr=subs (expr, sin (~2/2)  , s2) ; 
% expr=subs (expr, sin (Q3)  3  ; 
% expr=subs (expr, sin (pl) -1)  ; 
% expr=subs (expr, sin (p2 i  , sp2) ; 
% expr=subs (expr, sin (Q4 /2)  , s4) ; 
% expr=subs (expr, sin (Q5/2)  , s5) ; 
% expr=subs (expr, sin (Q6),  s6) ; 
% expr=scbs (expr, sin (p3) , sp3) ; 
% expr=subs (expr, sin (p4), sp)  ; 
% expr=subs (expr, sin (a) , sa) ; 
% expr=subs (expr, sin (b) , sb) ; 
% expr=subs (expr, sin (c) ,  sc) ; 
% expr=subs (expr, cos (a) ,ca) ; 
% expr=subs (expr, cos (b) , cb) ; 
% expr=subs (expr, cos (c) , cc) 