#!/bin/bash

RUN=$1
BRICKID=$2    #put brick id
BRICKFOLDER="$(printf "b%0*d" 6 $BRICKID)"
PLATENUMBER=$3

echo "Set up SND environment"
SNDBUILD_DIR=/afs/cern.ch/user/d/dannc/sw
source /cvmfs/sndlhc.cern.ch/SNDLHC-2023/Aug30/setUp.sh
eval `alienv load -w $SNDBUILD_DIR --no-refresh sndsw/latest`
source /afs/cern.ch/user/d/dannc/setup_fedrarelease.sh	

echo  "go into reconstruction folder "
cd /eos/experiment/sndlhc/users/dancc/emureco/Napoli/RUN${RUN}/${BRICKFOLDER}

echo "viewsideal $BRICKID.$PLATENUMBER.0.0"
source viewsideal.sh $BRICKID $PLATENUMBER

#echo "mostag $BRICKID.$PLATENUMBER.0.0"
#source mostag.sh $BRICKID $PLATENUMBER
