#!/bin/bash

cp ../ViSimplRunbook/source/02-Runbook.rst ./source/05-Runbook.rst

mkdir -p ./source/images
cp ../ViSimplRunbook/source/images/RBi* ./source/images

make latexpdf
make html

