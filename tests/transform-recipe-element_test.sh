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
  expected="<!DOCTYPE html>
  <html>
    <head>
      <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
    </head>
  </html>"
  
  actual=`echo ${xmldoc} | ${xsltprocCmd}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

testThatARecipeElementNameIsLocatedInTheHtmlDocumentTitle() {
  xmldoc="$xmldocHeader
  <recipe>
    <name>My Recipe</name>
  </recipe>"
  expected="<!DOCTYPE html>
  <html>
    <head>
      <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
      <title>My Recipe</title>
    </head>
  </html>"
  actual=`echo ${xmldoc} | ${xsltprocCmd}`

  expected=`removeXMLIndentation "${expected}"`
  actual=`removeXMLIndentation "${actual}"`
  assertEquals "${expected}" "${actual}"
}

oneTimeSetUp() {
  xsltprocCmd='xsltproc --encoding UTF-8 src/xslt/recipe2html.xslt -'
  xmldocHeader='<?xml version="1.0" encoding="UTF-8"?>'
}

. tests/test-helpers.sh
