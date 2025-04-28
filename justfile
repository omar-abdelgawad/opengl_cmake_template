# justfile

# Set the shell to bash or sh, so we can chain commands
set shell := ["bash", "-cu"]

build:
    cmake -S . -B build
    cmake --build build

run:
    just build
    ./bin/APP

rebuild:
    rm -rf build
    just build

clean:
    rm -rf build
    rm -rf bin
    rm -rf .cache

