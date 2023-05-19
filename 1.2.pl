male(mohatu).
male(ajabu).
male(ahadi).
male(hasani).
male(masud).
male(lateef).
male(wazimu).
male(scar).
male(mufasa).
male(upepo).
male(kijani).
male(nuka).
male(chumvi).
male(tojo).
male(simba).
male(mega).
male(malka).
male(mtoto).
male(mheetu).
male(kopa).
male(kion).


female(ardhi).
female(uru).
female(adamma).
female(amina).
female(mandisa).
female(zira).
female(sarabi).
female(naanda).
female(dwala).
female(diku).
female(sarafina).
female(tama).
female(shabaha).
female(safura).
female(kula).
female(kiara).
female(deka).
female(nala).
female(tazama).


parent(ardhi, uru).
parent(mohatu, uru).

parent(ajabu, zira).
parent(uru, zira).

parent(uru, scar).
parent(ahadi, scar).
parent(uru, mufasa).
parent(ahadi, mufasa).

parent(hasani, sarabi).
parent(adamma, sarabi).
parent(hasani, naanda).
parent(adamma, naanda).
parent(hasani, dwala).
parent(adamma, dwala).
parent(hasani, diku).
parent(adamma, diku).

parent(masud, upepo).
parent(amina, upepo).
parent(masud, sarafina).
parent(amina, sarafina).
parent(masud, kijani).
parent(amina, kijani).

parent(lateef, tama).
parent(mandisa, tama).

parent(wazimu, nuka).
parent(zira, nuka).
parent(wazimu, shabaha).
parent(zira, shabaha).

parent(scar, chumvi).
parent(naanda, chumvi).
parent(scar, kula).
parent(naanda, kula).

parent(scar, safura).
parent(dwala, safura).

parent(scar, tazama).
parent(sarafina, tazama).

parent(mufasa, simba).
parent(sarabi, simba).
parent(mufasa, mega).
parent(sarabi, mega).

parent(dwala, deka).
parent(kijani, deka).

parent(diku, mtoto).
parent(upepo, mtoto).

parent(sarafina, nala).
parent(sarafina, mheetu).

parent(simba, kiara).
parent(nala, kiara).
parent(simba, kopa).
parent(nala, kopa).
parent(simba, kion).
parent(nala, kion).


mates(ardhi, mohatu).
mates(hasani, adamma).
mates(masud, amina).
mates(lateef, mandisa).
mates(mufasa, sarabi).
mates(diku, upepo).
mates(dwala, kijani).
mates(tama, chumvi).
mates(kula, malka).
mates(simba, nala).
mates(safura, tojo).


breaked(ajabu, uru).
breaked(uru, ahadi).
breaked(wazimu, zira).
breaked(scar, naanda).
breaked(scar, dwala).
breaked(scar, sarafina).



married(X, Y) :- mates(X, Y); mates(Y, X).
divorced(X, Y) :- breaked(X, Y); breaked(Y, X).

wife(X, Y) :- female(X), married(X, Y).
husband(X, Y) :- male(X), married(X, Y).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).
grandchild(X, Y) :- grandparent(Y, X).
grandson(X, Y) :- male(X), grandchild(X, Y).
granddaughter(X, Y) :- female(X), grandchild(X, Y).

father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
child(X, Y) :- parent(Y, X).
son(X, Y) :- male(X), child(X, Y).
daughter(X, Y) :- female(X), child(X, Y).

son_in_law(X, Y) :- married(X, Z), daughter(Z, Y).
daughter_in_law(X, Y) :- married(X, Z), son(Z, Y).

siblings(X, Y) :- child(X, Z), child(Y, Z).
brother(X, Y) :- male(X), siblings(X, Y).
sister(X, Y) :- female(X), siblings(X, Y).

brother_in_law(X, Y) :- married(X, Z), sister(Z, Y).
sister_in_law(X, Y) :- married(X, Z), brother(Z, Y).

auntuncle(X, Y) :- siblings(X, Z), parent(Z, Y).
aunt(X, Y) :- female(X), auntuncle(X, Y).
uncle(X, Y) :- male(X), auntuncle(X, Y).
cousin(X, Y) :- child(X, Z), auntuncle(Z, Y).
niece(X, Y) :- female(X), cousin(X, Y).
nephew(X, Y) :- male(X), cousin(X, Y).