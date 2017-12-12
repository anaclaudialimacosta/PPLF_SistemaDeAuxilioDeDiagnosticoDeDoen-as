:- use_module(library(plunit)).
%base de dados doença
doenca(gripe,['s','s','s','n','n','n','n','n','s','s','n','s'], 'Possível Causas: Gripe').
doenca(dermatite,['s','n','n','s','s','n','n','n','n','n','n', 'n'],'Possíveis Causas: Dermatite ').
doenca(pneumonia, ['s','s','n','n','n','s','n','n','n','n','n','n'],'Possíveis Causas: Pneumonia. Procure um medico!' ).
doenca(bronquiolite, ['s','s','n','n','n','s','n','n','n','n','n','n'],'Possíveis Causas: Bronquiolite. Procure um medico!' ).
doenca(sinusite,['n','n','n','n','n','n','s','s','s','n','n','n'], 'Possíveis Causas: Sinuzite').
doenca(rinite, ['n','n','n','n','n','n','n','n','n','s','s','s'], 'Possíveis Causas: Rinite').

concatenaListas([],L,L).
concatenaListas([X|L1],L2,[X|L3]):-
    concatenaListas(L1,L2,L3).
%insere sempre na primeira posicao
insere_na_lista(X,XS,[X|XS]).


inverterLista([],[]).
inverterLista([X|Y],Z):-
    inverterLista(Y,Y1),
        concatenaListas(Y1,[X],Z).


%regras de entrada e saída

leitura:-
    write('Sistema de Diagnostico de Doencas'),nl,
    write('Leitura dos Sintomas <Digite S ou N>'), nl,
    write('Febre?'),
    read(Febre),
    insere_na_lista(Febre, L, X),
    write('Tosse?'),
    read(Tosse),
    insere_na_lista(Tosse, X, Y),
    write('Dor No Corpo?'),
    read(Dor),
    insere_na_lista(Dor, Y, W),
    write('Coceira?'),
    read(Coceira),
    insere_na_lista(Coceira, W, Z),
    write('Erupocoes na Pele?'),
    read(Erupcoes),
    insere_na_lista(Erupcoes, Z, R),
    write('Ritmo Respiratorio Acelerado?'),
    read(Ritmo),
    insere_na_lista(Ritmo, R, S),
    write('Dor Na Face?'),
    read(Dornaface),
    insere_na_lista(Dornaface, S, T),
    write('Congestao Nasal?'),
    read(Congestao),
    insere_na_lista(Congestao,T, V),
    write('Dor de Cabeca?'),
    read(Dordecabeca),
    insere_na_lista(Dordecabeca, V,U),
    write('Coriza?'),
    read(Coriza),
    insere_na_lista(Coriza, U, US),
    write('Olhos Irritados?'),
    read(Olhoirritado),
    insere_na_lista(Olhoirritado, US, XS),
    write('Espirros?'),
    read(Espirros),
    insere_na_lista(Espirros, XS,YS),
    inverterLista(YS,ZS),
    diagnostico(ZS).

listasIguais([],[]).
listasIguais([X | Lista1], [X | Lista2]) :- listasIguais(Lista1, Lista2).



diagnostico(Lista):-
    doenca(Doenca,Respostas,Diagnostico),
    listasIguais(Lista,Respostas),
    write(Diagnostico);
    write('Não foi possivel identificar sua doença').

:-begin_tests(inverterLista).
test(t1):- inverterLista(['s','s','s','s','s','s','s','s','s','s','s','n'], ['n','s','s','s','s','s','s','s','s','s','s','s']).
test(t2):- inverterLista([1,2,3,4],[4,3,2,1]).
test(t3, Q=['s', 'n']):- inverterLista(['n', 's'], Q).

end_tests(listasIguais).
















