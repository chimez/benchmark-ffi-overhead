#!/bin/bash

gcc -shared -o libplus.so plus.c -O3 -g
gcc -c -o plus.o plus.c -O3 -g
ar rcs libplus.a plus.o

n=1000000000

# c
echo c_shared
gcc -o hello hello.c -lplus -L. -O3 -g
./hello $n

echo c_static 
gcc -o hello_static hello.c -l:libplus.a -L. -O3 -g
./hello_static $n

echo c_direct 
gcc -o hello_direct hello.c plus.c -O3 -g
./hello_direct $n

# python
echo python_cython 
cythonize -3 -i -q hello_cython.pyx &> /dev/null 
python hello.py $n

echo python_cffi_abi *100!
python hello_cffi_abi.py $((n/100))

echo python_cffi_api *100!
python hello_cffi_api_build.py &> /dev/null 
python hello_cffi_api.py $((n/100))

# common lisp
echo common_lisp_sbcl *10!
sbcl --non-interactive --eval '(compile-file "hello_sbcl.lisp")' &> /dev/null
sbcl --script hello_sbcl_main.lisp $((n/10))

# rust
echo rust_shared
rustc -o hello_rust hello.rs -lplus -L.
./hello_rust $n

echo rust_static
rustc -o hello_rust_static hello.rs -lstatic=plus -L.
./hello_rust_static $n

