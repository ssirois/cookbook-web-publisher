<!--
directions2html.xslt — declares transformation rules for directions

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
