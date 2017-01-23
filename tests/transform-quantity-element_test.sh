# transform-quantity-element_test.sh -- tests the quantity element transformation
#
# Copyright 2017 Samuel Sirois (sds) <samuel@sirois.info>
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

testThatAMilliliterQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"ml\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"milliliters\">ml</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatACentiliterQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"cl\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"centiliters\">cl</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatADeciliterQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"dl\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"deciliters\">dl</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatALitreQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"l\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"litres\">l</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatACupQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"c\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"cups\">c</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatATablespoonQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"tbsp\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"tablespoons\">tbsp</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatATeaspoonQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"tsp\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"teaspoons\">tsp</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatAPoundQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"lb\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"pounds\">lb</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatAGramQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"g\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"grams\">g</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatAKilogramQuantityIsTransformedAsAnAbbreviation() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><quantity unit=\"kg\">1</quantity></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\"><span>1 <abbr title=\"kilograms\">kg</abbr></span></li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

oneTimeSetUp() {
  xsltprocCmd='xsltproc --encoding UTF-8 src/xslt/recipe2html.xslt -'
  xpathCmd='xpath -q -e'
  xmldocHeader='<?xml version="1.0" encoding="UTF-8"?>'
}

. tests/test-helpers.sh
