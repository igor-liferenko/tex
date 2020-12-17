We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex.
Note that origin position (and paper dimensions) - which are "outside" of TeX - can
participate in the calculations of parameters such as \pageshift - which
are "inside" of TeX - so they must obey the scaling rules of TeX.
Therefore automatic magnification of these parameters
is done before using them for dvipdfm.

print_scaled(pdf_page_width);
print("pt");
print_scaled(pdf_page_height);
print("pt");
