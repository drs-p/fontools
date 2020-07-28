#! /bin/sh

AUTOINST=../../bin/autoinst

rm -rf test/output
mkdir -p test/output
cd test/output
if [ -x "$(command -v parallel)" ]; then
    parallel $AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -inferiors {}/*.[ot]tf ::: ../testfiles/*
else
    for dirname in ../testfiles/*; do
        $AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -inferiors "$dirname"/*.[ot]tf
    done
fi
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -defaultproportional ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -nfssweight=m=medium ../testfiles/franklingothic/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -inferiors=subs ../testfiles/lato/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular')
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular|medium')
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -pfb-suffix ../testfiles/librecaslon/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -pfb-suffix ../testfiles/merriweathertext/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -noupdmap -enc=OT1,T1 -pfb-suffix ../testfiles/sourcecodepro/*.[ot]tf
cd ../..
