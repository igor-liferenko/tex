I wonder which is a scenario where change 431 (tex82.bug) serves any purpose.
If the assert() trap is ever triggered, describe the scenario
that reproduces the trap in README.bug and delete this change-file.

@x
case 'E': if (base_ptr > 0) if (input_stack[base_ptr].name_field >= 256) 
@y
case 'E': if (base_ptr > 0) assert(input_stack[base_ptr].name_field >= 256);
          if (base_ptr > 0)
@z

@x
if (base_ptr > 0) if (input_stack[base_ptr].name_field >= 256) 
@y
if (base_ptr > 0) assert(input_stack[base_ptr].name_field >= 256);
if (base_ptr > 0)
@z
