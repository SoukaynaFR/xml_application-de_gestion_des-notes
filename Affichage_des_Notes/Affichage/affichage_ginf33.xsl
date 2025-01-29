<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:template match="/">
      <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
         <fo:layout-master-set>
            <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
               <fo:region-body/>
            </fo:simple-page-master>
         </fo:layout-master-set>
         <fo:page-sequence master-reference="simpleA4">
            <fo:flow flow-name="xsl-region-body">
               <fo:block font-size="16pt" font-weight="bold" text-align="center" margin-bottom="10pt">Affichage de Module GINF33
               </fo:block>
               <fo:block margin-bottom="20pt"/> <!-- Adding space between title and table -->
               <fo:table border="1pt solid black" width="100%">
                  <fo:table-column column-width="30%"/>
                  <fo:table-column column-width="30%"/>
                  <fo:table-column column-width="%"/>
                  <fo:table-column column-width="10%"/>
                  <fo:table-header>
                     <fo:table-row>
                        <fo:table-cell padding="3pt" border="solid 1pt black">
                           <fo:block font-weight="bold">lastName</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="3pt" border="solid 1pt black">
                           <fo:block font-weight="bold">firstName</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="3pt" border="solid 1pt black">
                           <fo:block font-weight="bold">moyenne</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="3pt" border="solid 1pt black">
                           <fo:block font-weight="bold">Statut</fo:block>
                        </fo:table-cell>
                     </fo:table-row>
                  </fo:table-header>
                  <fo:table-body>
                     <xsl:for-each select="//Module[@code='GINF31']/Students/Student">
                        <fo:table-row>
                           <fo:table-cell padding="3pt" border="solid 1pt black">
                              <fo:block><xsl:value-of select="lastName"/></fo:block>
                           </fo:table-cell>
                           <fo:table-cell padding="3pt" border="solid 1pt black">
                              <fo:block><xsl:value-of select="firstName"/></fo:block>
                           </fo:table-cell>
                           <fo:table-cell padding="3pt" border="solid 1pt black">
                              <fo:block><xsl:value-of select="moyenne"/></fo:block>
                           </fo:table-cell>
                           <fo:table-cell padding="3pt" border="solid 1pt black">
                              <fo:block text-align="center">
                                 <xsl:variable name="status">
                                    <xsl:choose>
                                       <xsl:when test="moyenne &gt;= 12">V</xsl:when>
                                       <xsl:when test="moyenne &gt;= 8 and moyenne &lt; 12">R</xsl:when>
                                       <xsl:otherwise>NV</xsl:otherwise>
                                    </xsl:choose>
                                 </xsl:variable>
                                 <fo:block>
                                    <xsl:attribute name="background-color">
                                       <xsl:choose>
                                          <xsl:when test="$status = 'V'">#2cf82c</xsl:when>
                                          <xsl:when test="$status = 'R'">orange</xsl:when>
                                          <xsl:otherwise>red</xsl:otherwise>
                                       </xsl:choose>
                                    </xsl:attribute>
                                    <fo:inline>
                                       <xsl:value-of select="$status"/>
                                    </fo:inline>
                                 </fo:block>
                              </fo:block>
                           </fo:table-cell>
                        </fo:table-row>
                     </xsl:for-each>
                  </fo:table-body>
               </fo:table>
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>
</xsl:stylesheet>
