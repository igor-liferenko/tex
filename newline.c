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

  termios.c_lflag |= ECHO | ICANON;
  tcsetattr(STDOUT_FILENO, TCSANOW, &termios);
  return 0;
}
