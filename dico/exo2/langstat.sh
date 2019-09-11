#!/bin/bash
declare -A tab
declare -a tabl

if [ -z "$2" ]
then
	if [ -z "$1" ]; 
	then 
		echo "Il n'existe pas de paramètres pour prendre en charge le dictionnaire" 
	elif [ ! -e $1 ]
	then
		echo "Le fichier dictionnaire n'existe pas a l'emplacement indiqué"
	else
		for letter in 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z';
		do
			tab[${#tab[$letter]}]=`grep -c $letter $1`
			echo $tab - $letter >> tosort.txt	
		done

		cat tosort.txt | sort -nr

		rm tosort.txt
	fi
fi
