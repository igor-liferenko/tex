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
  char c, row[4], *rp, col[4], *cp;
reset1:
  read(STDIN_FILENO, &c, 1);
reset2:
  if (c != '\e') goto reset1;
  read(STDIN_FILENO, &c, 1);
  if (c != '[') goto reset2;
  row[0] = row[1] = row[2] = row[3] = 0;
  rp = row;
row:
  read(STDIN_FILENO, &c, 1);
  if (c >= '0' && c <= '9') { *rp++ = c; goto row; }
  if (c != ';') goto reset2;
  if (rp == row) goto reset1;
  col[0] = col[1] = col[2] = col[3] = 0; 
  cp = col;
col:
  read(STDIN_FILENO, &c, 1);
  if (c >= '0' && c <= '9') { *cp++ = c; goto col; }
  if (c != 'R') goto reset2;
  if (cp == col) goto reset1;
  termios.c_lflag |= ECHO | ICANON;
  tcsetattr(STDOUT_FILENO, TCSANOW, &termios);
  if (col[1] != 0 || col[0] != '1') write(STDOUT_FILENO, "\n", 1);
  return 0;
}
