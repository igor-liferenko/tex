We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex.

It is not yet clear how to restore these values before using them as
arguments for dvipdfm if \magnification is used,
so use the fact that they are used
only in the beginning of document and get them via regexp in tex wrapper.

getenv("pdfpagewidth");
getenv("pdfpageheight");
getenv("pdfhorigin");
getenv("pdfvorigin");
