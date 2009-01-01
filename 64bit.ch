Allow to use bigger values in constants.ch

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
typedef int32_t halfword; /*1/2 of a word*/
@z
