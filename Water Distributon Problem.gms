$title Distribution of water Problem

sets
         i les rivieres / Colombo, Sacran, Calorie/
         j les villes   / Berdoo, Las-devils, SanGo, Hollyglass/ ;


parameters
         a(i)  quantite dispo des rivieres
         / Colombo       50
           Sacran        60
           Calorie       50 /

         b(j) quantite minimum requis
         / Berdoo        30
           Las-devils    70
           SanGo         0
           Hollyglass     10 /

         c(j) quantite demandee
         / Berdoo        50
           Las-devils    70
           SanGo         30
           Hollyglass     99999999/;

Table d(i,j)     cost per acre foot of water ( in tens of dollars)
                 Berdoo          Las-devils      SanGo           Hollyglass
Colombo          16              13              22              17
Sacran           14              13              19              15
Calorie          19              20              23              9999999         ;

Variables
         x(i,j)  transportation depuis des rivieres aux villes
         z       cout total de transportation;

positive variable x;

Equations
         cost            definer la function d'objective
         supply(i)       limite d'approvisionnement à la rivière i
         demand_min(j)   demande minimale acquise de la ville j
         demand_max(j)   demande max de la ville j ;

cost.. z =e= sum((i,j), x(i,j)*d(i,j));

supply(i).. sum(j, x(i,j)) =l= a(i);

demand_min(j).. sum(i, x(i,j)) =g= b(j);

demand_max(j).. sum(i, x(i,j)) =l= c(j);

Model transport /all/ ;

Solve transport using lp minimizing z ;

Display x.l, z.l;







