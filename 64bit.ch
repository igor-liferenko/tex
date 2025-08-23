@x
@d max_quarterword	255 /*largest allowable value in a |quarterword|*/
@y
@d max_quarterword 65535 /*largest allowable value in a |quarterword|*/
@z

@x
@d max_halfword	65535 /*largest allowable value in a |halfword|*/
@y
@d max_halfword 0x3FFFFFFF /*largest allowable value in a |halfword|*/
@z

@x
typedef uint8_t quarterword; /*1/4 of a word*/
typedef uint16_t halfword; /*1/2 of a word*/
@y
typedef uint16_t quarterword; /*1/4 of a word*/
typedef uint32_t halfword; /*1/2 of a word*/
@z

@x
int @!r; /*the newly allocated node, or a candidate for this honor*/
@y
int64_t @!r; /*the newly allocated node, or a candidate for this honor*/
@z

@x
r=q-s;
@y
r=q-(int64_t)s; /* |r| can become negative here, which leads to segmentation fault if
  the type of |r| is not changed above; if we do not do the cast,
  |r| can become greater that 2^31-1 here, which leads to segmentation fault */
@z
