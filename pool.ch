@x
@<|"ext4"|@>=@+667
@y
@<|"ext4"|@>=@+667
@ @d str_668 "TeXinputs/"
@d TEX_area_short 668
@ @d str_669 "pdfpagewidth"
@d pdfpagewidth_str 669
@ @d str_670 "pdfpageheight"
@d pdfpageheight_str 670
@ @d str_671 "pdfhorigin"
@d pdfhorigin_str 671
@ @d str_672 "pdfvorigin"
@d pdfvorigin_str 672
@ @d str_673 "hyphen@@te"
@d hyphenate_str 673
@z

@x
str_664 str_665 str_666 str_667
@y
str_664 str_665 str_666 str_667 str_668 str_669 str_670 str_671 str_672 str_673
@z

@x
str_start_668
@y
str_start_668, str_start_669, str_start_670, str_start_671, str_start_672, str_start_673,
str_start_674
@z

@x
str_start_668=str_start_667+sizeof(str_667)-1,@/
@y
str_start_668=str_start_667+sizeof(str_667)-1,@/
str_start_669=str_start_668+sizeof(str_668)-1,
str_start_670=str_start_669+sizeof(str_669)-1,
str_start_671=str_start_670+sizeof(str_670)-1,
str_start_672=str_start_671+sizeof(str_671)-1,
str_start_673=str_start_672+sizeof(str_672)-1,
str_start_674=str_start_673+sizeof(str_673)-1,
@z

@x
@ @<|pool_ptr| initialization@>= str_start_668
@y
@ @<|pool_ptr| initialization@>= str_start_674
@z

@x
@ @<|str_ptr| initialization@>= 668
@y
@ @<|str_ptr| initialization@>= 674
@z
