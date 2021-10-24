import sys
from cffi import FFI

ffi = FFI()
ffi.cdef("""
int plus(int x, int y);

int plusone(int x);

long long current_timestamp(void);

""")
lib = ffi.dlopen("./libplus.so")

def run(count):

    start = lib.current_timestamp()
    x = 0
    while x < count:
        x = lib.plusone(x)

    end = lib.current_timestamp() - start

    print(f"result={x}, time={end}")


def main():

    count = int(sys.argv[1])
    if count <=0 or count > 2000000000:
        print("Must be a positive number not exceeding 2 billion.")
        return 1

    run(count)
    return 0

if __name__ == "__main__":
    main()

