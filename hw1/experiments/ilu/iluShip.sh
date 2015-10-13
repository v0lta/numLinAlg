#!/bin/bash

cd ../..
echo -e "------------------Ilu gmres-------------------------------- "
./ilu --method gmres --file ./ship_003/ship_003.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu bicgstab----------------------------- "
./ilu --method bicgstab --file ./ship_003/ship_003.mtx  --tolerance 1.e-10 --ilu-level 1 
echo -e "------------------Ilu idr --------------------------------- " 
./ilu --method idr --file ./ship_003/ship_003.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu Spectrum ---------------------------- "
./ilu --method spectrum --file ./ship_003/ship_003.mtx  --tolerance 1.e-10 --ilu-level 1
