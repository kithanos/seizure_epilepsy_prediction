
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
	    echo entrando na pasta: janelas
            cd janelas
	    narq=`find . -maxdepth 1 -type f | wc -l`
    
	    for arq in j*_*
	    do
		echo encontrou arquivo $arq
		if [ "$narq" -gt "999" ];
		then
		    novoArq=$(echo "$pasta_1"_"$narq".txt)
		elif [ "$narq" -gt "99" ];
		then
		    novoArq=$(echo "$pasta_1"_"0$narq".txt)
		elif [ "$narq" -gt "9" ];
		then
		    novoArq=$(echo "$pasta_1"_"00$narq".txt)
		else 
		    novoArq=$(echo "$pasta_1"_"000$narq".txt)
		fi
		mv $arq $novoArq
		narq=$((narq-1))
	    done

	#echo número de arquivos: $narq
	cd ..
	pwd
	cd ..
	pwd
	#cd ..
	done
	cd ..
    done
cd ..
done
cd ..
pwd

