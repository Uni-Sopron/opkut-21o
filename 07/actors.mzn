int: nDays;
set of int: Days = 1..nDays;
enum Scenes;
enum Actors;

array[Actors] of int: fee;
array[Actors] of set of Scenes: appears_in;

array[Scenes] of var Days: when;

%solve minimize sum(a in Actors, d in Days) (
%  fee[a] * exists(s in appears_in[a]) (when[s] == d)
%);
% vagy:
solve minimize sum(a in Actors, d in Days
    where exists(s in appears_in[a]) (when[s] == d)) (
  fee[a]
);

include "globals.mzn";
constraint forall(d in Days) (
  %at_most(5, when, d)   % value 'd' appears at most 5 times in 'when'
  sum(s in Scenes)(when[s] == d) <= 5
);

constraint when[Scenes[1]] = 1;
constraint forall (s in Scenes where s > 1) (
  when[s] <= max(k in Scenes where k < s)(when[k]) + 1
);