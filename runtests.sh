#! /bin/sh

AUTOINST=../../bin/autoinst

rm -rf test/output
mkdir -p test/output
cd test/output
if [ -x "$(command -v parallel)" ]; then
    parallel $AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors {}/*.[ot]tf ::: ../testfiles/*
else
    for dirname in ../testfiles/*; do
        $AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors "$dirname"/*.[ot]tf
    done
fi
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -defaultproportional -t1suffix -inferiors ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -nfssweight=m=medium -t1suffix -inferiors ../testfiles/franklingothic/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -inferiors=subs -t1suffix ../testfiles/lato/*.[ot]tf
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular')
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors $(ls ../testfiles/sourcecodepro/*.[ot]tf | egrep -iv 'regular|medium')
cd ../..
