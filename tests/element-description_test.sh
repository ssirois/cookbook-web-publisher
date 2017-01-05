# element-description_test.sh -- tests the description element rules
#
# Copyright 2016 Samuel Sirois (sds) <samuel@sirois.info>
#
# This file is part of cookbook.
#
# cookbook is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cookbook is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cookbook.  If not, see <http://www.gnu.org/licenses/>.

oneTimeSetUp()
{
  xmllintCmd='xmllint --nonet --dtdvalid ./src/dtd/cookbook.dtd --xinclude --postvalid --noout -'
  xmldocHeader='<?xml version="1.0"?>'

  xmllint_error_validation_error=3
}
