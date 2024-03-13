#!/bin/bash
for filename in testing/parser/test_source_files/*.tsp; do
    y=${filename%.tsp};
    z=${y##*/};
    testoutput=$(./tsp testing/parser/test_source_files/$z.tsp | shasum -a 256 | head -c 40);
    expectedoutput=$(shasum -a 256 testing/parser/expected_output/$z.txt | head -c 40);
    if [ "$testoutput" = "$expectedoutput" ]; then
        echo "\033[0;32m  \xE2\x9C\x94 $z - Test Passed \033[0m";
    else
        echo "\033[0;31m  \xE2\x9D\x8C $z - Test FAILED \033[0m";

    fi
done