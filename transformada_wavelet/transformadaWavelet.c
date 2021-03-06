/* Para compilá-lo: */
/* gcc -Wall -I/usr/local/include -c transformadaWavelet.c */
/* gcc -L/home/lucas/gsl/lib transformadaWavelet.o -lgsl -lgslcblas -lm -o transformadaWavelet */

/* Modo de uso: */
/* ./transformadaWavelet -d dadosParaComWavelet.ascii -n 256 */

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h> // para getopt(...)
#include <gsl/gsl_sort.h>
#include <gsl/gsl_wavelet.h>

int main( int argc, char **argv ) {
  char nomeArqDadosEntrada[ 100 ];
  int i, numAmostras, opcaoGetopt;
  while( ( opcaoGetopt = getopt( argc, argv, "d:n:" ) ) != -1 ) {
    switch( opcaoGetopt ) {
    case 'd': // arquivo com dados de entrada
      strcpy( nomeArqDadosEntrada, optarg );
      break;
    case 'n':
      numAmostras = atoi( optarg );
      break;
    }
  }
  double *data = malloc( numAmostras * sizeof( double ) );
  FILE * f;
  gsl_wavelet *w;
  gsl_wavelet_workspace *work;
  w = gsl_wavelet_alloc( gsl_wavelet_haar, 2 );
  work = gsl_wavelet_workspace_alloc( numAmostras );
  f = fopen( nomeArqDadosEntrada, "r" );
  for( i = 0; i < numAmostras; i++ ) {
    fscanf( f, "%lg", &data[ i ] );
  }
  fclose( f );
  gsl_wavelet_transform_forward( w, data, 1, numAmostras, work );
  for( i = 0; i < numAmostras; i++ ) {
    printf( "%g\n", data[ i ] );
  }
  gsl_wavelet_free( w );
  gsl_wavelet_workspace_free( work );
  free( data );
  return 0;
}
