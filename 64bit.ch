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
@p pointer get_node(int @!s) /*variable-size node allocation*/ 
{@+
pointer p; /*the node currently under inspection*/ 
pointer @!q; /*the node physically after node |p|*/ 
int @!r; /*the newly allocated node, or a candidate for this honor*/ 
int @!t; /*temporary register*/ 
@y
@p pointer get_node(int @!s) /*variable-size node allocation*/ 
{@+
pointer p; /*the node currently under inspection*/ 
pointer @!q; /*the node physically after node |p|*/ 
unsigned int @!r; /*the newly allocated node, or a candidate for this honor*/ 
unsigned int @!t; /*temporary register*/ 
@z

@x
@p void print_font_and_char(int @!p) /*prints |char_node| data*/ 
@y
@p void print_font_and_char(unsigned int @!p) /*prints |char_node| data*/ 
@z

@x
@p void show_node_list(int @!p) /*prints a node list symbolically*/ 
@y
@p void show_node_list(unsigned int @!p) /*prints a node list symbolically*/ 
@z
diff --git a/tex.w b/tex.w
index 96376cf..217c90b 100644
--- a/tex.w
+++ b/tex.w
@@ -3395,7 +3395,7 @@
 initializing itself the slow~way.
 
 @<Local variables for init...@>=
-int @!k; /*index into |mem|, |eqtb|, etc.*/ 
+unsigned int @!k; /*index into |mem|, |eqtb|, etc.*/ 
 
 @ @<Initialize table entries...@>=
 for (k=mem_bot+1; k<=lo_mem_stat_max; k++) mem[k].sc=0;
@@ -3595,7 +3595,7 @@
 @ Boxes, rules, inserts, whatsits, marks, and things in general that are
 sort of ``complicated'' are indicated only by printing `\.{[]}'.
 
-@p void short_display(int @!p) /*prints highlights of list |p|*/ 
+@p void short_display(unsigned int @!p) /*prints highlights of list |p|*/ 
 {@+int n; /*for replacement counts*/ 
 while (p > mem_min) 
   {@+if (is_char_node(p)) 
@@ -3647,7 +3647,7 @@
   } 
 } 
 @#
-void print_mark(int @!p) /*prints token list data in braces*/ 
+void print_mark(unsigned int @!p) /*prints token list data in braces*/ 
 {@+print_char('{');
 if ((p < hi_mem_min)||(p > mem_end)) print_esc(@[@<|"CLOBBERED."|@>@]);
 else show_token_list(link(p), null, max_print_line-10);
@@ -3677,7 +3677,7 @@
 
 @ The next subroutine prints a whole glue specification.
 
-@p void print_spec(int @!p, str_number @!s)
+@p void print_spec(unsigned int @!p, str_number @!s)
    /*prints a glue specification*/ 
 {@+if ((p < mem_min)||(p >= lo_mem_max)) print_char('*');
 @.*\relax@>
@@ -4448,11 +4448,11 @@
 
 @p void print_totals(void);
 void show_activities(void)
-{@+int p; /*index into |nest|*/ 
+{@+unsigned int p; /*index into |nest|*/ 
 int16_t @!m; /*mode*/ 
 memory_word @!a; /*auxiliary*/ 
 pointer @!q, @!r; /*for showing the current page*/ 
-int @!t; /*ditto*/ 
+unsigned int @!t; /*ditto*/ 
 nest[nest_ptr]=cur_list; /*put the top level into the array*/ 
 print_nl("");print_ln();
 for (p=nest_ptr; p>=0; p--) 
@@ -5654,7 +5654,7 @@
 they may be unprintable.
 
 @<Basic printing...@>=
-void print_cs(int @!p) /*prints a purported control sequence*/ 
+void print_cs(unsigned int @!p) /*prints a purported control sequence*/ 
 {@+if (p < hash_base)  /*single character*/ 
   if (p >= single_base) 
     if (p==null_cs) 
@@ -6336,7 +6336,7 @@
 a real control sequence named \.{BAD} would come out `\.{\\BAD\ }'.
 
 @<Declare the procedure called |show_token_list|@>=
-void show_token_list(int @!p, int @!q, int @!l)
+void show_token_list(unsigned int @!p, unsigned int @!q, int @!l)
 {@+
 int m, @!c; /*pieces of a token*/ 
 ASCII_code @!match_chr; /*character used in a `|match|'*/ 
