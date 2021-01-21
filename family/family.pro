male(stephen).
male(andrew).
male(david).
male(ben).
male(craig).
male(raymond).
male(melvin).

female(susan).
female(emma).
female(rebecca).
female(esmai).
female(deborah).
female(jade).

parent(stephen, andrew).
parent(susan, andrew).

parent(stephen, emma).
parent(susan, emma).

parent(andrew, esmai).
parent(rebecca, esmai).

parent(david, ben).
parent(deborah, ben).

parent(david, rebecca).
parent(deborah, rebecca).

parent(david, craig).
parent(deborah, craig).

parent(david, jade).
parent(deborah, jade).

mother(M, C) :-
  parent(M, C),
  female(M).

father(F, C) :-
  parent(F, C),
  male(F).

grandmother(GM, C) :-
  parent(X, C),
  parent(GM, X),
  female(GM).

grandfather(GF, C) :-
  parent(X, C),
  parent(GF, X),
  male(GF).

brother(B, S) :-
  male(B),
  father(F, B),
  father(F, S),
  mother(M, B),
  mother(M, S),
  B \= S.

sister(T, S) :-
  female(T),
  father(F, T),
  father(F, S),
  mother(M, T),
  mother(M, S),
  T \= S.

siblings(S, T) :-
  brother(S, T),
  brother(T, S).
siblings(S, T) :-
  brother(S, T),
  sister(T, S).
siblings(S, T) :-
  sister(S, T),
  brother(T, S).
siblings(S, T) :-
  sister(S, T),
  sister(T, S).

spouse(stephen, susan).
spouse(andrew, rebecca).

married(X, Y) :- spouse(X, Y).
married(X, Y) :- spouse(Y, X).

% 9- Use the new married predicate to add rules for uncles and aunts that get
% uncles and aunts by marriage as well as by blood. You should have two rules
% for each of these relationships, one ofr the blood case and one for the
% marriage case. Use trace to follow their behaviour. (32%)
