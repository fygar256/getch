#include <stdio.h>
#include <getch.h>

int main() {
  while(1) {
    if (kbhit()) {
        int key=getch();
        printf("%c",key);
        }
    }
}

