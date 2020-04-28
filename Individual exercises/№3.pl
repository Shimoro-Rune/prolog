read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).


% ,-:; => [44, 45, 58, 59]
% .?! => [46, 63, 33]

iz3 :-
	write("Attention! Lecture line input is not accepted . and , as part of the offers!"),
	write("Use the iz3 predicate for texts that use . and ,! For example, iz3('One, two, three. It\'s numbers.')"), nl,
	nl,

	write("Don\'t forget to put the punctuation in the last sentence!"), nl,
	read_str(Str, _),

	count_middle(Str, Middle),
	write("Answer: "), write(Middle), nl, !.

iz3(String) :-
	string_codes(String, Codes),
	count_middle(Codes, Middle),
	write("Answer: "), write(Middle), nl, !.

% Counting punctuation marks
count_middle(String, Middle) :-
	count_middle_(String, 0, 0, Middle).

count_middle_([H|T], CountAllText, OfferNumber, Result) :-
	(
		H = 46; % .
		H = 63; % ?
		H = 33  % !
	),

	OfferNumberUpd is OfferNumber + 1,
	
	count_middle_(T, CountAllText, OfferNumberUpd, Result).

count_middle_([H|T], CountAllText, OfferNumber, Result) :-
	(
		H = 44; % ,
		H = 45; % -
		H = 58; % :
		H = 59  % :
	),

	CountAllTextUpd is CountAllText + 1,

	count_middle_(T, CountAllTextUpd, OfferNumber, Result).

count_middle_([H|T], CountAllText, OfferNumber, Result) :-
	count_middle_(T, CountAllText, OfferNumber, Result).

count_middle_([], CountAllText, OfferNumber, Result) :-
	write("Find "), write(CountAllText), write(" punctuation marks in "), write(OfferNumber), write(" offers."), nl,
	Result is CountAllText / OfferNumber, !.
