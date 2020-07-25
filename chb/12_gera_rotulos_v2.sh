
#!bin/bin/bash

#echo Etapa 10: Gerando rótulos

#Diretorio do qual se encontra o programa para gerar os rotulos do SOM
programa="/home/lucas/Documentos/Projetos/seizure_epilepsy_prediction/geraSerieNumerosConsecutivosTexto"

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

	for pasta2 in v_chb*_*
	do
	    echo entrando na pasta: $pasta2
	    cd $pasta2

	    for arq in v_chb*_*
	    do
		echo encontrou arquivo $arq
		nlinhas=`grep -c . $arq`
		echo numero de linhas: $nlinhas
		nome_vetor="rot_$arq".txt
		"$programa"/geraSerieNumerosConsecutivosTexto -n $nlinhas > "$nome_vetor"
	    done
	    cd ..
	done
	cd ..
	cd ..
    #cd ..
done


done		     
cd ..
pwd

