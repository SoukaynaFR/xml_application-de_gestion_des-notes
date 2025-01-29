<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.w3.org/1999/XSL/Format "
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date">
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm"
                                       margin-bottom="0.5cm" margin-left="1cm" margin-right="1cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
             <fo:page-sequence master-reference="simpleA4">         
                <fo:flow flow-name="xsl-region-body">
                    <xsl:variable name="n1" select="etudiant/NOTES/note[1]/note_elm[1]"/>
                    <xsl:variable name="n2" select="etudiant/NOTES/note[1]/note_elm[2]"/>
                    <xsl:variable name="n3" select="etudiant/NOTES/note[2]/note_elm[1]"/>
                    <xsl:variable name="n4" select="etudiant/NOTES/note[2]/note_elm[2]"/>
                    <xsl:variable name="n5" select="etudiant/NOTES/note[2]/note_elm[3]"/>
                    <xsl:variable name="n6" select="etudiant/NOTES/note[3]/note_elm[1]"/>
                    <xsl:variable name="n7" select="etudiant/NOTES/note[3]/note_elm[2]"/>
                    <xsl:variable name="n8" select="etudiant/NOTES/note[3]/note_elm[3]"/>
                    <xsl:variable name="n9" select="etudiant/NOTES/note[4]/note_elm[1]"/>
                    <xsl:variable name="n10" select="etudiant/NOTES/note[4]/note_elm[2]"/>
                    <xsl:variable name="n11" select="etudiant/NOTES/note[4]/note_elm[3]"/>
                    <xsl:variable name="n12" select="etudiant/NOTES/note[5]/note_elm[1]"/>
                    <xsl:variable name="n13" select="etudiant/NOTES/note[5]/note_elm[2]"/>
                    <xsl:variable name="n14" select="etudiant/NOTES/note[6]/note_elm[1]"/>
                    <xsl:variable name="n15" select="etudiant/NOTES/note[6]/note_elm[2]"/>
                    <xsl:variable name="n16" select="etudiant/NOTES/note[6]/note_elm[3]"/>
                    <xsl:variable name="n17" select="etudiant/NOTES/note[7]/note_elm[1]"/>
                    <xsl:variable name="n18" select="etudiant/NOTES/note[7]/note_elm[2]"/>
                    <xsl:variable name="n19" select="etudiant/NOTES/note[8]/note_elm[1]"/>
                    <xsl:variable name="n20" select="etudiant/NOTES/note[8]/note_elm[2]"/>
                    <xsl:variable name="n21" select="etudiant/NOTES/note[8]/note_elm[3]"/>
                    <xsl:variable name="n22" select="etudiant/NOTES/note[9]/note_elm[1]"/>
                    <xsl:variable name="n23" select="etudiant/NOTES/note[9]/note_elm[2]"/>
                    <xsl:variable name="n24" select="etudiant/NOTES/note[9]/note_elm[3]"/>
                    <xsl:variable name="n25" select="etudiant/NOTES/note[10]/note_elm[1]"/>
                    <xsl:variable name="n26" select="etudiant/NOTES/note[10]/note_elm[2]"/>
                    <xsl:variable name="n27" select="etudiant/NOTES/note[11]/note_elm[1]"/>
                    <xsl:variable name="n28" select="etudiant/NOTES/note[11]/note_elm[2]"/>
                    <xsl:variable name="n29" select="etudiant/NOTES/note[12]/note_elm[1]"/>
                    <xsl:variable name="n30" select="etudiant/NOTES/note[12]/note_elm[2]"/>
                    <xsl:variable name="n31" select="etudiant/NOTES/note[12]/note_elm[3]"/>
                    
                    <xsl:variable name="m1" select="($n1 +$n2) div 2"/>
                    <xsl:variable name="m2" select="($n3 +$n4 +$n5) div 3"/>
                    <xsl:variable name="m3" select="($n6 +$n7 +$n8) div 3"/>
                    <xsl:variable name="m4" select="($n9 +$n10 +$n11) div 3"/>
                    <xsl:variable name="m5" select="($n12 +$n13) div 2"/>
                    <xsl:variable name="m6" select="($n14 +$n15 +$n16) div 3"/>
                    <xsl:variable name="m7" select="($n17 +$n18) div 2"/>
                    <xsl:variable name="m8" select="($n19 +$n20 +$n21) div 3"/>
                    <xsl:variable name="m9" select="($n22 +$n23 +$n24) div 3"/>
                    <xsl:variable name="m10" select="($n26+$n25) div 2"/>
                    <xsl:variable name="m11" select="($n27 +$n28) div 2"/>
                    <xsl:variable name="m12" select="($n29 +$n30 +$n31) div 3"/>
                    <xsl:variable name="mg" select="($m1+$m2+$m3+$m4+$m5+$m6+$m7+$m8+$m9+$m10+$m11+$m12) div 12 "/>
                    
                    <fo:block background-color="white" margin-top="Opx" border-style="solid" padding-after="8pt" padding-before="8pt" margin-bottom="8pt" border-width="2px">
                        <fo:block font-weight="bold" font-family="sans-sérif" font-style="normal" text-align="center" margin-bottom="3pt">
                            UNIVERSITE ABDELMALEK ESSAEDI
                        </fo:block>
                        <fo:block font-weight="bold" font-family="sans-sérif" font-style="normal" text-align="center" margin-bottom="3pt">
                            Ecole Nationale des Sciences Appliquées de Tanger
                        </fo:block>
                        <fo:block font-weight="bold" font-family="sans-sérif" font-style="normal" text-align="center">
                            Année universitaire : 2023-2024
                        </fo:block>
                    </fo:block>
                    <fo:block   padding-after="8pt" padding-before="8pt" margin-bottom="8pt" >
                       <fo:block text-align="center" font-weight="bold">
                           RELEVE DE NOTES ET RESULTATS
                       </fo:block>
                    </fo:block>
                    <fo:block   padding-after="8pt" padding-before="8pt" margin-bottom="8pt" >
                        <fo:block  font-weight="bold" font-family="sans-sérif">
                            <xsl:value-of select="normalize-space(concat(etudiant/Nom,' ',etudiant/Prénom,' ',generationalSuffix))"/>
                        </fo:block>
                        <fo:block font-weight="bold" font-family="sans-sérif">
                            CNE : <xsl:value-of select="etudiant/@CNE"/>
                        </fo:block>
						<fo:block text-align="center" margin-bottom="10pts" padding-bottom="4pt" font-weight="bold" font-family="sans-sérif">

							<xsl:variable name="d" select="etudiant/Date_Naissance/day"/>
							<xsl:variable name="m" select="etudiant/Date_Naissance/month"/>
							<xsl:variable name="y" select="etudiant/Date_Naissance/year"/>
                            Né le  :  <xsl:value-of select="normalize-space(concat($d,'/',$m,'/',$y,' à : ',etudiant/Lieu_Naissance,' ',generationalSuffix))"/>   
                        </fo:block> 
                        <fo:block font-weight="bold" font-family="sans-sérif">
                            Inscrit(e) à ENSA de Tanger en GINF2
                        </fo:block>
                        <fo:block font-weight="bold" font-family="sans-sérif">
                            a obtenu les NOTES suivantes
                        </fo:block>
                    </fo:block>
                    <fo:table border-style="solid" inline-progression-dimension="auto" table-layout="fixed" width="100%" border-width="1px">
                        <fo:table-column column-width="8cm" />
                        <fo:table-column column-width="3cm" />
                        <fo:table-column column-width="3cm" />
                        <fo:table-column column-width="4cm" />
						<fo:table-body>
						    <fo:table-row text-align="center" background-color="white">
						        <fo:table-cell padding="8pt" border-width="1px" border-style="solid" font-weight="bold"><fo:block>MODULE</fo:block></fo:table-cell>
						        <fo:table-cell  padding="8pt" border-width="1px" border-style="solid" font-weight="bold"><fo:block>MOYENNE</fo:block></fo:table-cell>
							    <fo:table-cell padding="8pt" border-width="1px" border-style="solid" font-weight="bold"><fo:block>RESULTAT</fo:block></fo:table-cell>
							    <fo:table-cell padding="8pt" border-width="1px" border-style="solid" font-weight="bold"><fo:block>SESSION </fo:block></fo:table-cell>
                            </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF31']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF31']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m1,'##.##')" />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m1  &gt; 12">
						                    <fo:block>
						                       V
						                    </fo:block>
						                </xsl:if>
						             
						                <xsl:if test="$m1  &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m1  =12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S1    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF32']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF32']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center"> 
						                <xsl:value-of select="format-number( $m2,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m2  &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m2=12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m2 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S1    2023-2024
						            </fo:block>
						            
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF33']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF33']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m3,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m3 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m3 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m3 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S1    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF34']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF34']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m4,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m4 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m4 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m4 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S1    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    
						    <fo:table-row>
						        <fo:table-cell padding="1pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF35']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF35']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m5,'##.##')" />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                
						                <xsl:if test="$m5 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m5 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m5 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S1    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF36']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF36']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m6,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m6 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m6 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m6 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S1    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF41']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF41']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m7,'##.##')" />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m7 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m7 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m7 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S2    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF42']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF42']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                
						                <xsl:value-of select="format-number( $m8,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m8 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m8 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m8 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S2    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF43']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF43']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m9,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:if test="$m9 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m9 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m9 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S2    2023-2022
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF44']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF44']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="format-number( $m10,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center"> 
						                <xsl:if test="$m10 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m10 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m10 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S2    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF45']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF45']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center"> 
						                <xsl:value-of select="format-number( $m11,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center"> 
						                <xsl:if test="$m11 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m11 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m11 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S2    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						    <fo:table-row>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                <xsl:value-of select="//note[@module_code='GINF46']/@module_code"  />: <xsl:value-of select="//note[@module_code='GINF46']/@module_name"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center"> 
						                <xsl:value-of select="format-number( $m12,'##.##')"  />
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center"> 
						                <xsl:if test="$m12 &gt;12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                <xsl:if test="$m12 =12">
						                    <fo:block text-align="center">
						                        V
						                    </fo:block>
						                </xsl:if>
						                
						                <xsl:if test="$m12 &lt;12">
						                    <fo:block text-align="center">
						                        NV
						                    </fo:block>
						                </xsl:if>
						            </fo:block>
						        </fo:table-cell>
						        <fo:table-cell padding="2pt" border-width="1px" border-style="solid">
						            <fo:block text-align="center">
						                S2    2023-2024
						            </fo:block>
						        </fo:table-cell>
						    </fo:table-row>
						</fo:table-body>
                    </fo:table>
                    <fo:block text-align="center" margin-top="8pt" border-style="solid" padding-after="8pt" padding-before="8pt" margin-bottom="8pt" border-width="2px">
                        <fo:block font-family="sans-sérif" font-weight="bold" margin-bottom="8pt">
                            <xsl:variable name="moyenne" select="etudiant/moyenneG"/>
                            Moyenne Générale : <xsl:value-of select="format-number( $mg,'##.##')"/>
                        </fo:block>
                        <fo:block margin-bottom="8pt">
                            <xsl:variable name="moyenne" select="etudiant/moyenneG"/>
                            Décision : <xsl:if test="$mg = 12">
                                Résultat admis, l'etudiant(e) ingénieur est affecté(e) à GINF3
                            </xsl:if>
                            <xsl:if test="$mg &gt; 12">
                                Résultat admis, l'etudiant(e) ingénieur est affecté(e) à GINF3
                            </xsl:if>
                            <xsl:if test="$mg &lt; 12">
                                Résultat non admis, l'etudiant(e) ingénieur est réaffecté(e) à GINF2
                            </xsl:if>
                        </fo:block>
                    </fo:block>
                    <fo:block>
                        <fo:block text-align="left" margin-bottom="10pt">
                            Cachet et signature
                        </fo:block>
                        <fo:block text-align="right" margin-bottom="10pts" padding-bottom="4pt">
                            Fait à Tanger le 10/06/2023
                        </fo:block>
                        <fo:block font-size="8px" font-weight="bold" margin-top="5pt">
                            Avis important : il ne sera etre délivré qu'un seul exmplaire du présent relevé de NOTES. Aucun duplicata ne sera fourni.
                        </fo:block>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>