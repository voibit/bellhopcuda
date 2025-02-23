#!/bin/bash
# bellhopcxx / bellhopcuda - C++/CUDA port of BELLHOP underwater acoustics simulator
# Copyright (C) 2021-2022 The Regents of the University of California
# c/o Jules Jaffe team at SIO / UCSD, jjaffe@ucsd.edu
# Based on BELLHOP, which is Copyright (C) 1983-2020 Michael B. Porter
# 
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.

set -e

run_kind() {
    kind=$1
    ./run_tests.sh $kind gen_${kind}_pass
    ./run_tests.sh $kind gen_${kind}_fail shouldfail
}

run_rev() {
    kind=$1
    ./run_tests.sh tl${kind} genrev_${kind}_pass
    ./run_tests.sh tl${kind} genrev_${kind}_fail shouldfail
}

run_kind ray2D
run_kind tl2D
run_kind eigen2D
run_kind arr2D
run_rev 2D

run_kind ray3D
run_kind tl3D
run_kind eigen3D
run_kind arr3D
run_rev 3D

run_kind rayNx2D
run_kind tlNx2D
run_kind eigenNx2D
run_kind arrNx2D

echo "================"
echo "Done with script"
echo "================"
exit 0
