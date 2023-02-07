#include <termios.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <getch.h>

int kbhit(){
      struct termios oldt, newt;
      int c;
      int oldf;    
      tcgetattr(STDIN_FILENO, &oldt);
      newt = oldt;
      newt.c_lflag &= ~(ICANON | ECHO);
      tcsetattr(STDIN_FILENO, TCSANOW, &newt);
      oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
      fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);    
      c = getchar();    
      tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
      fcntl(STDIN_FILENO, F_SETFL, oldf);    
      if(c != EOF) { ungetc(c, stdin); return 1; }    
      return 0;
}

