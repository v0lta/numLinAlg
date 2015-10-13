#!/bin/bash

cd ..
echo -e "------------------Ilu gmres-------------------------------- "
./ilu --method gmres --file ./rajat12/rajat12.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu bicgstab----------------------------- "
./ilu --method bicgstab --file ./rajat12/rajat12.mtx  --tolerance 1.e-10 --ilu-level 1 
echo -e "------------------Ilu idr --------------------------------- " 
./ilu --method idr --file ./rajat12/rajat12.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu Spectrum ---------------------------- "
./ilu --method spectrum --file ./rajat12/rajat12.mtx  --tolerance 1.e-10 --ilu-level 1


