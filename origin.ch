We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex.
origin position (and paper dimensions) can participate in the calculations of
e.g. \pageshift, because automatic unmagnification of origin position
(and paper dimensions) is done inside TeX before calling dvipdfm.
