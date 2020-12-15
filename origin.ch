We need to specify origin position (and paper dimensions) in tex-file,
like in pdftex. The best
way to transfer these parameters to dvipdfm is to call it from TeX. The problem with
\special would be that it must be on first page, which is problematic
(e.g., cwebmac discards first page).
Anyway, calling dvipdfm automatically is better because it avoids extra step.
Moreover, origin position (and paper dimensions) can participate in the calculations of
e.g. \pageshift, because automatic unmagnification of origin position
(and paper dimensions) is done inside TeX before calling dvipdfm.
