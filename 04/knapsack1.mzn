int: N = 4;
set of int: Items = 1..N;
int: C = 7;

array[Items] of int: weight = 2..5;
array[Items] of int: value = [16, 19, 23, 28];

array[Items] of var {0,1}: select;

var int: totalWeight
  = select[1]*weight[1] + select[2]*weight[2]
  + select[3]*weight[3] + select[4]*weight[4]
;

var int: totalValue
  = select[1]*value[1] + select[2]*value[2]
  + select[3]*value[3] + select[4]*value[4]
;

constraint totalWeight <= C;

solve maximize totalValue;

output [show(select)];

output ["\nTotal weight: " ++ show(totalWeight)];
output ["\nTotal value: " ++ show(totalValue)];
