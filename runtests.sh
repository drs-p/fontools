#! /bin/sh

AUTOINST=../../bin/autoinst

rm -rf test/output
mkdir -p test/output
cd test/output
if [ -x "$(command -v parallel)" ]; then
    parallel $AUTOINST -verbose -target="$PWD" -noupdmap {}/*.[ot]tf ::: ../testfiles/*
else
    for dirname in ../testfiles/*; do
        $AUTOINST -verbose -target="$PWD" -noupdmap "$dirname"/*.[ot]tf
    done
fi
$AUTOINST -verbose -target="$PWD" -noupdmap -defaultproportional -inferiors ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -defaultproportional -inferiors none ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -nfssweight=m=medium ../testfiles/franklingothic/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular')
$AUTOINST -verbose -target="$PWD" -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular|medium')
cd ../..
