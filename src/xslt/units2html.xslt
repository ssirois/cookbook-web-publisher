<!--
units2html.xslt — declares transformation rules for units

Copyright 2017 Samuel Sirois (sds) <samuel@sirois.info>

This file is part of cookbook web publisher.

cookbook web publisher is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

cookbook web publisher is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with cookbook web publisher.  If not, see <http://www.gnu.org/licenses/>.
-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="*[@unit='ml']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">milliliters</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='cl']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">centiliters</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='dl']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">deciliters</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='l']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">litres</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='c']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">cups</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='tbsp']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">tablespoons</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='tsp']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">teaspoons</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='lb']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">pounds</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='g']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">grams</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@unit='kg']" mode="transform-unit">
    <xsl:element name="abbr">
      <xsl:attribute name="title">kilograms</xsl:attribute>

      <xsl:value-of select="./@unit" />
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
