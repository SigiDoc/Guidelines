<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs teix"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../output/eg.css" />
                <link rel="stylesheet" type="text/css" href="../output/SigiDoc_guidelines.css"/>
                <title>SigiDoc Guidelines</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!--<xsl:template match="tei:teiHeader">
        <h1><span class="head"><xsl:apply-templates select="tei:fileDesc//tei:titleStmt//tei:title"/></span></h1>
    </xsl:template>-->
    
    <xsl:template match="tei:teiHeader">
        <h1><a href="../xml-html/SigiDoc_allguidelines.html" target="_blank"><img src="../../General_presentation/outline_home_white_24dp.png"/></a><span class="head"><xsl:apply-templates select="tei:fileDesc//tei:titleStmt//tei:title"/></span></h1>
    </xsl:template>
    
    <xsl:template match="tei:body//tei:div[@type='content']">
        <section class="all"><xsl:apply-templates/></section>
    </xsl:template>

    <xsl:template match="tei:div[@type='leiden']">
        <h3>Leiden symbols</h3>
        <!--<ul class="leiden">
                <li>Editorial interpretation: <b><xsl:apply-templates select="tei:cit[@type='interpretive']//tei:quote//text()"/></b></li>
            <li>Diplomatic edition: <b><xsl:apply-templates select="tei:cit[@type='diplomatic']//tei:quote//text()"/></b></li>
        </ul>-->
        <ul class="leiden">
            <li>Editorial interpretation: <b><xsl:choose>
                <xsl:when test="tei:cit[@type='interpretive']//tei:quote//tei:hi[@rend='underline']">
                    <u><xsl:apply-templates select="tei:cit[@type='interpretive']//tei:quote//tei:hi[@rend='underline']"/></u>
                </xsl:when>
                <xsl:when test="tei:cit[@type='interpretive']//tei:quote//tei:hi[@rend='italic']">
                    <i><xsl:apply-templates select="tei:cit[@type='interpretive']//tei:quote//tei:hi[@rend='italic']"/></i>
                </xsl:when>
                <xsl:when test="tei:cit[@type='interpretive']//tei:quote//tei:hi[@rend='super']">
                    <sup><xsl:apply-templates select="tei:cit[@type='interpretive']//tei:quote//tei:hi[@rend='super'][@style='before']"/></sup>
                    <xsl:apply-templates select="tei:cit[@type='interpretive']//tei:quote//tei:quote[@style='middle']"/>
                    <sup><xsl:apply-templates select="tei:cit[@type='interpretive']//tei:quote//tei:hi[@rend='super'][@style='after']"/></sup>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="tei:cit[@type='interpretive']//tei:quote"/>
                </xsl:otherwise>
            </xsl:choose>
            </b></li>
            <li>Diplomatic edition: <b><xsl:choose>
                <xsl:when test="tei:cit[@type='diplomatic']//tei:quote//tei:hi[@rend='underline']">
                    <u><xsl:apply-templates select="tei:cit[@type='diplomatic']//tei:quote//tei:hi[@rend='underline']"/></u>
                </xsl:when>
                <xsl:when test="tei:cit[@type='diplomatic']//tei:quote//tei:hi[@rend='italic']">
                    <i><xsl:apply-templates select="tei:cit[@type='diplomatic']//tei:quote//tei:hi[@rend='italic']"/></i>
                </xsl:when>
                <xsl:when test="tei:cit[@type='diplomatic']//tei:quote//tei:hi">
                    <sup><xsl:apply-templates select="tei:cit[@type='diplomatic']//tei:quote//tei:hi[@rend='super'][@style='before']"/></sup>
                    <xsl:apply-templates select="tei:cit[@type='diplomatic']//tei:quote//tei:quote[@style='middle']"/>
                    <sup><xsl:apply-templates select="tei:cit[@type='diplomatic']//tei:quote//tei:hi[@rend='super'][@style='after']"/></sup>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="tei:cit[@type='diplomatic']//tei:quote"/>
                </xsl:otherwise>
            </xsl:choose>
            </b></li>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='code']">
        <section class="code"><xsl:apply-templates/></section>
    </xsl:template>
    
    <xsl:template match="tei:specList">
        <h3>Elements</h3>
        <ul class="speclit">
            <xsl:for-each select="tei:specDesc">
                <li><xsl:text>&lt;</xsl:text><xsl:value-of select="@key"/><xsl:text>/&gt;</xsl:text></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='explanation']">
        <h3>Explanation</h3>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:gi">
        <span class="teiGi"><xsl:apply-templates select="text()"/></span>
    </xsl:template>
    
    <xsl:template match="tei:att">
        <span class="teiAtt"><xsl:apply-templates select="text()"/></span>
    </xsl:template>
    
    <xsl:template match="tei:cit">
        <p class="quotation">
            <xsl:apply-templates select="tei:quote"/>
        </p>
    </xsl:template>
    
    <!-- The following 2 templates from: https://wiki.tei-c.org/index.php/SyntaxHighlightingWithegXML, modified -->
    <!-- Handling of <egXML> elements -->
    <xsl:template match="teix:egXML">
        <pre class="teiCode">
       <xsl:apply-templates/>
     </pre>
    </xsl:template>
    
    <!-- Escaping all tags and attributes within the teix (examples) 
namespace except for
the containing egXML. -->
    <xsl:template match="teix:*[not(local-name(.) = 'egXML')]">
        <!-- Indent based on the number of ancestor elements.   -->
        <xsl:variable name="indent"><xsl:for-each 
            select="ancestor::teix:*"> </xsl:for-each></xsl:variable>
        <!-- Indent before every opening tag. -->
        <xsl:if test="ancestor::teix:p"><xsl:value-of 
            select="$indent"/></xsl:if>
        <!-- Opening tag, including any attributes. -->
        <span class="xmlTag"><xsl:text>&lt;</xsl:text><xsl:value-of 
            select="name()"/></span><xsl:for-each select="@*"><span 
                class="xmlAttName"><xsl:text> </xsl:text><xsl:value-of 
                    select="name()"/>=</span><span class="xmlAttVal">"<xsl:value-of 
                        select="."/>"</span></xsl:for-each>
        <!-- Closing tag, for both empty and non empy elements -->
        <xsl:choose>
            <xsl:when test="* | text() | comment()">
                <span class="xmlTag"><xsl:text>&gt;</xsl:text></span><xsl:apply-templates select="* | text() | comment()"/><span class="xmlTag"><xsl:text>&lt;/</xsl:text><xsl:value-of 
                    select="local-name()"/><xsl:text>&gt;</xsl:text></span>
            </xsl:when>
            <xsl:when test="not(text())">
                <xsl:apply-templates/><span class="xmlTag"><xsl:text>/&gt;</xsl:text></span>
            </xsl:when>
        </xsl:choose>
        <!-- Return after closing tag. -->
        <xsl:if test="ancestor::teix:p"><xsl:text>
</xsl:text></xsl:if>
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