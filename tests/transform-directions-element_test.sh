# transform-directions-element_test.sh -- tests the descriptions element transformation
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

testThatDirectionsAreTransformedAsAnOrderedListIdentifiedWithAneInstructionsMicroformatProperty() {
  xmldoc="$xmldocHeader
    <recipe>
      <directions />
    </recipe>
  "

  xPathQueryTest="//ol[@class='e-instructions']"

  expected="<ol class=\"e-instructions\" />"
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  assertEquals "${expected}" "${actual}"
}

testThatADirectionIsTransformedAsAListItem() {
  xmldoc="$xmldocHeader
    <recipe>
      <directions>
        <direction>Do something</direction>
      </directions>
    </recipe>
  "

  xPathQueryTest="//ol[@class='e-instructions']"

  expected="
    <ol class=\"e-instructions\">
      <li>Do something</li>
    </ol>
  "
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatAHeaderLevelTwoAnnouncesTheIngredientList() {
  xmldoc="$xmldocHeader
    <recipe>
      <directions />
    </recipe>
  "

  xPathQueryTest="//ol[@class='e-instructions']/preceding-sibling::h2"

  expected="<h2>Directions</h2>"
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  assertEquals "${expected}" "${actual}"
}

oneTimeSetUp() {
  xsltprocCmd='xsltproc --encoding UTF-8 src/xslt/recipe2html.xslt -'
  xpathCmd='xpath -q -e'
  xmldocHeader='<?xml version="1.0" encoding="UTF-8"?>'
}

. tests/test-helpers.sh
