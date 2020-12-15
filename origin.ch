We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex. The best
way to transfer these parameters to dvipdfm is to call it from TeX. The problem with
\special would be that it must be on first page, which is problematic
(e.g., cwebmac discards first page).
Anyway, calling dvipdfm automatically is better because it avoids extra step.
Moreover, origin position (and paper dimensions) can participate in the calculations of
e.g. \pageshift, because automatic unmagnification of origin position
(and paper dimensions) is done inside TeX before calling dvipdfm.

----------------

@d ensure_dvi_open==if output_file_name=0 then
  begin if job_name=0 then open_log_file;
  pack_job_name(output_file_extension);
  while not dvi_open_out(dvi_file) do
    prompt_file_name("file name for output",output_file_extension);
  output_file_name:=b_make_name_string(dvi_file);
  end

-------------

@x [32.645] l.12780 - use print_file_name
  print_nl("Output written on "); print_file_name(0, output_file_name, 0);
@.Output written on x@>
  print(" ("); print_int(total_pages);
  if total_pages<>1 then print(" pages")
  else print(" page");
  print(", "); print_int(dvi_offset+dvi_ptr); print(" bytes).");
  b_close(dvi_file);
@y
  k:=dvi_close(dvi_file);
  if k=0 then begin
    print_nl("Output written on "); print(output_file_name);
@.Output written on x@>
    print(" ("); print_int(total_pages);
    if total_pages<>1 then print(" pages")
    else print(" page");
    if no_pdf_output then begin
      print(", "); print_int(dvi_offset+dvi_ptr); print(" bytes).");
    end else print(").");
  end else begin
    print_nl("Error "); print_int(k); print(" (");
    if no_pdf_output then print_c_string(strerror(k))
    else print("driver return code");
    print(") generating output;");
    print_nl("file "); print(output_file_name); print(" may not be valid.");
    history:=output_failure;
    end;
@z

-------------------------------------

#define dviopenout(f)                           open_dvi_output(&(f))

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

