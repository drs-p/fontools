#! /bin/sh

AUTOINST=../../bin/autoinst

rm -rf test/output
mkdir -p test/output
cd test/output
if [ -x "$(command -v parallel)" ]; then
    parallel $AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -noupdmap {}/*.[ot]tf ::: ../testfiles/*
else
    for dirname in ../testfiles/*; do
        $AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -noupdmap "$dirname"/*.[ot]tf
    done
fi
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -noupdmap -defaultproportional -inferiors ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -noupdmap -defaultproportional -inferiors none ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -noupdmap -nfssweight=m=medium ../testfiles/franklingothic/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular')
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -noupdmap $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular|medium')
cd ../..
