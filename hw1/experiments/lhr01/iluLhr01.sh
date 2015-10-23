#!/bin/bash

cd ../..
echo -e "------------------Ilu gmres-------------------------------- "
./ilu --method gmres --file ./lhr01/lhr01.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu bicgstab----------------------------- "
./ilu --method bicgstab --file ./lhr01/lhr01.mtx  --tolerance 1.e-10 --ilu-level 1 
echo -e "------------------Ilu idr --------------------------------- " 
./ilu --method idr --file ./lhr01/lhr01.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu Spectrum ---------------------------- "
./ilu --method spectrum --file ./lhr01/lhr01.mtx  --tolerance 1.e-10 --ilu-level 1

