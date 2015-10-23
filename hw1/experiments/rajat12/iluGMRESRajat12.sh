#!/bin/bash

cd ../..
echo -e "------------------ilu 1------------------------------------- "
echo -e "------------------10 vectors-------------------------------- "
echo -e "------------------Ilu bicgstab------------------------------ "
valgrind ./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 10  --tolerance 1.e-10 --ilu-level 1 
./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 10  --tolerance 1.e-10 --ilu-level 1 
echo -e "------------------100 vectors-------------------------------- "
valgrind ./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 100  --tolerance 1.e-10 --ilu-level 1 
./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 100  --tolerance 1.e-10 --ilu-level 1 
echo -e "------------------ilu 0------------------------------------- "
echo -e "------------------10 vectors-------------------------------- "
valgrind ./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 10  --tolerance 1.e-10 --ilu-level 0
./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 10  --tolerance 1.e-10 --ilu-level 0
echo -e "------------------100 vectors-------------------------------- "
valgrind ./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 100  --tolerance 1.e-10 --ilu-level 0
./ilu --method gmres --file ./rajat12/rajat12.mtx --nvectors 100  --tolerance 1.e-10 --ilu-level 0
