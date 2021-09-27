int: N;
set of int: Items = 1..N;
int: C;

array[Items] of int: weight;
array[Items] of int: value;

array[Items] of var bool: select; % bool = 0..1 = {0,1}

var int: totalWeight = sum(i in Items)(select[i]*weight[i]);

%var int: totalValue = sum(i in Items)(select[i]*value[i]);
var int: totalValue = sum(i in Items where select[i])(value[i]);
%var int: totalValue = sum([value[i] | i in Items where select[i]]);

constraint totalWeight <= C;

solve maximize totalValue;

%output [show(select)];
output ["Selected \(sum(select)) items:"];
output [
  " \(i)" | i in Items where fix(select[i]) % == 1
];

output ["\nTotal weight: \(totalWeight)"];
output ["\nTotal value: \(totalValue)"];
