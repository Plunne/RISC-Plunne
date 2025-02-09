# III. RISCP - LES MICRO-PROCESSEURS

Coucou! 👋

Maintenant que nous savons ce qu'est une [instruction](2_RISCP.md), je vais vous expliquer le fonctionnement d'un micro-processeur. (Cet article est voue a evoluer)


## 3.1 - Qu'est-ce qu'un CPU?

Si nous parlons de sciences de l'informatique, ce n'est pas sans raison, l'informatique est grandement inspiree de la medecine et l'anatomie servira de reference dans mes explications car c'est la metaphore que je prefere pour comprendre le fonctionnement d'un systeme informatique.

Le micro-processeur c'est le coeur de notre systeme, c'est lui qui traitre les informations, les calculs et gere l'interaction entre les composants d'un systeme.

Ces informations, dans un corps humain s'apparenteraient a notre memoire, et ca tombe bien vu que c'est aussi le terme employe dans l'informatique.

L'interaction entre les composants c'est le circuit electronique qui le permet, dans un corps humain cela s'apparente aux muscles qui derriere font bouger les membres qui dans notre cas sont appelles peripheriques (d'entrees/sorties).

Notre corps a besoin de memoire pour reflechir quoi faire. Par exemple pour lever le bras droit, notre cerveau sait qu'il faut lever lever le bras, il a l'idee en memoire, il indique donc au coeur qu'il faut lever le bras, puis le coeur lui il voit comment le faire et fait donc circuler le sang dans les muscles de sorte a ce que le bras se leve.

Bien, de ce fait, dans notre systeme, nous avons en memoire une instruction pour indiquer au CPU quelle action effectuer, enfin le CPU execute ces actions.

> **Exemple :**
> 1. Instruction d'allumer une LED stockee en memoire
> 2. La memoire indique au CPU d'allumer une LED
> 3. Le CPU execute la fonction d'allumer une LED
> 4. La LED s'allume

## 3.2 - Pipeline CPU

La pipeline c'est ce qui definit les differentes etapes du deroulement.

Vous remarquerez ci-dessus que cela se passe en 4 temps. Dans la pratique un 5 eme temps s'ajoute.

Un CPU se compose toujours a minimat de 5 grande phases.

1. **IF :** INSTRUCTION FETCH
2. **ID :** INSTRUCTION DECODE
3. **EX :** EXECUTE
4. **MEM :** MEMORY ACCES
5. **WB :** WRITE-BACK

`IF` -> `ID` -> `EX` -> `MEM` -> `WB`

> *Il est frequent de diviser certaines etapes pour les alleger en en rajoutant des nouvelles.*

## 3.3 - Architecture CPU

Pour realiser une pipeline, il faut que le CPU dispose de certains composants.

### 3.3.1 - Instruction Memory

L'Instruction Memory c'est l'unite qui gere le stockage des instructions a effectuer.

Elle est constituee d'une interface de communication pour piocher les instructions dans la memoire ou se situe le programme. *(Phase : Instruction Fetch)*

Pour accelerer le tout, elle stocke une certaine quantite d'instructions dans un buffer afin d'en avoir toujours a disposition sans devoir attendre la recuperation a chaque fois.

### 3.3.2 - Program Counter

Le Program Counter (PC) stocke l'adresse de l'instruction a executer.

Il dispose d'un systeme d'incrementation qui met a jour l'adresse ainsi qu'un systeme premettant de la modifier a la volee.

### 3.3.3 - Instruction Decoder

L'Instruction Decoder recupere l'instruction indiquee par le PC et separe son contenu et le repartit aux differentes parties correspondantes pour les distribuer aux unites du CPU qui en ont besoin. *(Phase : Instruction Decode)*

### 3.3.4 - Register File

Le Register File est une memoire dans le CPU contenant des registres dont le CPU se sert pour mettre de cote des donnees pour les reutiliser lorsqu'il effectue ses operations.

De maniere generale, la taille de cette memoire est identique a celle des registres qu'elle contient.

Cette taille depent de l'ISA du CPU.

Dans notre cas avec l'ISA RV32i, notre CPU contient 32 registres de 32 bits.

Ces registres ont chacun un usage approprie definit par l'architecture.

### 3.3.5 - Arithmetic Logical Unit

L'Arithmetic Logical Unit (ALU), est l'unite qui effectue les operations. C'est a l'interieur de celle-ci que resident les fonctions de calcul du micro-processeur.

Elle prend en entree 2 valeurs (donnees) accompagnees de quoi selectionner l'operation a effectuer et ressort le resultat en sortie. *(Phase : Execute)*

Des drapeaux (flags) sont geres par celle-ci, notamment pour les retenues.

### 3.3.6 - Data Memory

La Data Memory a l'inverse de l'Instruction Memory retourne le resultat dans la memoire de donnee en sortie du CPU.

Elle est donc egalement constituee d'une interface de communication pour renvoyer les resultats en memoire. *(Phase : Memory Access)*

En meme temps, elle retourne le resultat dans le Register File pour mettre a jour le registre de destination. *(Phase : Write-Back)*

## CONCLUSION

Vous savez a present comment fonctionne un micro-processeur dans les grandes lignes. Il existe d'autres petits composants a l'interieur d'un CPU qui permet de le faire fonctionner integralement mais il est trop tot pour en discuter, pour l'instant je souhaitais aborder les micro-processeurs de maniere synthetique pour que ce soit plus digeste. A bientot! 😊

-----
[`RISC-Plunne`](https://github.com/Plunne/RISC-Plunne) [`<< Precedent`](2_RISCP.md) [`Revenir au blog`](README.md)
