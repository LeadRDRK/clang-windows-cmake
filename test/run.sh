#!/usr/bin/env bash
set -eo pipefail

run_test () {
    rm -rf $2
    mkdir $2
    echo "++ Starting $1"
    ../$1 -S . -B $2 -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=RelWithDebInfo
    echo
    echo "++ Building executable"
    make -C $2
    echo
}

run_test i686-clang-windows-cmake build-x86
run_test x86_64-clang-windows-cmake build-x64

echo "++ All tests completed successfully"
