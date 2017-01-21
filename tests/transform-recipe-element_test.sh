# transform-recipe-element_test.sh -- tests the recipe element transformation
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

testThatARecipeElementIsTransformAsAnHtmlDocument() {
  xmldoc="$xmldocHeader<recipe />"
  htmldoc=`echo ${xmldoc} | ${xsltprocCmd}`

  isHtmlDocumentValid "${htmldoc}"
  isValid=$?

  assertTrue "Not a valid HTML document." ${isValid}
}

testThatARecipeElementNameIsLocatedInTheHtmlDocumentTitle() {
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
  </recipe>"

  xPathQueryTest="/html/head/title"
  
  expected="<title>My Recipe</title>"
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  assertEquals "${expected}" "${actual}"
}

testThatAnArticleStartingAnhRecipeMicroformatIsRenderedAsFirstChildOfHtmlBody() {
  xmldoc="$xmldocHeader<recipe />"

  xPathQueryTest="(/html/body/*[1])"

  expected="<article class=\"h-recipe\" />"
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  assertEquals "${expected}" "${actual}"
}

testThatARecipeTitleIsRenderedAsAHeaderLevelOneIdentifiedWithApNameMicroformatProperty() {
  xmldoc="$xmldocHeader
    <recipe>
      <name>My Recipe</name>
    </recipe>
  "

  xPathQueryTest="//h1[@class='p-name']"

  expected="<h1 class=\"p-name\">My Recipe</h1>"
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  assertEquals "${expected}" "${actual}"
}

testThatARecipeSummaryIsRenderedAsAParagrapheIdentifiedWithApSummaryMicroformatProperty() {
  xmldoc="$xmldocHeader
    <recipe>
      <description>My description.</description>
    </recipe>
  "

  xPathQueryTest="//p[@class='p-summary']"

  expected="<p class=\"p-summary\">My description.</p>"
  actual=`echo ${xmldoc} | ${xsltprocCmd} | ${xpathCmd} ${xPathQueryTest}`

  assertEquals "${expected}" "${actual}"
}

oneTimeSetUp() {
  xsltprocCmd='xsltproc --encoding UTF-8 src/xslt/recipe2html.xslt -'
  xpathCmd='xpath -q -e'
  xmldocHeader='<?xml version="1.0" encoding="UTF-8"?>'
}

. tests/test-helpers.sh
