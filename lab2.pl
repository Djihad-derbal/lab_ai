% 1. Check if X is an element of the list L
element(X, [X|_]).
element(X, [_|Tail]) :-
    element(X, Tail).

% 2. Check if E is the first element of the list L
first(E, [E|_]).

% 3. Find the last element of the list L
last(E, [E]).
last(E, [_|Tail]) :-
    last(E, Tail).

% 4. Find the penultimate (second-to-last) element of the list L
penultimate(X, [X, _]).
penultimate(X, [_|Tail]) :-
    penultimate(X, Tail).

% 5. Remove the Kth element from a list L1 and return the result in L2
del_k(X, [X|Tail], 1, Tail).
del_k(X, [Head|Tail], K, [Head|TailResult]) :-
    K > 1,
    K1 is K - 1,
    del_k(X, Tail, K1, TailResult).

% 6. Calculate the length of the list L and return it in N
length([], 0).
length([_|Tail], N) :-
    length(Tail, N1),
    N is N1 + 1.

% 7. Check if the list L has an even number of elements
even(L) :- length(L, N), N mod 2 =:= 0.

% 8. Concatenate two lists L1 and L2 to form L3
concat([], L, L).
concat([Head|Tail], L2, [Head|Result]) :-
    concat(Tail, L2, Result).

% 9. Check if the list L is a palindrome
palindrome(L) :- reverse(L, L).
