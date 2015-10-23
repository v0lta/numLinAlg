#!/bin/bash

cd ../..
echo -e "------------------Ilu gmres-------------------------------- "
./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 0
valgrind ./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 0
./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 0
valgrind ./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 0
./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 1
valgrind ./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 1
./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 1
valgrind ./ilu --method gmres --file ./Fault_639/Fault_639.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 1


