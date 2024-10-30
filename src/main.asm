.section .data
welcome_msg:    .asciz "Bienvenue dans Pong! Appuyez sur une touche pour commencer.\n"
score_msg:      .asciz "Score: %d\n"
win_msg:        .asciz "Vous avez gagné!\n"
lose_msg:       .asciz "Vous avez perdu.\n"

.section .bss
score:          .int 0
ball_x:         .int 5      # Position initiale X de la balle
ball_y:         .int 5      # Position initiale Y de la balle
ball_dx:        .int 1      # Direction X de la balle (+1 vers la droite, -1 vers la gauche)
ball_dy:        .int 1      # Direction Y de la balle (+1 vers le bas, -1 vers le haut)
paddle_left_y:  .int 5      # Position Y du paddle gauche
paddle_right_y: .int 5      # Position Y du paddle droit

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
    # Affiche les éléments du jeu (balle et paddles)
    # Dessiner le paddle gauche
    call draw_paddle_left
    # Dessiner le paddle droit
    call draw_paddle_right
    # Dessiner la balle
    call draw_ball
    ret

draw_paddle_left:
    # Code pour afficher le paddle gauche à paddle_left_y
    # Utilise l'architecture ou le système d'affichage disponible
    ret

draw_paddle_right:
    # Code pour afficher le paddle droit à paddle_right_y
    ret

draw_ball:
    # Code pour afficher la balle à ball_x et ball_y
    ret

handle_input:
    # Gérer les touches haut et bas pour les deux paddles
    # Lecture de l'entrée utilisateur (hypothétique fonction `get_key_press`)
    call get_key_press
    
    # Contrôle du paddle gauche
    cmpl    %eax, $UP_KEY_LEFT
    je      move_paddle_left_up
    cmpl    %eax, $DOWN_KEY_LEFT
    je      move_paddle_left_down

    # Contrôle du paddle droit
    cmpl    %eax, $UP_KEY_RIGHT
    je      move_paddle_right_up
    cmpl    %eax, $DOWN_KEY_RIGHT
    je      move_paddle_right_down
    ret

move_paddle_left_up:
    # Déplace le paddle gauche vers le haut
    subl    $1, paddle_left_y
    ret

move_paddle_left_down:
    # Déplace le paddle gauche vers le bas
    addl    $1, paddle_left_y
    ret

move_paddle_right_up:
    # Déplace le paddle droit vers le haut
    subl    $1, paddle_right_y
    ret

move_paddle_right_down:
    # Déplace le paddle droit vers le bas
    addl    $1, paddle_right_y
    ret

game_logic:
    # Met à jour la position de la balle
    call update_ball_position

    # Vérifie les collisions avec les murs
    call check_wall_collision

    # Vérifie les collisions avec les paddles
    call check_paddle_collision

    # Met à jour le score si nécessaire
    call update_score
    ret

update_ball_position:
    # Mettre à jour la position de la balle en fonction de ball_dx et ball_dy
    addl    ball_dx, ball_x
    addl    ball_dy, ball_y
    ret

check_wall_collision:
    # Si la balle touche le mur supérieur ou inférieur, inverser la direction verticale
    cmpl    $0, ball_y            # Mur supérieur
    jl      invert_vertical
    cmpl    $10, ball_y           # Mur inférieur
    jg      invert_vertical
    ret

invert_vertical:
    # Inverse la direction de la balle sur l'axe Y
    negl    ball_dy
    ret

check_paddle_collision:
    # Si la balle touche le paddle gauche ou droit, inverser la direction horizontale
    # (Hypothèse que ball_x représente la position en X)
    cmpl    $0, ball_x            # Paddle gauche
    je      invert_horizontal
    cmpl    $80, ball_x           # Paddle droit (hypothétique largeur du jeu)
    je      invert_horizontal
    ret

invert_horizontal:
    # Inverse la direction de la balle sur l'axe X
    negl    ball_dx
    ret

update_score:
    # Met à jour le score si un point est marqué
    ret
