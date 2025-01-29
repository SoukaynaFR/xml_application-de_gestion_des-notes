<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:template match="/">
      <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
         <fo:layout-master-set>
            <fo:simple-page-master master-name="simple" page-width="8.5in" page-height="11in" margin="1cm">
               <fo:region-body margin="1cm"/>
            </fo:simple-page-master>
         </fo:layout-master-set>
         <fo:page-sequence master-reference="simple">
            <fo:flow flow-name="xsl-region-body">
               <fo:block font-family="Arial" font-size="18pt" font-weight="bold" text-align="center" margin-bottom="12pt">Liste des étudiants convoqués au rattrapage du module GINF33</fo:block>
               <fo:block space-after="12pt"/>
               <fo:block text-align="center">
                  <fo:table border-collapse="separate" border="1pt solid black">
                     <fo:table-column column-width="auto"/>
                     <fo:table-column column-width="auto"/>
                     <fo:table-column column-width="auto"/>
                     <fo:table-header>
                        <fo:table-row>
                           <fo:table-cell padding="3pt" border="solid 1pt black">
                              <fo:block font-weight="bold">Nom</fo:block>
                           </fo:table-cell>
                           <fo:table-cell padding="3pt" border="solid 1pt black">
                              <fo:block font-weight="bold">Prénom</fo:block>
                           </fo:table-cell>
                           <fo:table-cell padding="3pt" border="solid 1pt black">
                              <fo:block font-weight="bold">Moyenne</fo:block>
                           </fo:table-cell>
                        </fo:table-row>
                     </fo:table-header>
                     <fo:table-body>
                        <xsl:for-each select="//Module[@code='GINF31']/Students/Student[moyenne &lt; 12]">
                           <fo:table-row border="1pt solid black">
                              <fo:table-cell border="1pt solid black"><fo:block text-align="center"><xsl:value-of select="lastName"/></fo:block></fo:table-cell>
                              <fo:table-cell border="1pt solid black"><fo:block text-align="center"><xsl:value-of select="firstName"/></fo:block></fo:table-cell>
                              <fo:table-cell border="1pt solid black"><fo:block text-align="center"><xsl:value-of select="moyenne"/></fo:block></fo:table-cell>
                           </fo:table-row>
                        </xsl:for-each>
                     </fo:table-body>
                  </fo:table>
               </fo:block>
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>
</xsl:stylesheet>
