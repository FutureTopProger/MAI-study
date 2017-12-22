%реализация стандартных предикатов обработки списков

%Длина списка - (список, длина)

my_length([],0).
my_length([Head|Tail], Length):-my_length(Tail, Length2), Length is Length1 + 1.

%Проверка существования элемента в списке - (элемент, список)

my_member(X, [X|_]).
my_member(X, [_|T]):-my_member(X, T)

%Конкатенация двух списков в третий - (список1, список2, список12)

my_append([], L, L).
my_append([X|L1], L2, [X|L3]):-my_append(L1, L2, L3).

%Удаление элемента из списка - (список1, элемент, список2 без элемента)

my_remove(X, [X|T], T).
my_remove(X, [Y|T], [Y|Z]):-my_remove(X, T, Z).

%Проверка перестановок в списке - (список, перестановка список1)

my_permute([], []).
my_permute(L, [X|T]):-my_remove(X, L, Y), my_permute(Y, T).

%Подсписок в списке - (список, подсписок)

my_sublist(S, L):-my_append(_, L1, L), my_append(S, _, L1).


% Нахождение элемента списка, следующего за данным
find_next(Num, [Num, ResNum|_], ResNum):-
    !. 
find_next(Num, [_|Tail], ResNum):- 
    find_next(Num, Tail, ResNum).
    
%task(Num, List):-
%   find_next(Num, List, ResNum), 
%   write(ResNum).

