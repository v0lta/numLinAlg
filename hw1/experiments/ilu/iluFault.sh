#!/bin/bash

cd ../..
echo -e "------------------Ilu gmres-------------------------------- "
./ilu --method gmres --file ./Fault_639/Fault_639.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu bicgstab----------------------------- "
./ilu --method bicgstab --file ./Fault_639/Fault_639.mtx  --tolerance 1.e-10 --ilu-level 1 
echo -e "------------------Ilu idr --------------------------------- " 
./ilu --method idr --file ./Fault_639/Fault_639.mtx  --tolerance 1.e-10 --ilu-level 1
echo -e "------------------Ilu Spectrum ---------------------------- "
./ilu --method spectrum --file ./Fault_639/Fault_639.mtx  --tolerance 1.e-10 --ilu-level 1
