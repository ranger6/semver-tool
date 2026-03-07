#	"bats" test script for semver 2.0.0 specification (https://semver.org/)
#
#	see: "general.bats" for more information

# SPDX-License-Identifier: Apache-2.0
#
# Copyright 2013 François Saint-Jacques <fsaintjacques@gmail.com>  
# Copyright 2014-2026 François Saint-Jacque and other contributors
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SEMVER="src/semver"

@test "missing arg in validate" {
	run $SEMVER validate 
	[ "$status" -eq 1 ]
}

@test "correct arg in validate" {
	run $SEMVER validate 1.2.2
	[ "$status" -eq 0 ]
}

@test "too many args in validate" {
	run $SEMVER validate 1.2.2 1.0.0
	[ "$status" -eq 1 ]
}

@test "invalid semver with major only" {
	result="$($SEMVER validate 1)"
	[ "$result" = "invalid" ]
}

@test "invalid semver with minor only" {
	result="$($SEMVER validate 1.1)"
	[ "$result" = "invalid" ]
}

@test "valid semver with major/minor/patch" {
	result="$($SEMVER validate 1.1.1)"
	[ "$result" = "valid" ]
}

@test "invalid semver with pre-release" {
	result="$($SEMVER validate 1.1.1-)"
	[ "$result" = "invalid" ]
}

@test "valid semver with pre-release" {
	result="$($SEMVER validate 1.1.1-1)"
	[ "$result" = "valid" ]
}

@test "invalid semver with build" {
	result="$($SEMVER validate 1.1.1+)"
	[ "$result" = "invalid" ]
}

@test "valid semver with build" {
	result="$($SEMVER validate 1.1.1+1)"
	[ "$result" = "valid" ]
}

@test "valid semver with pre-release and build" {
	result="$($SEMVER validate 1.1.1-1+1)"
	[ "$result" = "valid" ]
}
