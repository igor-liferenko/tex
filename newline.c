/* http://tug.org/texmfbug/nobug.html#ttynl */

#include <termios.h>
#include <unistd.h>

int main(void)
{
  if (!isatty(STDIN_FILENO) || !isatty(STDOUT_FILENO)) return 0;
  struct termios termios;
  tcgetattr(STDIN_FILENO, &termios);
  termios.c_lflag &= ~(ECHO | ICANON);
  tcsetattr(STDOUT_FILENO, TCSANOW, &termios);
  write(STDOUT_FILENO, "\e[6n", 4);
  char row[4], col[4];
  row[0] = row[1] = row[2] = row[3] = 0;
  col[0] = col[1] = col[2] = col[3] = 0;
  read(STDIN_FILENO, ...
  if (col[1] != 0 || col[0] != '1') write(STDOUT_FILENO, "\n", 1);
  termios.c_lflag |= ECHO | ICANON;
  tcsetattr(STDOUT_FILENO, TCSANOW, &termios);
  return 0;
}
