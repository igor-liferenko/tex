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
r=(int)q-s; /* If we do the cast, q-s can be negative at certain points in the program;
                   if do not do the cast, q-s is greater than 2^31-1 in the same points. */
@z
