#! /bin/bash

AUTOINST=../../bin/autoinst

# Most testcases use -dryrun to speed up execution

rm -rf test/output
mkdir -p test/output
cd test/output
if [[ -x "$(command -v parallel)" ]]; then
    parallel $AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors {}/*.[ot]tf ::: ../testfiles/*
else
    for dirname in ../testfiles/*; do
        $AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors "$dirname"/*.[ot]tf
    done
fi

$AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -inferiors -defaultproportional      -t1suffix ../testfiles/cormorantgaramond/*.[ot]tf
$AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -inferiors -nfssweight=m=medium      -t1suffix ../testfiles/franklingothic/*.[ot]tf
$AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -inferiors=subs                      -t1suffix ../testfiles/lato/*.[ot]tf
$AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -inferiors -nfssweight=m=medium      -t1suffix $(ls ../testfiles/saira/*.[ot]tf)
$AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -inferiors -noproportional           -t1suffix $(ls ../testfiles/saira/*.[ot]tf | egrep -iv 'regular|-italic')
$AUTOINST -dryrun -verbose -target="$PWD" -enc=OT1,T1 -inferiors                           -t1suffix $(ls ../testfiles/saira/*.[ot]tf | egrep -iv 'regular|-italic|medium')

# Run a few tests without -dryrun
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors ../testfiles/dolly/*.otf
$AUTOINST -verbose -target="$PWD" -enc=OT1,T1 -t1suffix -inferiors ../testfiles/go/*.ttf

cd ../..
