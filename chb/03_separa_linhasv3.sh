
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

	for pasta_1 in c_chb*_*
	do
	    echo entrando na pasta: $pasta_1
	    cd $pasta_1
	    nomePasta=$(echo janelas)
	    mkdir $nomePasta

	    for arq in chb*_*.ascii
	    do
		nomeArq=$(echo j_"$arq"_)
		nomeArq=$(echo $nomeArq | sed 's/\.ascii//')
		echo encontrou arquivo $arq
		#grep -c . $arq
		nlinhas=`grep -c . $arq`
		echo numero de linhas: $nlinhas
		
		#Define o numero de janelas do seu arquivo, aqui o numero 1024
		#siginifica que o arquivo tera janelas de 4 segundos
		#frequencia de amostragem = 256 hz*4=2014
		echo numero de arquivos que tem de ser gerados: $((nlinhas/1024))
		split -l 1024 $arq -d -a 4 $nomeArq 
		mv j_*_* janelas
	    done
	cd ..
	done

    cd ..
    done

cd ..
done

cd ..
pwd

