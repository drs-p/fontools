#! /bin/sh

rm -rf test/output
mkdir -p test/output
cd test/output
if [ -x "$(command -v parallel)" ]; then
    parallel ../../bin/autoinst -verbose -target="$PWD" -noupdmap {}/*.[ot]tf ::: ../testfiles/*
else
    for dirname in ../testfiles/*; do
        ../../bin/autoinst -verbose -target="$PWD" -noupdmap "$dirname"/*.[ot]tf
    done
fi
../../bin/autoinst -verbose -target="$PWD" -noupdmap -defaultproportional -inferiors ../testfiles/cormorantgaramond/*.[ot]tf
../../bin/autoinst -verbose -target="$PWD" -noupdmap -defaultproportional -inferiors none ../testfiles/cormorantgaramond/*.[ot]tf
../../bin/autoinst -verbose -target="$PWD" -noupdmap -nfssweight=m=medium ../testfiles/franklingothic/*.[ot]tf
../../bin/autoinst -verbose -target="$PWD" -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular')
../../bin/autoinst -verbose -target="$PWD" -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular|medium')
cd ../..
