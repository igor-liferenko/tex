@x
@<|"output file name"|@>= 1300
@y
@<|"output file name"|@>= 1300
@ @d str_1301 "TeXinputs/"
@d TEX_area_short 1301
@ @d str_1302 "pdfpagewidth"
@d pdfpagewidth_str 1302
@ @d str_1303 "pdfpageheight"
@d pdfpageheight_str 1303
@ @d str_1304 "pdfhorigin"
@d pdfhorigin_str 1304
@ @d str_1305 "pdfvorigin"
@d pdfvorigin_str 1305
@ @d str_1306 "hyphen@@te"
@d hyphenate_str 1306
@z

@x
str_1296 str_1297 str_1298 str_1299 str_1300
@y
str_1296 str_1297 str_1298 str_1299 str_1300 str_1301
str_1302 str_1303 str_1304 str_1305 str_1306
@z

@x
str_start_1300, str_start_1301
@y
str_start_1300, str_start_1301, str_start_1302, str_start_1303,
str_start_1304, str_start_1305, str_start_1306, str_start_1307
@z

@x
str_start_1301=str_start_1300+sizeof(str_1300)-1,@/
@y
str_start_1301=str_start_1300+sizeof(str_1300)-1,@/
str_start_1302=str_start_1301+sizeof(str_1301)-1,
str_start_1303=str_start_1302+sizeof(str_1302)-1,
str_start_1304=str_start_1303+sizeof(str_1303)-1,
str_start_1305=str_start_1304+sizeof(str_1304)-1,
str_start_1306=str_start_1305+sizeof(str_1305)-1,
str_start_1307=str_start_1306+sizeof(str_1306)-1,
@z

@x
@ @<|pool_ptr| initialization@>= str_start_1301
@y
@ @<|pool_ptr| initialization@>= str_start_1307
@z

@x
@ @<|str_ptr| initialization@>= 1301
@y
@ @<|str_ptr| initialization@>= 1307
@z
