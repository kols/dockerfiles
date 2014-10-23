#!/bin/sh
WHEELHOUSE=/wheelhouse
REQUIREMENTS=$WHEELHOUSE/requirements.txt

test -f $REQUIREMENTS && rm $REQUIREMENTS
while read LINE; do
    echo $LINE >> $REQUIREMENTS
done
pip wheel -w $WHEELHOUSE -f $WHEELHOUSE -r $REQUIREMENTS
