# file: product_mix.mod
#
# Product mix problem
#
# Maximize profit subject to less than or equal to constraints

# Sets
set Products;
set Resources;

# Decision variables
var x {j in Products} >= 0;

# Parameters
param profit {j in Products} >= 0;
param availability {i in Resources} >= 0;
param consumption {i in Resources, j in Products} >= 0;

# Objective function
maximize total_profit: sum {j in Products} profit[j]*x[j];

# Constraints
s.t.   usage {i in Resources}:
	sum {j in Products} consumption[i, j]*x[j]
		<=  availability[i];
