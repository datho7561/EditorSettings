#!/bin/bash

# Author:    David Thompson
# Date:      18 July, 2019
# Purpose:   Detect some common C++ coding errors that I have found
# Running:   Copy into the directory that contains the header files and the
#            source files

# TODO:
# * Ensure consistent output format of errors
# * Check spelling of output and explanations
# * Link good references and explanations for errors
# * Make sure correct output
# * Generate test cases/unit testing in order to ensure this script works

# Go through header files in the current folder
for header_file in $(ls | grep "\.h$")
do
    # Perform checks on this file and report errors

    # assert(true)
    # (note that grep generates the file name as a part of the string)
    for offending_line in $(grep -n -o -H -E "assert\(true\)" $header_file)
    do
        echo -n $offending_line
        echo -e ":\tcontains assert(true)"
    done

    # using namespace std
    if grep -q -e "using namespace std;" $header_file
    then
        echo -n $header_file
        echo -e ":\tusing namespace std in header file"
    fi

    # No namespace
    if ! grep -q -e "namespace" $header_file
    then
        echo -n $header_file
        echo -e ":\t appears to be outside a namespace"
    fi

    # pragma once and include guards
    # FIXME:
    if grep -q -E "#pragma once"
    then
        # This massive set of grep queries detects include guards
        if grep -A 1 -E "^[\t ]*#ifndef[\t ]+[_a-zA-Z][_a-zA-Z0-9]*[\t ]*$" $1 | grep -q -E "^[\t ]*#define[\t ]+[_a-zA-Z][_a-zA-Z0-9]*[\t ]*$"
        then
            echo -n $header_file
            echo -e ":\t both pragma once and include guards present"
        fi
    fi

    # Mixed tabs and spaces
    if grep -q -e "\t" $header_file
    then
        if grep -q -e "     " $header_file
        then
            echo -n $header_file
            echo -e ":\t appears to use mixed tabs and spaces"
        fi
    fi
done

# Go through all *.cpp files
for source_file in $(ls | grep -E "\.cpp$")
do
    # assert(true)
    # (note that grep generates the file name as a part of the string)
    for offending_line in $(grep -n -o -H -E "assert\(true\)" $source_file)
    do
        echo -n $offending_line
        echo -e ":\tassert(true) is a do-nothing statement; remove or change to assert(false)"
    done

    # #pragma once
    if grep -q -e "#pragma once" $source_file
    then
        echo -n $source_file
        echo -e ":\t#pragma once in non-header file"
    fi

    # Include guard in non-header file
    if grep -A 1 -E "^[\t ]*#ifndef[\t ]+[_a-zA-Z][_a-zA-Z0-9]*[\t ]*$" $1 | grep -q -E "^[\t ]*#define[\t ]+[_a-zA-Z][_a-zA-Z0-9]*[\t ]*$"
    then
        echo -n $source_file
        echo -e ":\tinclude guard in non-header file"
    fi

    # No namespace
    if ! grep -q -e "namespace" $source_file
    then
        echo -n $source_file
        echo -e ":\t appears to be outside a namespace"
    fi

    # Mixed tabs and spaces
    if grep -q -e "\t" $header_file
    then
        if grep -q -e "     " $header_file
        then
            echo -n $header_file
            echo -e ":\t appears to use mixed tabs and spaces"
        fi
    fi
done

# EXPLANATIONS OF ERRORS:

# 1) `using namespace std` in header file
# Here is a good explanation provided by the ISO Cpp Core Guidelines:
# https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#Rs-using

# 2) assert(true)
# This statement is redundant. It is telling the program to crash if the
# predicate `true` doesn't hold. true always equals true, so this will never do
# anything except potentially slow down compilation, execution, and people who
# are trying to make sense of the code. If you meant to crash the program if
# this statement is reached (probably for debugging reasons) use `assert(false)`

# 3) Code outside of namespace
# In general, it is best to structure code into namespaces. One reason for this
# is that it avoids name collisions. This means that you can distinguish between
# two classes or two functions called the same thing. Another reason for this
# is that it can help structure code into groups of related classes and 
# functions.
# As a word of caution, this check may have false positives and negatives.

# 4) Mixed tabs and spaces
# Generally, code should be of a consistent style. If the code looks the same
# throughout the file, or throughout many files, then it is easier and faster to
# read. Generally, editors can adapt to the indentation style of the current
# file, but this only works if the file has a consistent use of either tabs or
# spaces.
# NOTE: I believe this yields a lot of false positives

# 5) `#pragma once` in non-header file
# `#pragma once` is intended to replace include guards. The purpose of include
# guards is to make sure that a header file only gets included once in any
# source code file that `#include`'s it. This only needs to be done in the
# header files, because source files should never be `#include`'d

# 6) include guards in non-header file
# The purpose of include guards is to make sure that a header file only gets
# included once in any source code file that `#include`'s it. This only needs
# to be done in the header files, because source files should never be
# `#include`'d

# 7) `#pragma once` and include guards
# The purpose of `#pragma once` is to replace include guards. It essentially
# stems from the idea that manually naming the include guards constants may
# lead to accidental macro name collisions (two include guards using the same
# name). `#pragma once` is technically non-standard, but it is well-supported.
# Check whether `#pragma once` or include guards are more consistently used in
# the code base, and convert to using just one of them.

