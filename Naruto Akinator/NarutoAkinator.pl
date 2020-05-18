% Author:  Dinara Khafizova

:- consult('NarutoDataBase.pl').


%Main
play:-presentation,
       list('characters',L),
       quest(L,Aux,['characters'],DataNewOut),
       guessing(Aux,DataNewOut).

%Presentation
presentation:-write('  _  _                _             _    _   _           _            \n'),
              write(' | \\| | __ _ _ _  _ _| |_ ___      /_\\  | |_(_)_ _  __ _| |_ ___ _ _  \n'),
              write(' |  \\ |/ _` |  _|| / |  _/ _ \\    / _ \\ | / / |   \\/ _` |  _/ _ \\  _| \n'),
              write(' |_|\\_|\\__,_|_|  \\___|\\__\\___/   /_/ \\_\\|_\\_\\_|_||_\\__,_|\\__\\___/_|   \n'),
              write('======================================================================\n'),
              write('                  Добро пожаловать в Акинатор Наруто!\n'),
              write('            Загадайте персонажа, и я попробую угадать его!\n'),
              write('======================================================================\n\n').

%Quest
quest(L,Aux14,DataNew,DataNew14):-lineFemale(L,Aux0,DataNew,DataNew0),
              solution(Aux0),
              lineUzumaki(Aux0,Aux1,DataNew0,DataNew1),
              solution(Aux1),
              lineBlond(Aux1,Aux2,DataNew1,DataNew2),
              solution(Aux2),
              lineDead(Aux2,Aux3,DataNew2,DataNew3),
              solution(Aux3),
              lineBeast(Aux3,Aux4,DataNew3,DataNew4),
              solution(Aux4),
              lineParent(Aux4,Aux5,DataNew4,DataNew5),
              solution(Aux5),
              lineOld(Aux5,Aux6,DataNew5,DataNew6),
              solution(Aux6),
              lineKage(Aux6,Aux7,DataNew6,DataNew7),
              solution(Aux7),
              lineSannin(Aux7,Aux8,DataNew7,DataNew8),
              solution(Aux8),
              lineKonoha(Aux8,Aux9,DataNew8,DataNew9),
              solution(Aux9),
              lineRed(Aux9,Aux10,DataNew9,DataNew10),
              solution(Aux10),
              lineAkatsuki(Aux10,Aux11,DataNew10,DataNew11),
              solution(Aux11),
              lineBidju(Aux11,Aux12,DataNew11,DataNew12),
              solution(Aux12),
              lineAnimal(Aux12,Aux13,DataNew12,DataNew13),
              solution(Aux13),
              lineSharingan(Aux13,Aux14,DataNew13,DataNew14),
              solution(Aux14).
%Guessing
guessing(List,DataNew):-length(List,0)->write('Я не знаю этого персонажа, пожалуйста, напишите его имя в кавычках:'),read(New),addCharacter(New,DataNew);
                               write('Я не знаю, что это за персонаж, но у меня есть несколько вариантов: '),
                               write(List),
                               write('\n Хотите сыграть снова?(y/n)\n'),
                               read(Answer),
                               leave(Answer);
                               write('').

%Add new character and update lists
addCharacter(New,DataNew):-[X|Y]=DataNew,
                                updateList(X,New),
                                not(Y=[]),
                                addCharacter(New,Y).
                                
updateList(X,New):-list(X,Y),Z=[New|Y],
                          retract(list(X,Y)),
                          assertz(list(X,Z)),
                          tell('NarutoDataBase.pl'),
                          listing(list),
                          told.

%Female
lineFemale(L,X,DataIn,DataOut):- write("Ваш персонаж женского пола? (y/n/Idk)\n"),
        read(Female),
        list('female',T),
        (check(Female)->intersection(L,T,X),DataOut=['female'|DataIn];
             (checkIdk(Female)->X=L;
              subtract(L,T,X),DataOut=DataIn)
        ),
        writeln(X).
        
%Uzumaki
lineUzumaki(L,X,DataIn,DataOut):- write('Носит ли Ваш персонаж фамилию Узумаки? (y/n/Idk)\n'),
        read(Uzumaki),
        list('uzumaki',F),
        (check(Uzumaki)->intersection(L,F,X),DataOut=['uzumaki'|DataIn];
             (checkIdk(Uzumaki)->X=L;
              subtract(L,F,X),DataOut=DataIn)
        ),
        writeln(X).
        
%Blond
lineBlond(L,X,DataIn,DataOut):- write('У Вашего персонажа светлые волосы? (y/n/Idk)\n'),
        read(Blond),
        list('blond',V),
        (check(Blond)->intersection(L,V,X),DataOut=['blond'|DataIn];
             (checkIdk(Blond)->X=L;
              subtract(L,V,X),DataOut=DataIn)
        ),
        writeln(X).
        
%Dead
lineDead(L,X,DataIn,DataOut):- write('Ваш персонаж мертв? (y/n/Idk)\n'),
        read(Dead),
        list('dead',A),
        (check(Dead)->intersection(L,A,X),DataOut=['dead'|DataIn];
             (checkIdk(Dead)->X=L;
              subtract(L,A,X),DataOut=DataIn)
        ),
        writeln(X).
        
