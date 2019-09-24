#! /bin/sh

rm -rf test/output\ dir
mkdir -p test/output\ dir
cd test/output\ dir
for dirname in ../testfiles/*; do
    ../../bin/autoinst -verbose -target="$PWD" -noupdmap "$dirname"/*.[ot]tf
done
../../bin/autoinst -verbose -target="$PWD" -noupdmap -inferiors -defaultproportional ../testfiles/cormorantgaramond/*.[ot]tf
../../bin/autoinst -verbose -target="$PWD" -noupdmap -nfssweight=m=medium ../testfiles/franklingothic/*.[ot]tf
cd ../..
