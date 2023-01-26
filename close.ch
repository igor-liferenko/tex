Do not allow wide-character streams be closed automatically,
because on some systems this may result to "Segmentation fault"
(due to the bug in C library).

@x
  return reset_OK(*f);
@y
  list_add(f->f); return reset_OK(*f);
@z

@x
{@+close((*f));
@y
{ list_delete(f->f); close(*f);
@z

@x
initialize(); /*set global variables to their starting values*/ 
@y
atexit(list_close);
initialize(); /*set global variables to their starting values*/ 
@z

@x
@ Appendix: Replacement of the string pool file.
@y
@<Compiler directives@>=
struct node {
   void *f;
   struct node *n;
};
typedef struct node * node;
node list_head = NULL;

void list_add(void *f)
{
   if (f == NULL) return;
   node e = (node) malloc(sizeof (struct node));
   e->f = f, e->n = list_head, list_head = e;
}

void list_delete(void *f)
{
  node c = list_head;
  node p = NULL;
  if (list_head == NULL) return;
  while (c->f != f)
    if (c->n == NULL) return;
    else p = c, c = c->n;
  if (c == list_head) list_head = list_head->n;
  else p->n = c->n;
  free(c);
}

void list_close(void)
{
  node c = list_head;
  node p = NULL;
  while (c != NULL) fclose(c->f), p = c, c = c->n, free(p);
}

@ Appendix: Replacement of the string pool file.
@z
