$title Wyndor Glass Example

sets
         i zone de production    /z1, z2, z3/
         j produits              /p1, p2/;

parameters
         c(i) capacite disponible d'une zone i
         / z1    4
           z2    12
           z3    18 /

         f(j) benefice d'un produit j
         / p1    3
           p2    5/      ;

Table u(i,j) capacité utilisée par unité de taux de production

         p1      p2
z1       1       0
z2       0       2
z3       3       2  ;

Variables x(i,j) quantité produite d'un produit j par la zone i
          z      profit total;

Positive Variable x;

Equations
         profit                     définir la fonction objective
         capacite_dispo(i)          capacité disponible de zone i;

profit.. z =e= sum(j, sum(i, x(i,j))*f(j)) ;

capacite_dispo(i).. sum(j, x(i,j)*u(i,j)) =l= c(i);

Model Wyndor /all/ ;

Solve Wyndor using lp maximizing z ;

Display x.l, z.l;

