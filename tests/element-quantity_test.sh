# element-quantity_test.sh -- tests the quantity element rules
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

testThatAQuantityMustHaveAUnitAttribute()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertEquals ${xmllint_error_validation_error} ${actual}
}

testThatAQuantityUnitCanBeML()
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

testThatAQuantityUnitCanBeCL()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"cl\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeDL()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"dl\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeL()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"l\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeC()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"c\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeTSP()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"tsp\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeTBSP()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"tbsp\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeLB()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"lb\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeG()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"g\" />
      </ingredient>
    </ingredients>
    <directions><direction /></directions>
  </recipe>"
  echo "${xmldoc}" | ${xmllintCmd}
  actual=$?

  assertTrue "xmllint returned an error code (${actual})" ${actual}
}

testThatAQuantityUnitCanBeKG()
{
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
    <ingredients>
      <ingredient>
        <name>First Ingredient</name>
        <quantity unit=\"kg\" />
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
