:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start_game :-
    nl,
    write('Hi This is the "Name Game"'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu_loop.

menu_loop :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice...'), nl,
    write('|: '),
    read(Choice),
    handle_choice(Choice).

handle_choice(1) :-
    nl, write('--- Current Set of Letters ---'), nl,
    (   letter(X), writeln(X), fail
    ;   true
    ),
    menu_loop.

handle_choice(2) :-
    write('Enter letter to add: '), read(L),
    assert(letter(L)),
    write('Letter added successfully.'), nl,
    menu_loop.

handle_choice(3) :-
    write('Enter letter to add at the top: '), read(L),
    asserta(letter(L)),
    write('Letter added at the top successfully.'), nl,
    menu_loop.

handle_choice(4) :-
    write('Enter letter to add at the bottom: '), read(L),
    assertz(letter(L)),
    write('Letter added at the bottom successfully.'), nl,
    menu_loop.

handle_choice(5) :-
    write('Enter letter to delete: '), read(L),
    (   retract(letter(L))
    ->  write('Letter deleted successfully.'), nl
    ;   write('Letter not found in the database.'), nl
    ),
    menu_loop.

handle_choice(6) :-
    retractall(letter(_)),
    write('All letters deleted successfully.'), nl,
    menu_loop.

handle_choice(7) :-
    write('Exiting Name Game. Good luck!'), nl.

handle_choice(_) :-
    write('Invalid choice. Please choose a number between 1 and 7.'), nl,
    menu_loop.
