import sys
from hello_cython import run

def main():

    count = int(sys.argv[1])
    if count <=0 or count > 2000000000:
        print("Must be a positive number not exceeding 2 billion.")
        return 1

    run(count)
    return 0

if __name__ == "__main__":
    main()
