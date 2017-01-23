<!--
recipe2html.xslt — declares transformation rules for a recipe document

Copyright 2016 Samuel Sirois (sds) <samuel@sirois.info>

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
  <xsl:output method="xml" omit-xml-declaration="yes" />

  <xsl:template match="/recipe">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <xsl:element name="html">
      <xsl:element name="head">
        <xsl:if test="./name != ''">
          <xsl:element name="title">
            <xsl:value-of select="./name" />
          </xsl:element>
        </xsl:if>
      </xsl:element>
      <xsl:element name="body">
        <xsl:element name="article">
          <xsl:attribute name="class">h-recipe</xsl:attribute>
          
          <xsl:apply-templates />
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="name">
    <xsl:element name="h1">
      <xsl:attribute name="class">p-name</xsl:attribute>

      <xsl:value-of select="." />
    </xsl:element>
  </xsl:template>

  <xsl:template match="description">
    <xsl:element name="p">
      <xsl:attribute name="class">p-summary</xsl:attribute>

      <xsl:value-of select="." />
    </xsl:element>
  </xsl:template>

  <xsl:template match="ingredients">
    <xsl:element name="ul">
      <xsl:attribute name="class">ingredients</xsl:attribute>

      <xsl:apply-templates select="ingredient" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="ingredient">
    <xsl:element name="li">
      <xsl:attribute name="class">p-ingredient</xsl:attribute>

      <xsl:apply-templates select="quantity" />

      <xsl:value-of select="./name" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="quantity">
    <xsl:element name="span">
      <xsl:value-of select="." />
      <xsl:text> </xsl:text>

      <xsl:apply-templates mode="transform-unit" select="." />
    </xsl:element>
  </xsl:template>

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

  <xsl:template match="directions">
    <xsl:element name="ol">
      <xsl:attribute name="class">e-instructions</xsl:attribute>

      <xsl:apply-templates select="direction" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="direction">
    <xsl:element name="li">
      <xsl:value-of select="." />
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
