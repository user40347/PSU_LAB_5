:- initialization(main).

main :-
    loop_digits.

loop_digits :-
    repeat,
    write('Ââåäèòå íàòóðàëüíîå ÷èñëî N èëè q äëÿ âûõîäà: '), flush_output,
    read_line_to_string(user_input, S),
    ( S == "q" ->
        writeln('Âûõîä èç ïðîãðàììû.'), !
    ; ( number_string(N, S), integer(N), N >= 0 ->
          number_codes(N, Codes),
          maplist(code_digit, Codes, Digits),
          format('Ñïèñîê öèôð: ~w~n', [Digits])
      ; format('Îøèáêà: «~w» íå ÿâëÿåòñÿ íàòóðàëüíûì ÷èñëîì.~n', [S])
      ),
      fail
    ).

code_digit(Code, Digit) :-
    Digit is Code - 0'0.
