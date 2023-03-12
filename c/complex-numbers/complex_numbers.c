#include <math.h>
#include "complex_numbers.h"

complex_t c_add(complex_t a, complex_t b)
{
   complex_t add;
   add.real = a.real + b.real;
   add.imag = a.imag + b.imag;
   return add;
}

complex_t c_sub(complex_t a, complex_t b)
{
   complex_t sub;
   sub.real = a.real - b.real;
   sub.imag = a.imag - b.imag;
   return sub;
}

complex_t c_mul(complex_t a, complex_t b)
{
   complex_t mul;
   mul.real = (a.real * b.real) - (a.imag * b.imag);
   mul.imag = (a.imag * b.real) + (a.real * b.imag);
   return mul;
}

complex_t c_div(complex_t a, complex_t b)
{
   const double new_denom = (b.real * b.real) + (b.imag * b.imag);
   complex_t div;
   div.real = ((a.real * b.real) + (a.imag * b.imag)) / new_denom;
   div.imag = ((a.imag * b.real) - (a.real * b.imag)) / new_denom;
   return div;
}

double c_abs(complex_t x)
{
   return sqrt((x.real * x.real) + (x.imag * x.imag));
}

complex_t c_conjugate(complex_t x)
{
   complex_t conj;
   conj.real = x.real;
   conj.imag = -x.imag;
   return conj;
}

double c_real(complex_t x)
{
   return x.real;
}

double c_imag(complex_t x)
{
   return x.imag;
}

complex_t c_exp(complex_t x)
{
   const double prefactor = exp(x.real);
   complex_t exp;
   exp.real = prefactor * cos(x.imag);
   exp.imag = prefactor * sin(x.imag);
   return exp;
}
