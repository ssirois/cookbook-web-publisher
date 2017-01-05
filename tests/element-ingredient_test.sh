# element-ingredient_test.sh -- tests the description element rules
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

testThatAnIngredientElementCannotBeEmpty()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient />
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertEquals ${xmllint_error_validation_error} ${actual}
}

testThatAnIngredientElementCanHaveAName()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"ml\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAnIngredientElementCanHaveAQuantity()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"ml\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

oneTimeSetUp()
{
  xmllintCmd='xmllint --nonet --dtdvalid ./src/dtd/cookbook.dtd --xinclude --postvalid --noout -'
  xmldocHeader='<?xml version="1.0"?>'

  xmllint_error_validation_error=3
}
