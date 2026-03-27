:- initialization(main).

main :-
    loop_symdiff.

loop_symdiff :-
    write('Введите первое множество (список) или q для выхода: '),
    read(A),
    ( A == q ->
        writeln('Выход.')
    ; write('Введите второе множество или q для выхода: '),
      read(B),
      ( B == q ->
          writeln('Выход.')
      ; difference(A, B, D1),
        difference(B, A, D2),
        append(D1, D2, SymDiff),
        format('Симметрическая разность: ~w~n', [SymDiff]),
        loop_symdiff   % рекурсивный цикл вместо repeat/fail
      )
    ).

difference([], _, []).
difference([H|T], B, [H|R]) :-
    \+ member(H, B),
    difference(T, B, R).
difference([_|T], B, R) :-
    difference(T, B, R).
