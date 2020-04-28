predicate_options:list([], A, A).
predicate_options:list([A|B], [A|C], D) :-
    user:list(B, C, D).

:- dynamic list/2.

list(bidju, ['Shukaku', 'Kurama']).
list(sannin, ['Uzumaki Naruto', 'Uchiha Sasuke', 'Orochimaru', 'Haruno Sakura', 'Jiraiya', 'Tsunade']).
list(sharingan, ['Uchiha Sasuke', 'Hatake Kakashi', 'Uchiha Madara']).
list(animal, ['Shima', 'Shukaku', 'Kurama', 'Akamaru']).
list(red, ['Gaara', 'Haruno Sakura', 'Terumii Mei', 'Uzumaki Kushina', 'Juugo', 'Nagato']).
list(kage, ['Uzumaki Naruto', 'Hatake Kakashi', 'Gaara', 'Terumii Mei', 'Tsunade', 'Namikaze Minato']).
list(dead, ['Uchiha Madara', 'Jiraiya', 'Uzumaki Kushina', 'Ootsutsuki Momoshiki', 'Namikaze Minato', 'Konan', 'Nagato']).
list(akatsuki, ['Orochimaru', 'Juugo', 'Konan', 'Nagato']).
list(old, ['Orochimaru', 'Jiraiya', 'Shima', 'Tsunade', 'Kurama', 'Shukaku']).
list(konoha, ['Uzumaki Naruto', 'Uchiha Sasuke', 'Hatake Kakashi', 'Orochimaru', 'Uchiha Madara', 'Haruno Sakura', 'Jiraiya', 'Maito Gai', 'Yamanaka Ino', 'Nara Shikamaru', 'Tsunade', 'Uzumaki Kushina', 'Kurama', 'Inuzuka Kiba', 'Akamaru', 'Namikaze Minato', 'Uzumaki Menma']).
list(parent, ['Uzumaki Naruto', 'Uchiha Sasuke', 'Gaara', 'Haruno Sakura', 'Yamanaka Ino', 'Nara Shikamaru', 'Temari']).
list(beast, ['Uzumaki Naruto', 'Uchiha Sasuke', 'Hatake Kakashi', 'Orochimaru', 'Gaara', 'Haruno Sakura', 'Jiraiya', 'Temari', 'Tsunade', 'Inuzuka Kiba', 'Namikaze Minato', 'Uzumaki Menma']).
list(blond, ['Uzumaki Naruto', 'Hatake Kakashi', 'Jiraiya', 'Yamanaka Ino', 'Temari', 'Tsunade', 'Ootsutsuki Momoshiki', 'Namikaze Minato']).
list(uzumaki, ['Uzumaki Naruto', 'Uzumaki Kushina', 'Namikaze Minato', 'Uzumaki Menma']).
list(female, ['Haruno Sakura', 'Yamanaka Ino', 'Temari', 'Terumii Mei', 'Shima', 'Tsunade', 'Uzumaki Kushina', 'Konan']).
list(characters, ['Uzumaki Naruto', 'Uchiha Sasuke', 'Hatake Kakashi', 'Orochimaru', 'Uchiha Madara', 'Gaara', 'Haruno Sakura', 'Jiraiya', 'Maito Gai', 'Yamanaka Ino', 'Nara Shikamaru', 'Temari', 'Terumii Mei', 'Shima', 'Shukaku', 'Tsunade', 'Uzumaki Kushina', 'Kurama', 'Juugo', 'Inuzuka Kiba', 'Ootsutsuki Momoshiki', 'Akamaru', 'Namikaze Minato', 'Uzumaki Menma', 'Konan', 'Nagato']).

