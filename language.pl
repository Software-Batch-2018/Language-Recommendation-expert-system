main :- intro, find_language(Language), describe(Language), nl, write(':) Happy Coding :)'), nl, nl.
intro :- write('Want to know which language suits you ?'), nl.

% Language descriptions for the knowledge base
describe(python) :-
  write('Python'), nl,
  write('Widely regarded as the best programming language for beginners'), nl,
  write('Easiest to learn').

describe(java) :-
  write('Java'), nl,
  write('One of the most in demand & highest paying programming languages'), nl,
  write('Slogan: write once, work everywhere').

describe(c/c++) :-
  write('C'), nl,
  write('Lingua franca of programming language'), nl,
  write('One of the oldest and most widely used language in the world').

describe(javascript) :-
  write('JavaScript'), nl,
  write('Most popular clients-side web scripting language'), nl,
  write('A must learn for front-end web developer (HTML and CSS as well)').

describe(ruby) :-
  write('Ruby'), nl,
  write('Mostly known for its popular web framework, Ruby on Rails'), nl,
  write('Focuses on getting things done').

describe(php) :-
  write('PHP'), nl,
  write('Suitable for building small and simple sites within a short time frame'), nl,
  write('Supported by almost every web hosting services with lower price').


find_language(Langauge) :- language(Langauge).
answer(i_dont_know) :- write('I don\'t know').
answer(make_money) :- write('Make money').
answer(just_for_fun) :- write('Just for fun').
answer(im_interested) :- write('I\'m interested').

answer(web) :- write('Web').
answer(mobile) :- write('Mobile').

answer(ios) :- write('iOS').
answer(android) :- write('Android').
answer(windows) :- write('Windows').

answer(front_end) :- write('Front-end (Web interface)').
answer(back_end) :- write('Back-end ("brain" behind a website)').


question(learning_purpose) :- write('Why do you want to learn programming ?'), nl.
question(platform) :- write('Which platform/field are you more interested on ?'), nl.
question(os) :- write('Which OS product would you develop ?'), nl.
question(end) :- write('Which end ?'), nl.



% Rules for the knowledge base

language(python) :- 
(learning_purpose(make_money); learning_purpose(i_dont_know)), 
platform(web),
os(windows), 
end(back_end).

language(python) :- 
learning_purpose(just_for_fun).

language(javascript) :- 
(learning_purpose(make_money); learning_purpose(im_interested)),
(platform(web); platform(android)),
(end(back_end); end(front_end)).

language(php) :- 
(learning_purpose(im_interested); learning_purpose(just_for_fun)),
platform(web),
os(windows), 
end(back_end).

language(java) :- 
(learning_purpose(i_dont_know) ; learning_purpose(im_interested)),
(platform(web); platform(mobile)),
os(android),
(end(front_end); end(back_end)).

language(c/c++) :- 
learning_purpose(i_dont_know),

language(ruby) :-
learning_purpose(make_money),
platform(web),
os(windows),
end(back_end)





:- dynamic(progress/2).
    
learning_purpose(Answer) :-
  progress(learning_purpose, Answer).
learning_purpose(Answer) :-
  \+ progress(learning_purpose, _),
  ask(learning_purpose, Answer, [i_dont_know, make_money, im_interested , just_for_fun]).    


platform(Answer) :- 
    progress(platform, Answer).
platform(Answer) :- 
    \+ progress(platform, _),
    ask(platform, Answer, [web, mobile]).

os(Answer) :-
  progress(os, Answer).
os(Answer) :-
  \+ progress(os, _),
  ask(os, Answer, [android , ios, windows]).

end(Answer) :-
  progress(end, Answer).
end(Answer) :-
  \+ progress(end, _),
  ask(end, Answer, [front_end , back_end]).



% Outputs a nicely formatted list of answers
% [First|Rest] is the Choices list, Index is the index of First in Choices
answers([], _).
answers([First|Rest], Index) :-
  write(Index), write(' '), answer(First), nl,
  NextIndex is Index + 1,
  answers(Rest, NextIndex).


% Parses an Index and returns a Response representing the "Indexth" element in
% Choices (the [First|Rest] list)
parse(0, [First|_], First).
parse(Index, [First|Rest], Response) :-
  Index > 0,
  NextIndex is Index - 1,
  parse(NextIndex, Rest, Response).


% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  question(Question),
  answers(Choices, 0),
  read(Index),
  parse(Index, Choices, Response),
  asserta(progress(Question, Response)),
  Response = Answer.