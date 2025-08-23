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
int64_t @!r; /* TODO: understand why this change is needed - maybe use (int)
                in some point(s) of the program instead (like below) */
@z

@x
r=q-s;
@y
if (s==010000000000) r=-1; /* compiler casts |q-s| to unsigned because |q| is unsigned,
                              thus |r| will be very big instead of negative */
else r=q-s;
@z
