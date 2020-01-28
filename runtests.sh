#! /bin/sh

rm -rf test/output
mkdir -p test/output
cd test/output
for dirname in ../testfiles/*; do
    ../../bin/autoinst -verbose -verbose -target="$PWD" -noupdmap "$dirname"/*.[ot]tf
done
../../bin/autoinst -verbose -verbose -target="$PWD" -noupdmap -inferiors -defaultproportional ../testfiles/cormorantgaramond/*.[ot]tf
../../bin/autoinst -verbose -verbose -target="$PWD" -noupdmap -nfssweight=m=medium ../testfiles/franklingothic/*.[ot]tf
cd ../..
