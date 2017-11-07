<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <body>
        <!--Create Variable header-->
        <xsl:variable name="header">
          <tr>
            <th style="background-color: #c9c9c9;">Date</th>
            <th style="background-color: #c9c9c9;">Home</th>
            <th style="background-color: #c9c9c9;">Visitor</th>
          </tr>
        </xsl:variable>

        <!--Create Variable title1-->
        <xsl:variable name="title1">
          <tr>
            <th colspan="3" style ="color:blue; font-size: 120%;">Basketball Scores, Fall 2017</th>  
          </tr>
        </xsl:variable>

        <!--Create Variable title2-->
        <xsl:variable name="title2">
          <tr>
            <th colspan="3" style ="color:blue; font-size: 120%;">Home Games at Miami</th>
          </tr>
        </xsl:variable>
        
        <!--First Table-->
        <table border="1" cellspacing="0" cellpadding="5" style="width:40%">
          
          <!--Call title1 variable-->
          <tr>
            <xsl:copy-of select="$title1"/>
          </tr>

          <!--Call header variable-->
          <tr>
            <xsl:copy-of select="$header"/>
          </tr>

          <!--Apply template without condition-->
          <xsl:apply-templates select="teamscores/season/game">
            
          </xsl:apply-templates>

        </table>
        
        <br/>
        <br/>
        
        <!--Second Table-->
        <table border="1" cellspacing="0" cellpadding="5" style="width:40%">
          
          <!--Call title1 variable-->
          <tr>
            <xsl:copy-of select="$title2"/>
          </tr>

          <!--Call header variable-->
          <tr>
            <xsl:copy-of select="$header"/>
          </tr>

        <!--Apply Template with condition-->  
        <xsl:apply-templates select="teamscores/season/game[team1 = 'MIA']">

        </xsl:apply-templates>
          
        </table>        
      </body>
    </html>
  </xsl:template>

  <!--Create game template-->
  <xsl:template match="game">
    <tr>
      <td>
        <div align="center">
          <xsl:value-of select="date"/>
        </div>
      </td>
      <td>
        <xsl:value-of select="team1"/> (
        <xsl:value-of select="team1/@score"/>)
        <xsl:if test="team1/@score > team2/@score">
          *
        </xsl:if>
      </td>
      <td>
        <xsl:value-of select="team2"/> (
        <xsl:value-of select="team2/@score"/>)
        <xsl:if test="team2/@score > team1/@score">
          *
        </xsl:if>
      </td>
    </tr>   
  </xsl:template>
</xsl:stylesheet>
