#!/bin/bash

echo -e "Bonjour ! Ce fichier accepte deux paramètres ('dico.txt' et 'alpha')"

#Mission 1 : combien de fois est utilisée chaque lettre ?
#On vérifie que le fichier est présent
if [ -z $1 ]; then
    echo -e "\nErreur : Vous n'avez pas fourni de paramètre au programme\nRelancez le programme avec le fichier dictionnaire en paramètre.\n"
    exit

# Vérifier l'existance du fichier passé en paramètre
elif ! [ -e $1 ]; then
    echo -e "\nErreur : Le fichier dictionnaire passé en paramètre n'existe pas.\nRelancez le programme avec le fichier dictionnaire correcte.\n"
    exit

# Si le paramètre fourni n'est pas un vrai fichier
elif ! [ -f $1 ]; then
    echo -e "\nErreur : Le paramètre doit être un vrai fichier(non un dossier).\nRelancez le programme avec le fichier dictionnaire correcte.\n"
    exit

# Si le fichier fourni n'est pas lisible
elif ! [ -r $1 ]; then
    echo -e "\nErreur : Le fichier fourni en paramètre n'est pas pas lisible.\n"
    exit

# Si tout va bien
else
    # Tableau des lettres de l'Alphabet
    alphabet=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")

    # Creation d'un fichier temporaire statistique toujours vide a chaque execution, le touch viens te rajouter du contenu si le fichier est vide !!!
    echo -n > statistique

    # On parcours le tableau des lettres de l'alphabet
    for lettre in ${alphabet[@]}; do

        # On compte le mots qui utilise la lettre
        nbre_com=`grep -i $lettre $1 | wc -l`

        # Je formate la ligne et l'ajoute à mon fichier statistique
        echo -e "$nbre_com - $lettre" >> statistique
    done

    printf "\nMission 1 : combien de fois est utilisée chaque lettre ?\n"
    # Tu tries simplement ton resultat pas de less il te lance un prompt c est agacant !!!
    sort -nr statistique

    printf "\nMission 2 : Trier par ordre alphabétique\n"

    # Mission 2 : Trier par ordre alphabétique
    if [ -z $2 ]; then
        echo -e "\nvous n'avez pas fourni de second paramètre.\n"
        exit

    # si le deuxième paramètre existe et qu'il est différent de alpha
    elif [ $2 != "alpha" ]; then
        echo -e "\nErreur : Ce programme ne reconnait pas le deuxième paramètre fourni : $2 .\n"
        exit

    # Le deuxième paramètre est alpha
    else
        #On tri par ordre alphbétique sur la 3éme colonne (la colonne des lettres)
        sort -k3d statistique
    fi

    # Je détruit le fichier statistique temporaire
	  rm -f statistique

fi