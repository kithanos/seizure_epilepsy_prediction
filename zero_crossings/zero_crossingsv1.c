#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void main( int argc, char **argv )
{
  FILE *arq;
  char Linha[100];
  char nomearquivo[100];
  nomearquivo [ 0 ] = 0;
  char *result;
  int i,n;
  float dado[4096];
  int zerocrossings=0;
  
  strcpy( nomearquivo, argv[ 1 ] );

  arq = fopen(nomearquivo, "rt");


  /* if (strlen(nomearquivo) == 0)
  {
    printf("Faltou: %c\n",nomearquivo);
    return;
  }
  */

  if (arq == NULL)  
  {
    printf("Problemas na abertura do arquivo\n");
    return;
  }

  i = 1;
  while (!feof(arq))
  {
    result = fgets(Linha, 100, arq); 
    dado[i] = atof(Linha);

    if (result)
    { 
      //printf("%f",Linha);

      if(i>1)
      {
	//printf("Anterior=%f, Atual=%f\n",dado[i-1],dado[i]);
	if((dado[i-1]*dado[i])<0)
	{
	  zerocrossings++;
	}

      }
      i++;
    }
    
  }
  
  fclose(arq);
  printf("%d\n",zerocrossings);
}

