#!/bin/bash


# Go through header files
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
    #if grep -q -E "#pragma once"
    #then
        # My attempt at matching include guards. Probably faulty
        # It may also cause a loop. When I tried to run it it froze the program
        #if grep -q -E "#ifndef [^\r\n]+\r?\n?[\t ]*#define" $header_file
        #then
            #echo -n $header_file
            #echo -e ":\t both pragma once and include guards present"
        #fi
    #fi


    # Mixed tabs and spaces
    # FIXME:
    #if grep -q -e "\t" $header_file
    #then
    #    if grep -q -e "    " $header_file
    #    then
    #        echo -n $header_file
    #        echo -e ":\t appears to use mixed tabs and spaces"
    #    fi
    #fi

done

# Go through all *.cpp files
for source_file in $(ls | grep -E "\.cpp$")
do
    # assert(true)
    # (note that grep generates the file name as a part of the string)
    for offending_line in $(grep -n -o -H -E "assert\(true\)" $source_file)
    do
        echo -n $offending_line
        echo -e ":\tcontains assert(true)"
    done

    # #pragma once
    if grep -q -e "#pragma once" $source_file
    then
        echo -n $source_file
        echo -e ":\t#pragma once in non-header file"
    fi

    # No namespace
    if ! grep -q -e "namespace" $source_file
    then
        echo -n $source_file
        echo -e ":\t appears to be outside a namespace"
    fi
done

