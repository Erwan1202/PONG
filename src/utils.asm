.section .text
.global clear_screen
.global get_key_press

clear_screen:
    # Code pour effacer l’écran, dépend de l’architecture et du système
    # Peut utiliser une boucle pour remplir l’écran d’espaces
    ret

get_key_press:
    # Code pour détecter la touche enfoncée
    # Peut dépendre d'appels système spécifiques ou d’interruptions
    # Met la touche pressée dans %eax
    ret
