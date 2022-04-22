$title Gams sample

sets
         i plants / Seattle, San_Diego /
         j markets / New_York, Chicago, Topeka /;

parameters
         a(i)    supply limit
         /Seattle        350
          San_Diego      600/

         b(j)    satisfy demand
         /New_York       325
          Chicago        300
          Topeka         275 /;

Table d(i,j) distance between cities in 1000 miles
                 New_York        Chicago         Topeka
Seattle          2.5             1.7             1.8
San_Diego        2.5             1.8             1.4;

Scalar f shipping cost per case per 1000miles /90/ ;

Parameter c(i,j) transport in dollars in thousands of dollar per case;
          c(i,j) = f * d(i,j) / 1000 ;

Variables
         x(i,j) shipment quantities in cases
         z total transportation costs in thousands of dollars;

Positive variable x;

Equations
         cost            define the objective function
         supply(i)       supply limit at plant i
         demand(j)       satisfy demand at market j;

cost.. z =e= sum((i,j), c(i,j)*x(i,j));

supply(i).. sum(j, x(i,j)) =l= a(i);

demand(j).. sum(i, x(i,j)) =g= b(j);

Model transport /all/ ;

Solve transport using lp minimizing z ;

Display x.l, z.l ;







