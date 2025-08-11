TODO: undo changes one by one except first and delete which are not necessary

@x
enum {@+@!mem_max=65534@+};
@y
#ifdef INIT
enum {@+@!mem_max=65534@+};
#else
enum {@+@!mem_max=5000000@+};
#endif
@z

@x
typedef float32_t @!glue_ratio; /*one-word representation of a glue expansion factor*/ 
@y
typedef double @!glue_ratio; /*one-word representation of a glue expansion factor*/ 
@z

@x
  } four_quarters;
typedef struct { @;@/
  union { 
  int @!i;
@y
  } four_quarters;
typedef struct { @;@/
  union { 
  int64_t @!i;
@z

@x
int @!var_used, @!dyn_used; /*how much memory is in use*/ 
@y
unsigned int @!var_used, @!dyn_used; /*how much memory is in use*/ 
@z

@x
@p pointer get_node(int @!s) /*variable-size node allocation*/ 
{@+
pointer p; /*the node currently under inspection*/ 
pointer @!q; /*the node physically after node |p|*/ 
int @!r; /*the newly allocated node, or a candidate for this honor*/ 
int @!t; /*temporary register*/ 
@y
@p pointer get_node(int64_t @!s) /*variable-size node allocation*/ 
{@+
pointer p; /*the node currently under inspection*/ 
pointer @!q; /*the node physically after node |p|*/ 
unsigned int @!r; /*the newly allocated node, or a candidate for this honor*/ 
unsigned int @!t; /*temporary register*/ 
@z

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

@x
int @!k; /*index into |mem|, |eqtb|, etc.*/ 
@y
unsigned int @!k; /*index into |mem|, |eqtb|, etc.*/ 
@z

@x
@p void short_display(int @!p) /*prints highlights of list |p|*/ 
@y
@p void short_display(unsigned int @!p) /*prints highlights of list |p|*/ 
@z

@x
@p void print_font_and_char(int @!p) /*prints |char_node| data*/ 
@y
@p void print_font_and_char(unsigned int @!p) /*prints |char_node| data*/ 
@z

@x
void print_mark(int @!p) /*prints token list data in braces*/ 
@y
void print_mark(unsigned int @!p) /*prints token list data in braces*/ 
@z

@x
@p void print_spec(int @!p, str_number @!s)
@y
@p void print_spec(unsigned int @!p, str_number @!s)
@z

@x
@p void show_node_list(int @!p) /*prints a node list symbolically*/ 
@y
@p void show_node_list(unsigned int @!p) /*prints a node list symbolically*/ 
@z

@x
{@+int p; /*index into |nest|*/ 
@y
{@+unsigned int p; /*index into |nest|*/ 
@z

@x
int @!t; /*ditto*/ 
@y
unsigned int @!t; /*ditto*/ 
@z

@x
void print_cs(int @!p) /*prints a purported control sequence*/ 
@y
void print_cs(unsigned int @!p) /*prints a purported control sequence*/ 
@z

@x
void show_token_list(int @!p, int @!q, int @!l)
@y
void show_token_list(unsigned int @!p, unsigned int @!q, int @!l)
@z

@x
int @!n; /*ditto*/ 
@y
unsigned int @!n; /*ditto*/ 
@z
