# II. RISCP - LES INSTRUCTIONS

Coucou! 👋

Apres cette premiere introduction sur l'architecture RISC-V, je vais vous parler plus en detail des instructions. (Cet article est voue a evoluer)

## 2.1 - Le langage machine

Dans la premiere partie [le commencement](1_RISCP.md), je vous avais explique qu'un micro-processeur interprete un langage et que ce langage dans notre cas etait un langage d'assembleur. Puis que ce langage etait concu selon un jeu d'instructions propre a une architecture.

En fait, ce n'est pas tout a fait vrai.

Notre micro-controleur, c'est un composant electronique et l'electronique c'est des signaux electriques.

Il a ete definit que nous communiquerions en laissant passer de l'electricite ou en la coupant. Soit en utilisant 2 etats, l'etat haut (presence de courant) et l'etat bas (absence de courant).

Ces etats sont stockes dans de la memoire numerique.

Pour representer cela de maniere lisible pour l'humain, nous utilisons une base numerique, la base 2, plus communement appellee binaire. Sans refaire un cours sur les bases numeriques, la ou nous utilisons la base decimale pour compter dans le quotidien, ici n'ayant besoin que de 2 valeurs possibles, nous representons l'etat haut par un `1` et l'etat bas par un `0`.

Le programme final a l'interieur du micro-processeur est donc une suite binaire.

## 2.2 - Les langages d'assembleur

Un langage d'assembleur quand a lui, dispose de mots-cles nous permettant d'ecrire le programme de maniere plus pratique sans avoir a ecrire le programme en entier bit par bit.

Ces mots cles dependent du jeu d'instruction du micro-processeur.

Il est donc important de prendre en compte le fait que chaque architecture de micro-processeur dispose de son propre langage d'assembleur. Par exemple, un processeur AMD Ryzen 2700X, base sur l'architecture AMD64 utilise le jeu d'instruction AMD64. Nous ne pouvons donc pas programmer ce micro-processeur avec notre jeu d'instruction RISC-V ou autre. Il en existe autant qu'il existe d'architecture, dans les plus communes nous retrouvons assez frequement l'architecture proprietaire ARM, tre rependue dans le milieu de l'embarque ; il s'agit du plus grand concurrent de RISC-V, d'ailleurs ces deux architectures sont basees sur l'architecture RISC.

## 2.3 - L'assemblage

Pour devenir une suite binaire, le langage d'assembleur a besoin d'etre traduit en binaire.

Cela se fait par l'intermediaire d'un assembleur, la aussi specifique a chaque architecture.

> *Pour la clarte du blog, j'utiliserai l'acronyme CPU pour Central Processing Unit, je considere que vous saviez deja de quoi il s'agit avant de lire ce blog.*

## 2.4 - Qu'est ce qu'une instruction?

Une instruction est une operation ordonnee au CPU pour lui indiquer quelle action il va devoir effectuer selon des parametres en entree pour obtenir un resultat.

Elle se compose d'un **OpCode**, il definit le type d'operation a effectuer et le format dont le processeur doit la decomposer.

L'objectif est de mettre a jour un emplacement memoire situe dans la CPU. Nous reviendrons plus tard sur les registres dits generaux. La partie **rd** pour registre de destination definit donc lequel de ces registre nous souhaitons mettre a jour.

Generalement, pour la majorite des instructions, nous retrouvons des precisions sur la fonction a appeller. La ou l'OpCode definit le type d'instruction, les parties **funct3** et/ou **funct7** designent laquelle des operations de ce type d'instruction le CPU doit effectuer.

> *Il existe des types d'instructions ne requierant pas de precision car ces derniers disposent d'un OpCode ne correspondant qu'a une seule et unique operation a part entiere. Dans ces cas particuliers, l'OpCode definit directement l'operation a effectuer.*

Il est bien pratique de pouvoir utiliser la valeur des registres-generaux contenant deja une donnee, alors nous les utilisons en tant que registres source, avec certaines instructions nous n'en avons besoin de qu'un (**rs1**) tandis que dans d'autres nous pouvons en avoir besoin de deux (**rs1** et **rs2**).

> *Et non ne me parlez pas de cette marque automobile de kekes prout prout pop and bang caca...*

Mais dans d'autres cas, nous souhaitons inserer directement une valeur ne provenant pas d'un registre, alors certaines instructions prenent en entree des valeurs immediates (**imm**) a la place des registres-generaux. *(Elles sont souvent notees d'un `i`)*

> **Quelques exemples d'instructions RV32I :**
> - `add` : `add` vient prendre en entree 1 registre de destination qui recevra le resultat de l'addition des deux autres registres renseignes. *(add rd, rs1, rs2 donne : rd = rs1 + rs2)*
> - `lui` : `lui` vient prendre en entree 1 registre de destination qui recevra comme valeur la deuxieme entree decalee de 12 bits vers la gauche. *(lui rd, \<valeur\> donne : rd = \<valeur\> << 12)*
> - `slr` : `slr` vient prendre en entree 1 registre de destination qui recevra comme valeur la valeur du registre renseigne dans la deuxieme entree decalee vers la droite en bits de la valeur du registre renseigne dans la troisieme entree. *(slr rd, rs1, rs1 donne : rd = rs1 >> rs2)* 


## CONCLUSION

Cet article a ete assez difficile a rediger, arriver a synthetiser, creer une trame narrative sans parler de tout en meme temps, trouver un moyen d'enchainer les divers aspects pour faire decouvrir le sujet progressivement n'etait pas une simple affaire, en tout cas j'espere que cela vous a plus, on commence a rentrer un peu plus dans les details, de plus en plus de termes viennent s'ajouter et ce n'est pas fini, le plus gros reste a venir, nous allons aller d'avantage dans les details mais il reste d'autres sujet a evoquer, prochainement je vais aborder le jeu d'instruction RV32I et le fonctionnement vulgarise d'un CPU car jusqu'a present je suis restee assez flou concernant l'interpretation des instructions par le processeur. A bientot! 😊

-----
[`RISC-Plunne`](https://github.com/Plunne/RISC-Plunne) [`<< Precedent`](1_RISCP.md) [`Revenir au blog`](README.md) [`Suivant >>`](3_RISCP.md)
