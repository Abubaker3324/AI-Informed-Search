:- use_module(data).
go(PERSON1,PERSON2).

%Q1
is_friend(X,Y):-  friend(Y,X);friend(X,Y).

%Q2
isFound(Element,[Element|Tail]).
isFound(Element,[H|T]):- isFound(Element,T).

getList(Person, List, R):-
     friend(Person,Friend),
     not(isFound(Friend,List)),!,
     getList(Person,[Friend|List],R).

getList(Person, L, L).

friendList(Name,List):-
     getList(Name,[],List).

%Q3
count([],0).
count([H|T],L):-
    count(T, NewL),
      L is NewL + 1.

friendListCount(Name,L):-
    friendList(Name,X),
    count(X,L).

%Q4
suggest(X,Y):- friend(X,Y); friend(Y,X).
peopleYouMayKnow(X,L):-
    friend(X,Y),
    suggest(Y,L),
    X \= L.         % to skip the person

%Q6
peopleYouMayKnowList(Person, List):-
     getList2(Person,[],List),!.

getList2(Person, List, R):-
     peopleYouMayKnow(Person,Friend),
     not(isFound(Friend,List)),
     getList2(Person,[Friend|List],R).

getList2(_, L, L).


%Bonus Task
peopleYouMayKnow_indirect(X,W):-
    is_friend(X,Y),
    is_friend(Y,Z),
    is_friend(Z,W),
    not(peopleYouMayKnow(X,W)),
    not(X=Y),
    not(is_friend(X,W)).
