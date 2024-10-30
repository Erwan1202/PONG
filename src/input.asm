.section .text
.global handle_input

handle_input:
    # Lire l'entrée utilisateur (e.g., touches haut/bas pour les paddles)
    call get_key_press

    # Vérifier si la touche pour monter le paddle gauche est enfoncée
    cmpl    %eax, $UP_KEY_LEFT
    je      move_paddle_left_up

    # Vérifier si la touche pour descendre le paddle gauche est enfoncée
    cmpl    %eax, $DOWN_KEY_LEFT
    je      move_paddle_left_down

    # Vérifier si la touche pour monter le paddle droit est enfoncée
    cmpl    %eax, $UP_KEY_RIGHT
    je      move_paddle_right_up

    # Vérifier si la touche pour descendre le paddle droit est enfoncée
    cmpl    %eax, $DOWN_KEY_RIGHT
    je      move_paddle_right_down

    ret

move_paddle_left_up:
    # Code pour déplacer le paddle gauche vers le haut
    ret

move_paddle_left_down:
    # Code pour déplacer le paddle gauche vers le bas
    ret

move_paddle_right_up:
    # Code pour déplacer le paddle droit vers le haut
    ret

move_paddle_right_down:
    # Code pour déplacer le paddle droit vers le bas
    ret
