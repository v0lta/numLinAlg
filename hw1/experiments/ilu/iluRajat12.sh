#!/bin/bash

cd ../..
echo -e "------------------10 vectors-------------------------------- "
echo -e "------------------Ilu gmres-------------------------------- "
./ilu --method gmres --file ./rajat12/rajat12.mtx  --nvectors 10 --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu bicgstab----------------------------- "
./ilu --method bicgstab --file ./rajat12/rajat12.mtx --nvectors 10  --tolerance 1.e-10 --ilu-level 1 
echo -e "------------------100 vectors-------------------------------- "
echo -e "------------------Ilu gmres-------------------------------- "
./ilu --method gmres --file ./rajat12/rajat12.mtx  --nvectors 100 --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu bicgstab----------------------------- "
./ilu --method bicgstab --file ./rajat12/rajat12.mtx --nvectors 100  --tolerance 1.e-10 --ilu-level 1 
