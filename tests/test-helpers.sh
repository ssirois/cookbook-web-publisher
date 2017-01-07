# test-helpers.sh -- helper functions used in tests
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

isHtmlDocumentValid() {
  htmlDocument=$1
  echo "${htmlDocument}" | tidy -quiet -file /dev/null -output /dev/null

  # a warning is OK
  if [ $? -eq 1 ]
  then
    return 0
  else
    return 1
  fi
}
