#include <termios.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <getch.h>

int getch(){
      struct termios oldt, newt;
      int c;
      tcgetattr( STDIN_FILENO, &oldt );
      newt = oldt;
      newt.c_lflag &= ~ICANON;
      newt.c_lflag &= ~ECHO;
      tcsetattr( STDIN_FILENO, TCSANOW, &newt );
      c = getchar();
      tcsetattr( STDIN_FILENO, TCSANOW, &oldt );
      return c;
}
