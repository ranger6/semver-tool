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

@test "diff versions (major)" {
	result="$($SEMVER diff 1.2.3 2.3.4)"
	[ "$result" = "major" ]
}

@test "diff versions (minor)" {
	result="$($SEMVER diff 1.2.3 1.3.4)"
	[ "$result" = "minor" ]
}

@test "diff versions (patch)" {
	result="$($SEMVER diff 1.2.3 1.2.4)"
	[ "$result" = "patch" ]
}

@test "diff versions (prerelease)" {
	result="$($SEMVER diff 1.2.3-alpha 1.2.3-beta)"
	[ "$result" = "prerelease" ]
}

@test "diff versions (equal)" {
	result="$($SEMVER diff 1.2.3 1.2.3)"
	[ "$result" = "" ]
}
