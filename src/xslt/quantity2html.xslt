<!--
quantity2html.xslt — declares transformation rules for the quantity element

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

  <xsl:include href="units2html.xslt" />

  <xsl:template match="quantity">
    <xsl:element name="span">
      <xsl:value-of select="." />
      <xsl:text> </xsl:text>

      <xsl:apply-templates mode="transform-unit" select="." />
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
