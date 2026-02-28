Add names for new primitives to string pool.

@x
@<|"output file name"|@>=@+671
@y
@<|"output file name"|@>=@+671
@ @d str_672 "pdfpagewidth"
@<|"pdfpagewidth"|@>= 672
@ @d str_673 "pdfpageheight"
@<|"pdfpageheight"|@>= 673
@ @d str_674 "pdfhorigin"
@<|"pdfhorigin"|@>= 674
@ @d str_675 "pdfvorigin"
@<|"pdfvorigin"|@>= 675
@ @d str_676 "hyphen@@te"
@<|"hyphen@@te"|@>= 676
@z

@x
str_664 str_665 str_666 str_667 str_668 str_669 str_670 str_671@/
@y
str_664 str_665 str_666 str_667 str_668 str_669 str_670 str_671@/
str_672 str_673 str_674 str_675 str_676
@z

@x
str_start_672
@y
str_start_672, str_start_673, str_start_674, str_start_675, str_start_676, str_start_677
@z

@x
str_start_672=str_start_671+sizeof(str_671)-1,@/
@y
str_start_672=str_start_671+sizeof(str_671)-1,@/
str_start_673=str_start_672+sizeof(str_672)-1,
str_start_674=str_start_673+sizeof(str_673)-1,
str_start_675=str_start_674+sizeof(str_674)-1,
str_start_676=str_start_675+sizeof(str_675)-1,
str_start_677=str_start_676+sizeof(str_676)-1,
@z

@x
@ @<|pool_ptr| initialization@>= str_start_672
@y
@ @<|pool_ptr| initialization@>= str_start_677
@z

@x
@ @<|str_ptr| initialization@>= 672
@y
@ @<|str_ptr| initialization@>= 677
@z
