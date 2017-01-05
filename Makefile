# Makefile -- helps manage cookbook sources
#
# Copyright 2016 Samuel Sirois (sds) <samuel@sirois.info>
#
# This file is part of cookbook web publisher.
#
# cookbook web publisher is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cookbook web publisher is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cookbook web publisher.  If not, see <http://www.gnu.org/licenses/>.

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))
TEST_FILES:=$(call rwildcard,./tests/,*_test.sh)
TEST_TARGETS=$(patsubst %,check_%,$(TEST_FILES))

.PHONY: check
check: $(TEST_TARGETS)

check_%:
	shunit2 $(*)

check_./%:
	shunit2 $(*)
