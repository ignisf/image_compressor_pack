#include "crunch.h"

VALUE rb_mCrunch;

void
Init_crunch(void)
{
  rb_mCrunch = rb_define_module("Crunch");
}
