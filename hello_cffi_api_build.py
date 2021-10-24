from cffi import FFI

ffibuilder = FFI()
ffibuilder.set_source(
    "hello_cffi_api_build_wrap",
    r"""
#include "plus.h"

""",
    libraries=["plus"],
    library_dirs=["."],
)
ffibuilder.cdef(
    """
int plus(int x, int y);

int plusone(int x);

long long current_timestamp(void);

extern "Python" void run(int count);

"""
)

if __name__ == "__main__":
    ffibuilder.compile(verbose=False)