%Beast
lineBeast(L,X,DataIn,DataOut):- write('У Вашего персонажа есть спутник, внешне напоминающий/являющийся животным? (y/n/Idk)\n'),
        read(Beast),
        list('beast',E),
        (check(Beast)->intersection(L,E,X),DataOut=['beast'|DataIn];
             (checkIdk(Beast)->X=L;
              subtract(L,E,X),DataOut=DataIn)
        ),
        writeln(X).

%Konoha
lineKonoha(L,X,DataIn,DataOut):- write('Родина Вашего персонажа - Коноха? (y/n/Idk)\n'),
        read(Konoha),
        list('konoha',M),
        (check(Konoha)->intersection(L,M,X),DataOut=['konoha'|DataIn];
             (checkIdk(Konoha)->X=L;
              subtract(L,M,X),DataOut=DataIn)
        ),
        writeln(X).

%Animal
lineAnimal(L,X,DataIn,DataOut):- write('Ваш персонаж похож на животное? (y/n/Idk)\n'),
        read(Animal),
        list('animal',Fan),
        (check(Animal)->intersection(L,Fan,X),DataOut=['animal'|DataIn];
             (checkIdk(Animal)->X=L;
              subtract(L,Fan,X),DataOut=DataIn)
        ),
        writeln(X).
        
%Sharingan
lineSharingan(L,X,DataIn,DataOut):- write('У Вашего персонажа имеется шаринган? (y/n/Idk)\n'),
        read(Sharingan),
        list('sharingan',G),
        (check(Sharingan)->intersection(L,G,X),DataOut=['sharingan'|DataIn];
             (checkIdk(Sharingan)->X=L;
              subtract(L,G,X),DataOut=DataIn)
        ),
        writeln(X).

%Old
lineOld(L,X,DataIn,DataOut):- write('В действительности Ваш персонаж стар? (y/n/Idk)\n'),
        read(Old),
        list('old',R),
        (check(Old)->intersection(L,R,X),DataOut=['old'|DataIn];
             (checkIdk(Old)->X=L;
              subtract(L,R,X),DataOut=DataIn)
        ),
        writeln(X).

%Sannin
lineSannin(L,X,DataIn,DataOut):- write('Является ли Ваш персонаж одних из трех Великих Саннинов? (y/n/Idk)\n'),
        read(Sannin),
        list('sannin',N),
        (check(Sannin)->intersection(L,N,X),DataOut=['sannin'|DataIn];
             (checkIdk(Sannin)->X=L;
              subtract(L,N,X),DataOut=DataIn)
        ),
        writeln(X).

%Red
lineRed(L,X,DataIn,DataOut):- write('Ваш персонаж - обладатель волос красного оттенка (рыжего/розового в том числе)? (y/n/Idk)\n'),
        read(Red),
        list('red',Ani),
        (check(Red)->intersection(L,Ani,X),DataOut=['red'|DataIn];
             (checkIdk(Red)->X=L;
              subtract(L,Ani,X),DataOut=DataIn)
        ),
        writeln(X).

%Akatsuki
lineAkatsuki(L,X,DataIn,DataOut):- write('Является ли Ваш персонаж участником Акацуки? (y/n/Idk)\n'),
        read(Akatsuki),
        list('akatsuki',C),
        (check(Akatsuki)->intersection(L,C,X),DataOut=['akatsuki'|DataIn];
             (checkIdk(Akatsuki)->X=L;
              subtract(L,C,X),DataOut=DataIn)
        ),
        writeln(X).

%Bidju (Bald)
lineBidju(L,X,DataIn,DataOut):- write('Ваш персонаж - биджу? (y/n/Idk)\n'),
        read(Bidju),
        list('bidju',B),
        (check(Bidju)->intersection(L,B,X),DataOut=['bidju'|DataIn];
             (checkIdk(Bidju)->X=L;
              subtract(L,B,X),DataOut=DataIn)
        ),
        writeln(X).
        
%Parent
lineParent(L,X,DataIn,DataOut):- write('Стал ли Ваш персонаж родителем в аниме Боруто: Новое поколение Наруто? (y/n/Idk)\n'),
        read(Parent),
        list('parent',Ca),
        (check(Parent)->intersection(L,Ca,X),DataOut=['parent'|DataIn];
             (checkIdk(Parent)->X=L;
              subtract(L,Ca,X),DataOut=DataIn)
        ),
        writeln(X).
        
%Kage
lineKage(L,X,DataIn,DataOut):- write('Ваш персонаж был/является каге? (y/n/Idk)\n'),
        read(Kage),
        list('kage',Ar),
        (check(Kage)->intersection(L,Ar,X),DataOut=['kage'|DataIn];
             (checkIdk(Kage)->X=L;
              subtract(L,Ar,X),DataOut=DataIn)
        ),
        writeln(X).

        
%Check if user wants to leave
leave(R):-check(R)->play; write('Хмм...'), abort.
set(A):-check(A)-> write('\n Хотите сыграть снова?(y/n)\n'),
            read(Answer),
            leave(Answer);
            write('Продолжаем игру.\n').
			
%Check the response given by the user
check(X):-X='y';X='Yes';X='yes'.
checkIdk(X):-X='Idk';X='I do not know'.

%Gets the first item in the list
first(F, [F|_]).

%Check if already have the solution
solution(X):-length(X,1)-> first(E,X),
         write('Персонаж, которого Вы загадали: '),
         write(E),
         write('\n Я прав?(y/n)\n'),
         read(Success),
         set(Success);
         write('').
