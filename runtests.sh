#! /bin/sh

rm -rf test/output
mkdir -p test/output
cd test/output
for dirname in ../testfiles/*; do
    ../../bin/autoinst -verbose -target="$PWD" -noupdmap "$dirname"/*.[ot]tf
done
../../bin/autoinst -verbose -target="$PWD" -noupdmap -inferiors -defaultproportional ../testfiles/cormorantgaramond/*.[ot]tf
../../bin/autoinst -verbose -target="$PWD" -noupdmap -nfssweight=m=medium ../testfiles/franklingothic/*.[ot]tf
../../bin/autoinst -verbose -target="$PWD" -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular')
../../bin/autoinst -verbose -target="$PWD" -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular|medium')
cd ../..
