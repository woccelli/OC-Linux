#!/bin/bash
# ./langstat.sh nomDictionnaire [-w]
# L'option -w permet de compter le nombre de mots commençant par chaque lettre

#Vérification des paramètres
if [ $# -eq 0 ]
then
	echo "Veuillez ajouter le nom du fichier à analyser."
	exit
elif [ $# -eq 1 ] && [ -f $1 ]
then
	fichierAnalyse=$1
	optionW="FALSE"
elif [ $# -eq 2 ]
then
	if [ $1 = "-w" ] && [ -f $2 ]
	then
		fichierAnalyse=$2
		optionW="TRUE"
	elif [ $2 = "-w" ] && [ -f $1 ]
	then
		fichierAnalyse=$1
		optionW="TRUE"
	else
		echo "Le fichier spécifié n'existe pas ou l'option est incorrecte."
		exit
	fi
fi
echo "Fichier $fichierAnalyse trouvé, début de l'analyse..."
echo '' > "resultat.txt"
for x in {A..Z}
do
	if [ $optionW = TRUE ]
	then
		cut -c1 $fichierAnalyse | tr -cd "$x" | echo "$(wc -c) - $x" >> "resultat.txt"  
	else
		cat $fichierAnalyse | tr -cd "$x" | echo "$(wc -c) - $x" >> "resultat.txt"
	fi
done
#Tri des résultats obtenus par lettre
awk NF "resultat.txt" | sort -gr 
#Suppression des fichiers temporaires
rm "resultat.txt"
