# bellhopcxx / bellhopcuda - C++/CUDA port of BELLHOP / BELLHOP3D underwater acoustics simulator
# Copyright (C) 2021-2023 The Regents of the University of California
# Marine Physical Lab at Scripps Oceanography, c/o Jules Jaffe, jjaffe@ucsd.edu
# Based on BELLHOP / BELLHOP3D, which is Copyright (C) 1983-2022 Michael B. Porter
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

cmake_minimum_required(VERSION 3.9)
project(bhcexamples LANGUAGES CXX)

include(../SetupCommon.cmake)

function(create_example EXNAME)
    add_executable(${EXNAME}
        ${CMAKE_SOURCE_DIR}/examples/${EXNAME}.cpp
    )
    target_link_libraries(${EXNAME} PUBLIC bellhopcxxlib Threads::Threads)
    target_include_directories(${EXNAME} PUBLIC "${CMAKE_SOURCE_DIR}/include")
    target_include_directories(${EXNAME} PUBLIC "${CMAKE_SOURCE_DIR}/glm")
endfunction()

create_example(defaults)
create_example(readout)
create_example(writeenv)
