Always use math library - for consistency.
(When optimization is enabled, built-in versions of floor() and ceil() are used,
which makes `-lm' unnecessary.)

@x
#define round(X)     ((int)((X)>=0.0?floor((X)+0.5):ceil((X)-0.5)))
@y
@z
