@x
@d max_quarterword	255 /*largest allowable value in a |quarterword|*/
@y
@d max_quarterword 65535 /*largest allowable value in a |quarterword|*/
@z

Must be less than 2^30.
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

According to definition of |get_node|, |r| must accomodate uint32_t values (|r| is returned
and return type is 'pointer'). |r| must also accomodate negative values, because |q-s| is
negative when |s| is 2^30.
@x
int @!r; /*the newly allocated node, or a candidate for this honor*/
@y
int64_t @!r; /*the newly allocated node, or a candidate for this honor*/
@z

Compiler casts |q-s| to unsigned because the type of |q| is unsigned,
thus |r| will be very big instead of negative when |s| is 2^30.
@x
r=q-s;
@y
r=(int64_t)q-s;
@z
