<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../output/SigiDoc_all-guidelines.css"/>
                <title>SigiDoc Guidelines</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
      
    <xsl:template match="tei:teiHeader">
        <xsl:choose>
            <xsl:when test="tei:fileDesc//tei:titleStmt//tei:title[@xml:id='home']">
                <h1><a href="../../index.html" target="_blank"><img src="../../General_presentation/outline_home_white_24dp.png"/></a><span class="head"><xsl:apply-templates select="tei:fileDesc//tei:titleStmt//tei:title[@xml:id='home']"/></span></h1>
            </xsl:when>
            <xsl:when test="tei:fileDesc//tei:titleStmt//tei:title[@xml:id='homeGL']">
                <h1><a href="../xml-html/SigiDoc_allguidelines.html" target="_blank"><img src="../../General_presentation/outline_home_white_24dp.png"/></a><span class="head"><xsl:apply-templates select="tei:fileDesc//tei:titleStmt//tei:title[@xml:id='homeGL']"/></span></h1>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:body//tei:div[@type='content']">
        <section class="all"><xsl:apply-templates/></section>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='contentList']//tei:head">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='contentList']//tei:list">
        <xsl:for-each select="tei:item">
            <ul class="line">
                <li><xsl:apply-templates/></li>
            </ul>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='italic']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='responsibility']">
        <h5 style="color:#FFFFFF; margin-left: 1em">Responsibility for this page</h5>
        <xsl:for-each select="tei:listBibl//tei:bibl//tei:respStmt">
            <ul class="resp"><xsl:apply-templates select="tei:resp"/>: <xsl:apply-templates select="tei:name"/></ul>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='version']">
        <span class="version"><xsl:apply-templates select="tei:p"/></span>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
</xsl:stylesheet>