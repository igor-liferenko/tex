Ensure that text input files are good.

@x
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) f->d=fgetwc(f->f); return reset_OK(*f);
@y
{ if ((f->f=fopen(name_of_file+1,"r"))!=NULL) {
    wint_t c;
    while ((c = fgetwc(f->f)) != WEOF) { if ((c & 0xffff) != c) break; }
    assert(feof(f->f));
    rewind(f->f);
    f->d=fgetwc(f->f);
  }
  return reset_OK(*f);
@z
