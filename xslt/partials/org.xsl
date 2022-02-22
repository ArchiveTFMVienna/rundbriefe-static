<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    
    <xsl:template match="tei:org" name="org_detail">
        <xsl:param name="showNumberOfMentions" as="xs:integer" select="50000" />
        <xsl:variable name="selfLink">
            <xsl:value-of select="concat(data(@xml:id), '.html')"/>
        </xsl:variable>
        <div class="card-body">
            <small>GND-ID</small>:
            <xsl:if test=".//tei:idno/text()">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select=".//tei:idno/text()"/></xsl:attribute>
                    <xsl:value-of select=".//tei:idno/text()"/>
                </a>
            </xsl:if>
            <br/>
            <hr />
            <div id="mentions">
                <legend>erwähnt in</legend>
                <ul>
                    <xsl:for-each select=".//tei:event">
                        <xsl:variable name="linkToDocument">
                            <xsl:value-of select="replace(tokenize(data(.//@target), '/')[last()], '.xml', '.html')"/>
                        </xsl:variable>
                        <li>
                            <xsl:value-of select=".//tei:title"/><xsl:text> </xsl:text>
                            <a href="{$linkToDocument}">
                                <i class="fas fa-external-link-alt"></i>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
