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
  char b, col, r, c;
reset1:
  read(STDIN_FILENO, &b, 1);
reset2:
  if (b != '\e') goto reset1;
  read(STDIN_FILENO, &b, 1);
  if (b != '[') goto reset2;
  r = 0;
row:
  read(STDIN_FILENO, &b, 1);
  if (b >= '0' && b <= '9') { r = 1; goto row; }
  if (b != ';') goto reset2;
  if (!r) goto reset1;
  c = 0;
col:
  read(STDIN_FILENO, &b, 1);
  if (b >= '0' && b <= '9') { if (!c) col = b; c++; goto col; }
  if (b != 'R') goto reset2;
  if (!c) goto reset1;
  termios.c_lflag |= ECHO | ICANON;
  tcsetattr(STDOUT_FILENO, TCSANOW, &termios);
  if (c != 1 || col != '1') write(STDOUT_FILENO, "\n", 1);
  return 0;
}
