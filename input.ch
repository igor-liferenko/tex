@x
    buffer[last]=xord[(*f).d];f->d=fgetwc(f->f);incr(last);
@y
    assert((f->d & 0xffff) == f->d);
    buffer[last]=xord[(*f).d];f->d=fgetwc(f->f);incr(last);
@z
