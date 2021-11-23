#include <cstdio>
#include <cstdlib>
#include "cuda_runtime.h"

#include "kernels.h"

#define CUDACHECK(cmd) do {                         \
  cudaError_t err = cmd;                            \
  if (err != cudaSuccess) {                         \
    printf("CUDA failure %s:%d '%s'\n",             \
        __FILE__,__LINE__,cudaGetErrorString(err)); \
    exit(1);                                        \
  }                                                 \
} while(0)



int main(int argc, const char *argv[])
{
    // CUDACHECK(fp32_hammer(cudaStreamDefault, 80));
    CUDACHECK(l2_ld_hammer(cudaStreamDefault, 80));
    CUDACHECK(cudaDeviceSynchronize());

    cudaDeviceReset();
    return 0;
}
