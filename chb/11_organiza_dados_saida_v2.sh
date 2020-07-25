
#!bin/bin/bash

cd Dados
pwd

for pasta in chb**
do
    echo entrando na pasta: $pasta
    cd $pasta

    for pasta1 in v_chb**
    do
	echo entrando na pasta: $pasta1
	cd $pasta1

	for arq in v_chb*_*.ascii
	do
	    #nomeArq=$(echo $nomeArq | sed 's/\.txt//')
	    nome_pasta=$(echo $arq | sed 's/\.ascii//')
	    echo Criando pasta $nome_pasta
	    mkdir $nome_pasta
	    mv "$arq" "$nome_pasta"
	done
    cd ..
    done
	
    cd ..
    #cd ..
done

cd ..
pwd

