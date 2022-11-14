<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<xsl:template match="/">
    <html>
        <head>Bourse</head>
        <body>
            <h3>Cotations des societes de type Banque</h3>
            <xsl:for-each select="/bourse/societe[@type='banque']">
                <ul>
                    
                    <li> Code Societe : <xsl:value-of select="codeSociete"/></li>
                    <li> Nom Societe : <xsl:value-of select="nomSociete" /></li>
                </ul>
            </xsl:for-each>
                <h3> Cotations</h3>
                <table border="2" width="80%">
                    <tr>
                        <th>Num Cotation</th>
                        <th>Date Cotation</th>
                        <th>Val Action</th>
                    </tr>
                    <xsl:for-each select="/bourse/societe/cotations/cotation">
                        <tr>
                            <td><xsl:value-of select="@num"></xsl:value-of></td>
                            <td><xsl:value-of select="@dateCotation"></xsl:value-of></td>
                            <td><xsl:value-of select="@valeurAction"></xsl:value-of></td>
                        </tr>
                        
                   
                    </xsl:for-each>
                    <tr> <td colspan="2"> Moyenne des Cotations </td>
                        <td>
                            <xsl:value-of select="avg(/bourse/societe/cotations/cotation/@valeurAction)"></xsl:value-of>
                        </td>
                    </tr>
                    
                </table>    
           
            
                <ul>
                    <li>Nombre total des societes : <xsl:value-of select="count(/bourse/societe)"></xsl:value-of></li>
                    <li>Nombre de societes de type banque: <xsl:value-of select="count(/bourse/societe[@type='banque'])"></xsl:value-of></li>
                    <li>Nombre de societes de type assurance : <xsl:value-of select="count(/bourse/societe[@type='assurance'])"></xsl:value-of></li>
                </ul>
            
        </body>
    </html>
    
</xsl:template>
</xsl:stylesheet>