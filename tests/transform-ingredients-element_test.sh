# transform-ingredients-element_test.sh -- tests the ingredients element transformation
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

testThatIngredientsAreTransformedAsAnUnorderedListIdentifiedWithAningredientClass() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients />
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="<ul class=\"ingredients\" />"
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  assertEquals "${expected}" "${actual}"
}

testThatAnIngredientIsTransformedAsAListItemIdentifiedWithApIngredientMicroformatProperty() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><name>One ingredient</name></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\">One ingredient</li>
    </ul>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatAllIngredientsAreTransformedAsListItemsIdentifiedWithApIngredientMicroformatProperty() {
  xmldoc="$xmldocHeader
    <recipe>
      <ingredients>
        <ingredient><name>First ingredient</name></ingredient>
        <ingredient><name>Second ingredient</name></ingredient>
      </ingredients>
    </recipe>
  "

  xPathQueryTest="//ul[@class='ingredients']"

  expected="
    <ul class=\"ingredients\">
      <li class=\"p-ingredient\">First ingredient</li>
      <li class=\"p-ingredient\">Second ingredient</li>
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
