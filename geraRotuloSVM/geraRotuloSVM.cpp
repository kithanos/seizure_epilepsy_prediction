// Recebe número limite N e gera série de 0 até (N-1).

#include <iomanip>
#include <iostream>
#include <stdlib.h>
#include <unistd.h>

using namespace std;

int main( int argc, char **argv ) {
  int c1=-1,c2=-1;
  int opcaoGetopt;

  while( ( opcaoGetopt = getopt( argc, argv, "a:b:" ) ) != -1 )
    
    switch( opcaoGetopt ) {
    case 'a':
      c1 = atoi(optarg);
      break;
    case 'b':
      c2 = atoi(optarg);
      break;
    }
  
  /* cout << "Digite quantidade de dados da classe 1: ";
  cin >> classe1;

  cout << "Digite quantidade de dados da classe 2: ";
  cin >> classe2;*/

  
  for( int i = 1; i <= c1; i++ ) {
    cout << "2" << endl;
  }

  for( int i = 1; i <= c2; i++ ) {
    cout << "1" << endl;
  }
  
  return 0;
}
