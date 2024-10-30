.section .data
welcome_msg:    .asciz "Bienvenue dans Pong! Appuyez sur une touche pour commencer.\n"
score_msg:      .asciz "Score: %d\n"
win_msg:        .asciz "Vous avez gagné!\n"
lose_msg:       .asciz "Vous avez perdu.\n"

.section .bss
score:          .int 0

.section .text
.global _start

_start:
    # Afficher le message de bienvenue
    movl    $4, %eax               # syscall pour sys_write
    movl    $1, %ebx               # sortie standard
    movl    $welcome_msg, %ecx     # message de bienvenue
    movl    $42, %edx              # longueur du message
    int     $0x80

    # Initialiser le jeu
    call    init_game

main_loop:
    # Gestion de l'affichage
    call    render_frame

    # Gérer les entrées utilisateur
    call    handle_input

    # Logique de jeu (mouvement de la balle, collisions, etc.)
    call    game_logic

    # Condition de fin
    movl    score, %eax
    cmpl    $10, %eax              # Exemple de condition de victoire
    je      game_win

    jmp     main_loop

game_win:
    movl    $4, %eax               # syscall pour sys_write
    movl    $1, %ebx               # sortie standard
    movl    $win_msg, %ecx         # message de victoire
    movl    $15, %edx              # longueur du message
    int     $0x80
    jmp     end_game

game_over:
    movl    $4, %eax               # syscall pour sys_write
    movl    $1, %ebx               # sortie standard
    movl    $lose_msg, %ecx        # message de défaite
    movl    $14, %edx              # longueur du message
    int     $0x80
    jmp     end_game

end_game:
    # Sortir du programme proprement
    movl    $1, %eax               # syscall pour sys_exit
    xorl    %ebx, %ebx             # code de sortie 0
    int     $0x80

# -----------------------------------------------------
# Fonctions auxiliaires (logique, rendu, et entrée)
# -----------------------------------------------------

init_game:
    # Initialiser le score et tout autre élément de jeu ici
    movl    $0, score              # Réinitialise le score
    ret

render_frame:
    # Code pour dessiner la balle et les paddles
    # À adapter en fonction des instructions d’affichage de l’architecture cible
    ret

handle_input:
    # Code pour gérer les entrées utilisateur
    # Par exemple, lire les touches pour le déplacement des paddles
    ret

game_logic:
    # Logique du jeu : déplacement de la balle, collisions avec les murs/paddles, etc.
    # Met à jour le score en cas de points gagnés
    ret
