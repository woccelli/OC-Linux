#!/bin/bash
#pour mon second parametre, l'idée est de faire la même chose mais avec la possibilité d'indiquer les lettres que je souhaite comptabiliser
#par exemple : ./langstat.sh dico.txt A,H,Z  : fera la même chose mais juste pour les lettre A, H et Z
if [ -n "$1" ]
then
		if [ ! -f "$1" ]
		then
			echo "le fichier $1 n'existe pas"
		else
			if [ -z "$2" ]
			then		
				for i in {A..Z}
				do
					printf "%6s - %s\n" "$(grep -c $i $1)" "${i}"
				done | sort -rnk1
			else	 
				IFS=','
				read -ra ADDR <<< "${2}" 
				for i in "${ADDR[@]}"
				do
					printf "%6s - %s\n" "$(grep -c $i $1)" "${i}"
				done | sort -rnk1
				IFS=' '
			fi
		fi
else
	echo "Veuillez indiquer votre fichier"
fi

