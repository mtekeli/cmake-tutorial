#include "MathFunctions.h"

#include <stdio.h>
#include <cmath>

double mysqrt(const double value)
{
    fprintf(stdout, "calculating mysqrt\n");
    return std::sqrt(value);
}
