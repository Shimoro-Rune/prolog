read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),
						read_list(List1,A,I1,N).


%Reading list from console
iz2 :-
	read(List),
	getMiddlePrimes(List, MiddlePrimes),
	getMiddleNotPrimes(List, Middle, MiddlePrimes),
	write("Answer is "), write(Middle), nl.

%Check if it is prime
isPrime(Number) :-
	NumberOdd is Number mod 2,
	NumberOdd = 1,

	NumberSqrt is sqrt(Number) + 1,
	NumberSqrtSuperInt is round(float_integer_part(NumberSqrt)) + 1,
	isPrime_(Number, NumberSqrtSuperInt, 3), !.

isPrime_(_, NumberSqrt, CurrentNumber) :-
	CurrentNumber >= NumberSqrt.

isPrime_(Number, NumberSqrt, CurrentNumber) :-
	CurrentNumber < NumberSqrt,
	SomeTempValue is Number mod CurrentNumber,
	not(SomeTempValue = 0),
	
	NextNumber is CurrentNumber + 2,
	isPrime_(Number, NumberSqrt, NextNumber).

isPrime_(Number, NumberSqrt, CurrentNumber) :-
	CurrentNumber < NumberSqrt,
	SomeTempValue is Number mod CurrentNumber,
	SomeTempValue = 0, fail, !.

%Arithmetic mean of prime numbers
getMiddlePrimes([H|T], Middle) :-
	getMiddlePrimes([H|T], Middle, 0, 0), !.

getMiddlePrimes([H|T], Middle, CurrentSum, Counter) :-
	(
		isPrime(H),
		S is CurrentSum + H,
		Count is Counter + 1,
		getMiddlePrimes(T, Middle, S, Count), !
	);
	(
		getMiddlePrimes(T, Middle, CurrentSum, Counter), !
	).

getMiddlePrimes([], Middle, CurrentSum, Counter) :-
	Middle is CurrentSum / Counter, !.

%Arithmetic mean of not prime numbers
getMiddleNotPrimes([H|T], Middle, PrimesMiddle) :-
	getMiddleNotPrimes([H|T], Middle, PrimesMiddle, 0, 0), !.

getMiddleNotPrimes([H|T], Middle, PrimesMiddle, CurrentSum, Counter) :-
	(
		not(isPrime(H)),
		H > PrimesMiddle,
		S is CurrentSum + H,
		Count is Counter + 1,
		getMiddleNotPrimes(T, Middle, PrimesMiddle, S, Count), !
	);
	(
		getMiddleNotPrimes(T, Middle, PrimesMiddle, CurrentSum, Counter), !
	).

getMiddleNotPrimes([], Middle, _, CurrentSum, Counter) :-
	Middle is CurrentSum / Counter, !.