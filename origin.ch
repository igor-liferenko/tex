We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex.
Note that origin position (and paper dimensions) can participate in the calculations of
e.g. \pageshift, so automatic unmagnification of origin position
(and paper dimensions) is done before calling dvipdfm.
