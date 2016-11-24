#! /bin/sh
>allInstructions.txt
>output.txt
while read line; do           
	echo $line | grep -v "^\." | grep -v ":$">>allInstructions.txt  
done < probl.s

echo 'Nr total instructiuni: '>>output.txt
total=0
while read line; do           
	total=`expr $total + 1` 
done < allInstructions.txt
echo `expr $total`>>output.txt

echo 'Nr total instructiuni de transfer de date:'>>output.txt
in_transfer=`grep -E "mov" allInstructions.txt | wc -l`
echo `expr $in_transfer`>>output.txt

echo 'Nr total instructiuni aritmetice: '>>output.txt
add=`grep -E "^add" allInstructions.txt| wc -l`
sub=`grep -E "^sub" allInstructions.txt|wc -l`
inc=`grep -E "^inc" allInstructions.txt|wc -l`
dec=`grep -E "^dec" allInstructions.txt|wc -l`
in_arit=`expr $add + $sub`
in_arit=`expr $in_arit + $inc`
in_arit=`expr $in_arit + $dec`
echo `expr $in_arit`>>output.txt

echo 'Nr total instructiuni de salt:'>>output.txt
in_salt=`grep -E "^j[a-zA-Z ]*\." allInstructions.txt | wc -l`
echo `expr $in_salt`>>output.txt

echo 'Alte instructiuni:'>>output.txt
others=`expr $total - $in_transfer`
others=`expr $others - $in_arit`
others=`expr $others - $in_salt`
echo `expr $others`>>output.txt