We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex. The best
way to transfer these parameters to dvipdfm is to call it from TeX. The problem with
\special would be that it must be on first page, which is problematic
(e.g., cwebmac discards first page).
Anyway, calling dvipdfm automatically is better because it avoids extra step.
Moreover, origin position (and paper dimensions) can participate in the calculations of
e.g. \pageshift, because automatic unmagnification of origin position
(and paper dimensions) is done inside TeX before calling dvipdfm.

@x
   /*open a binary file for output*/ 
{@+rewrite((*f), name_of_file,"wb");return rewrite_OK((*f));
} 
@y
   /*open a binary file for output*/ 
{@+rewrite((*f), name_of_file,"wb");return rewrite_OK((*f));
} 
#define DRIVER "dvipdfm -q"
bool dvi_open_out(byte_file *f)
{
    if (getenv("engine")) {
        return b_open_out(f);
    }
    else {
        const char *p = (const char*)name_of_file+1;
        char    *q, *bindir = NULL;
        int len = strlen(p);
        while (*p)
            if (*p++ == '\"')
                ++len;
        len += strlen(DRIVER);
        len += 10; /* space for -o flag, quotes, NUL */
        for (p = (const char*)name_of_file+1; *p; p++)
            if (*p == '\"')
                ++len;  /* allow extra space to escape quotes in filename */
        char cmd[500];
        strcpy(cmd, DRIVER);
        strcat(cmd, " -o \"");
        q = cmd + strlen(cmd);
        for (p = (const char*)name_of_file+1; *p; p++) {
            if (*p == '\"')
                *q++ = '\\';
            *q++ = *p;
        }
        *q++ = '\"';
        *q = '\0';
        f->f = popen(cmd, "w");
        return f->f != NULL;
    }
}

bool dvi_close(byte_file *f)
{
  if (getenv("engine"))
    return fclose(f->f) == 0;
  else
    return pclose(f->f) == 0;
}
@z
