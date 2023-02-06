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
  char b, row[1], *rowp, col[1], *colp;
reset1:
  read(STDIN_FILENO, &b, 1);
reset2:
  if (b != '\e') goto reset1;
  read(STDIN_FILENO, &b, 1);
  if (b != '[') goto reset2;
  rowp = row;
row:
  read(STDIN_FILENO, &b, 1);
  if (b >= '0' && b <= '9') { if (rowp == row) *row = b; rowp++; goto row; }
  if (b != ';') goto reset2;
  if (rowp == row) goto reset1;
  colp = col;
col:
  read(STDIN_FILENO, &b, 1);
  if (b >= '0' && b <= '9') { if (colp == col) *col = b; colp++; goto col; }
  if (b != 'R') goto reset2;
  if (colp == col) goto reset1;
  termios.c_lflag |= ECHO | ICANON;
  tcsetattr(STDOUT_FILENO, TCSANOW, &termios);
  if (colp != col + 1 || *col != '1') write(STDOUT_FILENO, "\n", 1);
  return 0;
}
