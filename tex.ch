TODO: see my_name in tex-sparc/initex.ch and add -format= option as in mytex/ and change bin/tex and /usr/local/bin/parse-first-line and post-install.sh
-----------------

withouth this setup-tarif.tex will not compile
@x
enum {@+@!buf_size=500@+}; /*maximum number of characters simultaneously present in
  current lines of open files and in control sequences between
  \.{\\csname} and \.{\\endcsname}; must not exceed |max_halfword|*/
@y
enum {@+@!buf_size=3000@+}; /*maximum number of characters simultaneously present in
  current lines of open files and in control sequences between
  \.{\\csname} and \.{\\endcsname}; must not exceed |max_halfword|*/
@z

this is necessary for lhplain format
@x
enum {@+@!font_mem_size=20000@+}; /*number of words of |font_info| for all fonts*/
@y
enum {@+@!font_mem_size=30000@+}; /*number of words of |font_info| for all fonts*/
@z

increase space for hyphenation patterns
@x
enum {@+@!trie_size=8000@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
@y
#ifdef INIT
enum {@+@!trie_size=14000@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
#else
enum {@+@!trie_size=12000@+}; /*space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX*/
#endif
@z

!!! if need more, change type of |name_length| from uint8_t to uint16_t in tex.w !!!
@x
enum {@+@!file_name_size=40@+}; /*file names shouldn't be longer than this*/
@y
enum {@+@!file_name_size=255@+}; /*file names shouldn't be longer than this*/
@z

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [3.37] rescanning the command line
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
@x
@ The following program does the required initialization
without retrieving a possible command line.
It should be clear how to modify this routine to deal with command lines,
if the system permits them.
@^system dependencies@>

@p bool init_terminal(void) /*gets the terminal input started*/
{@+
t_open_in;
@y
@ The following program does the required initialization
and also retrieves a possible command line.
@^system dependencies@>

@p bool init_terminal(int argc, char **argv)
{
  t_open_in;
  if (argc > 1) {
    last = first;
    for (int i = 1; i < argc; i++) {
      for (int k = 0; k < strlen(argv[i]); k++) {
        wchar_t wc;
        int len = mbtowc(&wc, argv[i]+k, MB_CUR_MAX);
        char mb[MB_CUR_MAX];
        if (wctomb(mb, wc) != len ||strncmp(mb, argv[i]+k, len) != 0)
        { fwprintf(stderr, L"Error in mbtowc()\n"); exit(1); }
        buffer[last++] = xord(wc);
        k += len - 1;
      }
      if (i < argc - 1) buffer[last++] = ' ';
    }
    loc = first;
    return true;
  }
@z

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [6.84] switch-to-editor option
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
@x
line ready to be edited. But such an extension requires some system
wizardry, so the present implementation simply types out the name of the
file that should be
edited and the relevant line number.
@^system dependencies@>

There is a secret `\.D' option available when the debugging routines haven't
been commented~out.
@^debugging@>
@y
line ready to be edited.
We do this by calling the external procedure |calledit| with a pointer to
the filename, its length, and the line number.
However, here we just set up the variables that will be used as arguments,
since we don't want to do the switch-to-editor until after \TeX\ has closed
its files.
@^system dependencies@>

There is a secret `\.D' option available when the debugging routines haven't
been commented~out.
@^debugging@>
@d edit_file input_stack[base_ptr]
@z
@x
case 'E': if (base_ptr > 0)
  {@+print_nl("You want to edit file ");
@.You want to edit file x@>
  slow_print(input_stack[base_ptr].name_field);
  print_str(" at line ");print_int(line);
  interaction=scroll_mode;jump_out();
  } @+break;
@y
case 'E': if (base_ptr > 0) {
  ed_name_start = str_start[edit_file.name_field];
  ed_name_length = str_start[edit_file.name_field+1] - str_start[edit_file.name_field];
  edit_line = line;
  jump_out();
  } @+break;
@z

@x
if (!init_terminal()) exit(0);
@y
if (!init_terminal(argc,argv)) exit(0);
@z

use absolute path
@x
@d format_default_length	20 /*length of the |TEX_format_default| string*/
@d format_area_length	11 /*length of its area part*/
@y
@d format_default_length	36 /*length of the |TEX_format_default| string*/
@d format_area_length	27 /*length of its area part*/
@z
@x
wchar_t @!TEX_format_default[1+format_default_length+1]=L" TeXformats/plain.fmt";
@y
wchar_t @!TEX_format_default[1+format_default_length+1]=L" /home/user/ctex/TeXformats/plain.fmt";
@z

make that /home/user/ctex/ prefix will not be displayed
@x
else{@+for (k=1; k<=name_length; k++) {
@y
else{@+
k=1;
if (strncmp(name_of_file+1,"/home/user/ctex/TeXinputs/",name_length>26?26:name_length)==0) k=17;
for (; k<=name_length; k++) {
@z

@x
@p int main(void) {@! /*|start_here|*/
@y
@p int main(int argc, char **argv) {@! /*|start_here|*/
@z

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [51.1333] print new line before termination; switch to editor if nec.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
@x
void close_files_and_terminate(void)
@y
void calledit(packed_ASCII_code *filename, int fnlength, int linenumber)
{
        char *temp;
        char *command;
        char c;
        int sdone;
        int ddone;
        int i;

        char dvalue[] = "emacs +%d %s";
        char *texeditvalue = dvalue;
        sdone = ddone = 0;

        if(NULL != (temp = getenv("TEXEDIT")))
                texeditvalue = temp;

        if (NULL == (command = (char*)malloc(strlen(texeditvalue) + fnlength + 25))) {
                fwprintf(stderr, L"! Not enough memory to issue editor command\n");
                exit(1);
        }
        temp = command;
        while ((c = *texeditvalue++) != 0) {
                if (c == '%') {
                        switch (c = *texeditvalue++) {
                                case 'd':
                                        if(ddone) {
                                                fwprintf(stderr, L"! Line number cannot appear twice in editor command\n");
                                                exit(1);
                                        }
                                        sprintf(temp, "%d", linenumber);
                                        while (*temp != 0)
                                                temp++;
                                        ddone = 1;
                                        break;
                                case 's':
                                        if (sdone) {
                                                fwprintf(stderr, L"! Filename cannot appear twice in editor command\n");
                                                exit(1);
                                        }
                                        i = 0;
                                        while (i < fnlength)
                                                *temp++ = filename[i++];
                                        sdone = 1;
                                        break;
                                case 0:
                                        *temp++ = '%';
                                        texeditvalue--; // Back up to \0 to force termination
                                        break;
                                default:
                                        *temp++ = '%';
                                        *temp++ = c;
                                        break;
                        }
                }
                else
                        *temp++ = c;
        }
        *temp = 0;

        if (0 != system(command))
                fwprintf(stderr, L"! Trouble executing command %s\n", command);

        exit(1);
}
void close_files_and_terminate(void)
@z
@x
    slow_print(log_name);print_char('.');
    }
  }
@y
    slow_print(log_name);print_char('.');
    }
  }
  print_ln();
  if (ed_name_start != 0 && interaction > batch_mode)
    calledit(&str_pool[ed_name_start], ed_name_length, edit_line);
@z

@x
@* System-dependent changes.
This section should be replaced, if necessary, by any special
modifications of the program
that are necessary to make \TeX\ work at a particular installation.
It is usually best to design your change file so that all changes to
previous sections preserve the section numbering; then everybody's version
will be consistent with the published program. More extensive changes,
which introduce new sections, can be inserted here; then only the index
itself will get a new section number.
@^system dependencies@>
@y
@* System-dependent changes.
Here are the variables that holds ``switch-to-editor'' information.
@^system dependencies@>

@<Global...@>=
pool_pointer ed_name_start;
int ed_name_length, edit_line;

@ The |ed_name_start| will be set to point into |str_pool| somewhere after
its beginning if \TeX\ is supposed to switch to an editor on exit.

@<Set init...@>=
ed_name_start = 0;
    
@z

use absolute paths
@x
@d str_506 "TeXinputs/"
@y
@d str_506 "/home/user/ctex/TeXinputs/"
@z
@x
@d str_507 "TeXfonts/"
@y
@d str_507 "/home/user/ctex/TeXfonts/"
@z
