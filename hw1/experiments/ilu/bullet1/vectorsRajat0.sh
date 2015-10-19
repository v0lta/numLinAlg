#!/bin/bash

cd ../../..
echo -e "------------------vectors vary----------------------------- "
echo -e "------------------Ilu gmres-------------------------------- "
for vectors in {10..100}
do
   ./ilu --method gmres --file ./rajat12/rajat12.mtx  --nvectors $vectors --tolerance 1.e-10 --ilu-level 0
done
