#include "MathFunctions.h"
#include "TutorialConfig.h"

#include <stdio.h>
#include <cmath>

double mysqrt(const double value)
{
    fprintf(stdout, "calculating mysqrt\n");
    // if we have both log and exp then use them
#if defined (HAVE_LOG) && defined (HAVE_EXP)
    fprintf(stdout, "found exp and log functions\n");
    return exp(log(value)*0.5);
#else // otherwise use an iterative approach
    fprintf(stdout, "not found exp and log functions\n");
    return std::sqrt(value);
#endif
}
