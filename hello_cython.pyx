# distutils: libraries = plus
# distutils: library_dirs = .

cdef extern from "plus.h":

    int plus(int x, int y)

    int plusone(int x)

    long long current_timestamp()

cpdef run(int count):

    cdef long long start = current_timestamp()
    cdef long long end
    cdef int x = 0

    while x < count:
        x = plusone(x)

    end = current_timestamp() - start

    print(f"result={x}, time={end}")


