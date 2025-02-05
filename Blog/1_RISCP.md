# I. RISCP - LE COMMENCEMENT

Coucou! 👋

Voila, c'est parti, je commence le projet de mon CPU RISC-V, aujourd'hui je vais vous partager les premieres etapes qui m'ont permis de me lancer. (Il se peut que je reedite par la suite pour corriger ou affiner)

## 1.1 - Qu'est ce que RISC-V?

En premier lieu avant de se lancer dans un tel projet il est important de comprendre qu'est-ce que RISC-V.

RISC-V est une architecture de micro-processeurs cree en 2013 par l'Universite de Berkeley. Son role est de definir les differentes unites a l'interieur de ces derniers et leurs interactions. On reviendra plus en detail la dessus une prochaine fois.

Comme l'objectif est de faire tourner des programmes sur un micro-processeur il faut definir un langage qu'il puisse interpreter.

## 1.2 - Le jeu d'instructions

Le langage definit par l'Uni de Berkeley est un langage d'assembleur. Un langage d'assembleur fonctionne avec des instructions dont l'ensemble s'appelle un jeu d'instructions plus communement appelle un ISA pour Instruction Set Architecture en anglais.

RISC-V propose plusieures ISA, des ISA en 32 bits et d'autres en 64 bits (respectivement RV32 & RV64). Ces ISA peuvent s'entendre a l'aide d'extensions, les extensions sont des instructions supplementaires.

Ici nous allons realiser l'architecture la plus simple, celle avec le minimum d'instructions definies par RISC-V, l'ISA RV32I. Le I veut dire Integer, plus exactement il precise qu'il s'agit du set de base ou les instructions sont en integer.

> Je prefere ne pas vous perdre avec les autres ISA RISC-V, il existe RV32M qui rajoute les operation de multiplication, RV32F pour les flottants, RV32D pour flottants doubles, et bien d'autres.

## CONCLUSION

Je vais parler brievement de 2 grosses parties importantes dans le monde des architectures de CPU, nous iront plus en detail dans une prochaine partie, en attendant j'espere que cela vous plait. 😊

-----
[`RISC-Plunne`](https://github.com/Plunne/RISC-Plunne) [`Revenir au blog`](README.md) [`Suivant >>`](2_RISCP.md)
