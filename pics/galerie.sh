#!/bin/bash
#
#Verification des parametres et affectation des variables
if [ $# -eq 2 ]
then 
	html_name=$1
	dir_name=$2
elif [ $# -eq 1 ]
then
	html_name=$1
	dir_name="./"
else
	html_name="galerie.html"
	dir_name="/home/woccelli/pics"
fi
echo "html_name: $html_name" 
echo "dir_name: $dir_name"
echo "Redirecting to $dir_name ..."
cd "$dir_name"

#Creation du fichier html affichant les miniatures des images
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
	<head>
		<title>Ma galerie</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css">
		a img { border:0; }
		</style>
	</head>
	<body>
		<p>' > $html_name
#Creation des miniatures dans un sous-dossier
rm -r "./thumbnails/"
mkdir "./thumbnails/"
for i in *.jpg; do
	convert "$i" -thumbnail 100 "./thumbnails/$i"
	echo '			<a href="'$i'"><img src="thumbnails/'$i'" alt="" /> </a> '>> $html_name
done
echo '		</p>
	</body>
</html>' >> $html_name
