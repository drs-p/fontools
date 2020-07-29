#! /bin/sh

AUTOINST=../../bin/autoinst

rm -rf test/output
mkdir -p test/output
cd test/output
if [ -x "$(command -v parallel)" ]; then
    parallel $AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -pfb-suffix -inferiors {}/*.[ot]tf ::: ../testfiles/*
else
    for dirname in ../testfiles/*; do
        $AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -pfb-suffix -inferiors "$dirname"/*.[ot]tf
    done
fi
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -defaultproportional -pfb-suffix ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -nfssweight=m=medium -pfb-suffix ../testfiles/franklingothic/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -inferiors=subs -pfb-suffix ../testfiles/lato/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -pfb-suffix $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular')
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -pfb-suffix $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular|medium')
cd ../..
