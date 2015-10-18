#!/bin/bash

cd ../../..
echo -e "------------------vectors vary----------------------------- "
echo -e "------------------Ilu gmres-------------------------------- "
for vectors in {10..100}
do
   ./ilu --method gmres --file ./ship_003/ship_003.mtx  --nvectors $vectors --tolerance 1.e-10 --ilu-level 1
done

