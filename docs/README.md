

# Pong en Assembleur

Ce projet est une implémentation du jeu **Pong** en **langage assembleur**, pour tous les nostalgiques des jeux rétro et les curieux d’optimisation de bas niveau. Initialement inspiré par un mélange de célibat et d'une vie sociale modeste, apprendre l'assembleur est devenu un projet passionnant (et chronophage) pour donner vie à Pong en partant de zéro.

## Fonctionnalités

- **Affichage de la balle et des paddles** : Les mouvements et les collisions sont gérés à la main, pixel par pixel.
- **Logique de jeu** : Le système détecte les collisions, gère les scores, et termine le jeu avec des messages personnalisés en cas de victoire ou de défaite.
- **Contrôle des paddles** : Les touches permettent de déplacer les paddles pour attraper la balle, avec un contrôle de chaque côté du terrain.

## Architecture

Le code est divisé en plusieurs fichiers pour mieux structurer chaque aspect du jeu :
- `main.asm` : Point d'entrée et boucle principale du jeu.
- `graphics.asm` : Gestion des graphismes (dessin de la balle, des paddles, etc.).
- `input.asm` : Gestion des entrées clavier pour le contrôle des paddles.
- `logic.asm` : Logique du jeu, y compris les collisions et la gestion des scores.
- `utils.asm` : Fonctions utilitaires pour le jeu.

## Compilation et Exécution

Un **Makefile** est fourni pour faciliter la compilation. Assurez-vous d'avoir un assembleur comme `nasm` et un éditeur de liens pour générer l'exécutable.

1. **Compiler** :
   ```bash
   make
   ```

2. **Exécuter** :
   L'exécutable `Pong.bin` sera généré dans le dossier `build`. Lancez-le pour commencer une partie.

3. **Nettoyage** :
   ```bash
   make clean
   ```

## Pourquoi l’Assembleur ?

Parfois, les motivations nous amènent vers des domaines de niche. Dans ce cas, c'est peut-être l'isolement et le célibat qui ont conduit à choisir l'assembleur comme projet. La solitude a ses bons côtés : plus de temps pour l’optimisation de la mémoire et des cycles processeurs ! On apprend ici à parler directement au cœur de la machine, là où chaque instruction a un rôle critique et calculé.
