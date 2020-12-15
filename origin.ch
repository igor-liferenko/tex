We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex. The best
way to transfer these parameters to dvipdfm is to call it from TeX. The problem with
\special would be that it must be on first page, which is problematic
(e.g., cwebmac discards first page).
Anyway, calling dvipdfm automatically is better because it avoids extra step.
Moreover, origin position (and paper dimensions) can participate in the calculations of
e.g. \pageshift, because automatic unmagnification of origin position
(and paper dimensions) is done inside TeX before calling dvipdfm.

int
open_dvi_output(FILE** fptr)
{
    if (nopdfoutput) {
        return open_output(fptr, FOPEN_WBIN_MODE);
    } else {
        const char *p = (const char*)nameoffile+1;
        char    *cmd, *q, *bindir = NULL;
        int len = strlen(p);
        while (*p)
            if (*p++ == '\"')
                ++len;
        len += strlen(outputdriver);
        if (output_directory)
            len += strlen(output_directory);
        len += 10; /* space for -o flag, quotes, NUL */
        for (p = (const char*)nameoffile+1; *p; p++)
            if (*p == '\"')
                ++len;  /* allow extra space to escape quotes in filename */
        cmd = xmalloc(len);
        strcpy(cmd, outputdriver);
        strcat(cmd, " -o \"");
        if (output_directory) {
            len = strlen(output_directory);
            if (IS_DIR_SEP(output_directory[len-1]))
                output_directory[len-1] = '\0';
            strcat(cmd, output_directory);
            strcat(cmd, "/");
        }
        q = cmd + strlen(cmd);
        for (p = (const char*)nameoffile+1; *p; p++) {
            if (*p == '\"')
                *q++ = '\\';
            *q++ = *p;
        }
        *q++ = '\"';
        *q = '\0';
        if (papersize != 0) {
            char* cmd2 = concat3(cmd, " -p ", papersize);
            free(cmd);
            cmd = cmd2;
        }
        if (output_directory) {
            char *fullname = concat3(output_directory, "/", (const char*)nameoffile+1);
            free(nameoffile);
            namelength = strlen(fullname);
            nameoffile = (unsigned char*) xmalloc(namelength + 2);
            strcpy((char*)nameoffile+1, fullname);
            free(fullname);
        }
        *fptr = popen(cmd, "w");
        free(cmd);
        return (*fptr != 0);
    }
}

int
dviclose(FILE* fptr)
{
    if (nopdfoutput) {
        if (fclose(fptr) != 0)
            return errno;
    } else {
        return pclose(fptr);
    }
    return 0;
}

