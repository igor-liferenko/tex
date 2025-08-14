TODO: undo changes below ---------- line one by one and delete which are not necessary
      (check by running 'make' here and then running 'make -C trip'; afterwards run 'make' in mytex/)

@x
@d max_quarterword	255 /*largest allowable value in a |quarterword|*/
@y
@d max_quarterword     65535 /*largest allowable value in a |quarterword|*/
@z

@x
@d max_halfword	65535 /*largest allowable value in a |halfword|*/
@y
@d max_halfword 0x3FFFFFFF // 2*max_halfword must be less than 2^24-1, not to produce an overflow - according to second edition of web2w.pdf
@z

@x
typedef uint8_t quarterword; /*1/4 of a word*/ 
typedef uint16_t halfword; /*1/2 of a word*/ 
@y
typedef uint16_t quarterword; /*1/4 of a word*/ 
typedef uint32_t halfword; /*1/2 of a word*/ 
@z

@x
@p pointer get_node(int @!s) /*variable-size node allocation*/ 
{@+
pointer p; /*the node currently under inspection*/ 
pointer @!q; /*the node physically after node |p|*/ 
int @!r; /*the newly allocated node, or a candidate for this honor*/ 
@y
@p pointer get_node(int64_t @!s) /*variable-size node allocation*/ 
{@+
pointer p; /*the node currently under inspection*/ 
pointer @!q; /*the node physically after node |p|*/ 
int64_t @!r; /*the newly allocated node, or a candidate for this honor*/ 
@z

2^62 - by analogy with 2^30
@x
if (s==010000000000) 
@y
if (s==0400000000000000000000)
@z

@x
p=get_node(010000000000); /*merge adjacent free areas*/ 
@y
p=get_node(0400000000000000000000); /*merge adjacent free areas*/ 
@z

------------------------------------------------------------------------------

@x
int @!k; /*index into |mem|, |eqtb|, etc.*/ 
@y
int64_t @!k; /*index into |mem|, |eqtb|, etc.*/ 
@z

@x
@p void short_display(int @!p) /*prints highlights of list |p|*/ 
@y
@p void short_display(int64_t @!p) /*prints highlights of list |p|*/ 
@z

@x
@p void print_font_and_char(int @!p) /*prints |char_node| data*/ 
@y
@p void print_font_and_char(int64_t @!p) /*prints |char_node| data*/ 
@z

@x
void print_mark(int @!p) /*prints token list data in braces*/ 
@y
void print_mark(int64_t @!p) /*prints token list data in braces*/ 
@z

@x
@p void print_spec(int @!p, str_number @!s)
@y
@p void print_spec(int64_t @!p, str_number @!s)
@z

@x
@p void show_node_list(int @!p) /*prints a node list symbolically*/ 
@y
@p void show_node_list(int64_t @!p) /*prints a node list symbolically*/ 
@z

@x
{@+int p; /*index into |nest|*/ 
@y
{@+int64_t p; /*index into |nest|*/ 
@z

@x
int @!t; /*ditto*/ 
@y
int64_t @!t; /*ditto*/ 
@z

@x
void print_cs(int @!p) /*prints a purported control sequence*/ 
@y
void print_cs(int64_t @!p) /*prints a purported control sequence*/ 
@z

@x
void show_token_list(int @!p, int @!q, int @!l)
@y
void show_token_list(int64_t @!p, int64_t @!q, int @!l)
@z

@x
int @!n; /*ditto*/ 
@y
int64_t @!n; /*ditto*/ 
@z

@x
int @!x; /*something undumped*/
@y
int64_t @!x; /*something undumped*/
@z
