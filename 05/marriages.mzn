enum Men;
enum Women;
% rankings with 1 being the best
array[Women, Men] of int: rankWomen;
array[Men, Women] of int: rankMen;
% variables: whom to marry
array[Men] of var Women: wife;
array[Women] of var Men: husband;
% marriages are symmetric
constraint forall(m in Men) ( 
  husband[wife[m]] = m 
);
% array index can be a variable
constraint forall(w in Women) ( 
  wife[husband[w]] = w 
);
% if a man prefers another woman over his wife, that woman prefers her husband over this man
constraint forall(m in Men, o in Women) (
  rankMen[m,o] < rankMen[m, wife[m]] ->      % implication
  rankWomen[o,husband[o]] < rankWomen[o,m]
);
constraint forall(w in Women, o in Men) (
  rankWomen[w,o] < rankWomen[w,husband[w]] ->
  rankMen[o,wife[o]] < rankMen[o,w]
);
solve satisfy;
output [ show(w) ++ "\t" ++ show(husband[w]) ++ "\n" | w in Women ];