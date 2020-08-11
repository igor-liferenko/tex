Make stepping over this line with `n' in debugger faster.

@x
for (i=first_text_char; i<=last_text_char; i++) xord[chr(i)]=invalid_code;
@y
memset(xord, invalid_code, sizeof xord);
@z
