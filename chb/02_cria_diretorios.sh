#Script que acessa uma sequencia de arquivos (.ascii), cria pastas com o nome desse arquivos e os move para elas, tirando o .ascii de cada um deles

#!/bin/bash

cd Dados
pwd

for pasta in chb**
do
    echo entrando na pasta: $pasta
    cd $pasta

    for pasta1 in chb*_*
    do
	echo entrando na pasta: $pasta1
	cd $pasta1

	for arq in chb*_*.ascii
	do
	    echo econtrou arquivo: $arq
	    nomeDir=$(echo c_$arq | sed 's/\.ascii//')
	    mkdir $nomeDir
	    mv $arq $nomeDir
	done
    cd ..
    done
    
cd ..

done

cd ..
pwd
