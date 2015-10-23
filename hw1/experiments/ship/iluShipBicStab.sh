#!/bin/bash

cd ../..
echo -e "------------------Ilu bicgstab-------------------------------- "
./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 0
valgrind ./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 0
./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 0
valgrind ./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 0
./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 1
valgrind ./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 10 --tolerance 1.e-10 --ilu-level 1
./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 1
valgrind ./ilu --method bicgstab --file ./ship_003/ship_003.mtx --nvectors 100 --tolerance 1.e-10 --ilu-level 1


