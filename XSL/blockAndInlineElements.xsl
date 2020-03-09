<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--Inline Elements-->
	<xsl:template match="b">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="i">
		<i>
			<xsl:value-of select="."/>
		</i>
	</xsl:template>
	<!--Block Elements-->
   <xsl:template match="media">
      <p class="figure">
         <xsl:element name="img">
            <xsl:choose>
               <xsl:when test="@type='imageLocal'">
                  <xsl:attribute name="src">images/<xsl:value-of select="@url"
                  /></xsl:attribute>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:attribute name="src">
                     <xsl:value-of select="@url"/>
                  </xsl:attribute>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:attribute name="alt">
               <xsl:value-of select="caption"/>
            </xsl:attribute>
            <xsl:if test="@style">
               <xsl:attribute name="style">
                  <xsl:value-of select="@style"/>
               </xsl:attribute>
            </xsl:if>
         </xsl:element>
      </p>
      <p class="figure_caption">
         <xsl:apply-templates select="caption"/>
      </p>
   </xsl:template>
   
</xsl:stylesheet>
