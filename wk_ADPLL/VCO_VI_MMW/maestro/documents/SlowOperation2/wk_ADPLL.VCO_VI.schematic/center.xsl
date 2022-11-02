<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- 
   Top level match for the center frame
-->

<xsl:template match="/">
  <html>
    <head>
    <link type="text/css" rel="stylesheet" 
          href="traverse.css" />
    <script type="text/javascript" src="traverse_frames.js">
    </script>
    <script type="text/javascript" src="sorttable.js">
    </script>
    </head>
  <body onload='//datasheet_init("foo");'>
<address>Generated by <a href="http://www.cadence.com/products/cic/schematic_editor/pages/default.aspx" target="_blank">Virtuoso Schematic Editor</a> on <xsl:value-of select="//gen_date"/>  <hr></hr>     <a href="http://www.cadence.com" target="_blank"><img border="0" src="cadence_logo2.gif" alt="(c) Cadence Design Systems, Inc"  /></a>
<hr></hr>
<a href="to_print.xml"><img border="0" src="printer_icon.png"></img>Printer-Friendly Version</a>
</address>
  <h1>Table of Contents</h1>
  <ul>
    <li><a href="#top_cell">Top Cell</a></li>
    <li><a href="#gtoc">Graphical Table of Contents</a></li>
    <li><a href="#bom">Bill of Materials</a></li>
    <li><a href="#master_details">Master Details</a></li>
    <ul>
    <xsl:for-each select="//master_detail">
      <li>
      <xsl:element name="a">
        <xsl:attribute name="href">#<xsl:value-of select="mid"/></xsl:attribute>
      <xsl:apply-templates select="lib"/> , <xsl:apply-templates select="cell"/> , <xsl:apply-templates select="view"/>
      </xsl:element>
      </li>
    </xsl:for-each> <!-- master detail -->
    </ul>
  </ul>
  <h1><a name="gtoc"></a> Graphical TOC </h1>
      <xsl:for-each select="//top">
      <xsl:element name="a">
        <xsl:attribute name="href">#top_cell</xsl:attribute>
        <xsl:element name="img">
          <xsl:attribute name="alt"><xsl:value-of select="lib"/>:<xsl:value-of select="cell"/>,<xsl:value-of select="view"/></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="image128"/></xsl:attribute>
          <xsl:attribute name="border">0</xsl:attribute>
          <xsl:attribute name="onmouseout">setBigIMG("images/wk_ADPLL/VCO_VI/schematic/thumbnail_256x256.png");
          </xsl:attribute>
          <xsl:attribute name="onmouseover">setBigIMG('<xsl:value-of select="image256"/>');
          </xsl:attribute>
 
        </xsl:element> <!-- img -->

      </xsl:element> <!-- anchor -->
    </xsl:for-each> <!-- //top -->
    <xsl:for-each select="//master_detail">
      <xsl:element name="a">
        <xsl:attribute name="href">#<xsl:value-of select="mid"/></xsl:attribute>
        <xsl:element name="img">
          <xsl:attribute name="alt"><xsl:value-of select="lib"/>:<xsl:value-of select="cell"/>,<xsl:value-of select="view"/></xsl:attribute>
          <xsl:attribute name="src"><xsl:value-of select="image128"/></xsl:attribute>
          <xsl:attribute name="border">0</xsl:attribute>
          <xsl:attribute name="onmouseout">setBigIMG("images/wk_ADPLL/VCO_VI/schematic/thumbnail_256x256.png");
          </xsl:attribute>
          <xsl:attribute name="onmouseover">setBigIMG('<xsl:value-of select="image256"/>');
          </xsl:attribute>
        </xsl:element> <!-- img -->
      </xsl:element> <!-- anchor -->
    </xsl:for-each> <!-- master detail -->
 
  <xsl:apply-templates/>
  </body>
  </html>
</xsl:template>

<xsl:template match="gen_date">
<address>Generated by <a href="http://www.cadence.com/products/cic/schematic_editor/pages/default.aspx" target="_blank">Virtuoso Schematic Editor</a> on <xsl:value-of select="."/>  <hr></hr>     <a href="http://www.cadence.com" target="_blank"><img border="0" src="cadence_logo2.gif" alt="(c) Cadence Design Systems, Inc."  /></a>
</address>
</xsl:template>

<xsl:template match="bom">
  <h1><a name="bom"></a> Bill of Materials</h1>
    <table class="sortable">
  <tr>
  <th>Count</th>
  <th>Library</th>
  <th>Cell</th>
  <th>View</th>
  <th>Click to Visit</th>
  <th>Hover to Preview</th>
  </tr>
  <xsl:apply-templates select="bom_item"/>
  </table>
</xsl:template>

<xsl:template match="bom_item">
  <tr>
  <td><xsl:apply-templates select="count"/></td>
  <td><xsl:apply-templates select="lib"/></td>
  <td><xsl:apply-templates select="cell"/></td>
  <td><xsl:apply-templates select="view"/></td>
  <td>
    <xsl:element name="a">
      <xsl:attribute name="href">#<xsl:value-of select="refid"/></xsl:attribute>
      <xsl:attribute name="onmouseout">setBigIMG("images/wk_ADPLL/VCO_VI/schematic/thumbnail_256x256.png");
      </xsl:attribute>
      <xsl:attribute name="onmouseover">setBigIMG('<xsl:value-of select="thumbnail256"/>');
      </xsl:attribute>
    link
    </xsl:element>
  </td>

  <td>
    <xsl:element name="span">
      <xsl:attribute name="class">hotspot</xsl:attribute>
      <xsl:attribute name="onmouseover">tooltip.showImage('<xsl:value-of select="thumbnail256"/>');
      </xsl:attribute>
      <xsl:attribute name="onmouseout">tooltip.hide();</xsl:attribute>
    preview
    </xsl:element>
  </td>
  </tr>
</xsl:template>




<xsl:template match="master_details">
  <h1><a name="master_details">Master Details</a></h1>
  <xsl:apply-templates select="master_detail"/>
</xsl:template>

<xsl:template match="master_detail">
  <h2>Master Detail for (
    <xsl:element name="a">
      <xsl:attribute name="name"><xsl:value-of select="mid"/></xsl:attribute>
    </xsl:element>
  <xsl:apply-templates select="lib"/>
,
  <xsl:apply-templates select="cell"/>
,
  <xsl:apply-templates select="view"/>
  )</h2>
  <xsl:choose>
    <xsl:when test="image1024='N/A'">
      The 1024x1024 image file for this master is not available: 
    </xsl:when>
    <xsl:otherwise>
      <xsl:element name="div">
        <xsl:attribute name="style">background-image:url(<xsl:value-of select="image1024"/>); background-repeat:no-repeat; width:1024px; height:1024px;</xsl:attribute>
      <xsl:element name="img">
        <xsl:attribute name="src">cadence_logo_1024_4.png</xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="lib"/>:<xsl:value-of select="cell"/>,<xsl:value-of select="view"/></xsl:attribute>
        <xsl:attribute name="usemap">#map1024_<xsl:value-of select="mid"/></xsl:attribute>
      </xsl:element>
      <xsl:element name="map">
        <xsl:attribute name="name">map1024_<xsl:value-of select="mid"/></xsl:attribute>

          <xsl:for-each select="map1024/instTermbBox">
            <xsl:element name="area">
              <xsl:attribute name="shape">rect</xsl:attribute>
              <xsl:attribute name="coords"><xsl:value-of select="coords"/></xsl:attribute>
              <xsl:attribute name="onmouseout">
                tooltip.hide();
              </xsl:attribute>
              <xsl:attribute name="onmouseover">
                myString = "Name: <xsl:value-of select="instTerm"/>";
                myString = myString.concat("\nInstance: <xsl:value-of select="inst"/>");
                myString = myString.concat("\nNet: <xsl:value-of select="net"/>");
                tooltip.show(myString); 
              </xsl:attribute>
            </xsl:element>
          </xsl:for-each>

          <xsl:for-each select="map1024/bbox">
            <xsl:element name="area">
              <xsl:attribute name="shape">rect</xsl:attribute>
              <xsl:attribute name="coords"><xsl:value-of select="coords"/></xsl:attribute>
              <xsl:attribute name="href">#<xsl:value-of select="refid"/></xsl:attribute>
              <xsl:attribute name="onmouseout">setBigIMG("images/wk_ADPLL/VCO_VI/schematic/thumbnail_256x256.png");
                tooltip.hide();
              </xsl:attribute>
              <xsl:attribute name="onmouseover">setBigIMG('<xsl:value-of select="thumbnail256"/>');
                myString = ""
                <xsl:for-each select="properties/property">
                  myString = myString.concat("<xsl:value-of select="name"/>");
                  myString = myString.concat(": <xsl:value-of select="value"/>\n");
                </xsl:for-each>
                tooltip.show(myString); 
              </xsl:attribute>
            </xsl:element>
          </xsl:for-each>

      </xsl:element>  <!-- img -->
      </xsl:element>  <!-- div -->

    </xsl:otherwise>
  </xsl:choose>

</xsl:template>


<xsl:template match="top">
  <h1><a name="top_cell">Top Cell</a> (
  <xsl:apply-templates select="lib"/>
,
  <xsl:apply-templates select="cell"/>
,
  <xsl:apply-templates select="view"/>
  )</h1>
  <xsl:choose>
    <xsl:when test="image1024='N/A'">
      The 1024x1024 image file for this master is not available: 
    </xsl:when>
    <xsl:otherwise>
      <xsl:element name="div">
        <xsl:attribute name="style">background-image:url(<xsl:value-of select="image1024"/>); background-repeat:no-repeat; width:1024px; height:1024px;</xsl:attribute>
      <xsl:element name="img">
        <xsl:attribute name="src">cadence_logo_1024_4.png</xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="lib"/>:<xsl:value-of select="cell"/>,<xsl:value-of select="view"/></xsl:attribute>
        <xsl:attribute name="usemap">#map1024_<xsl:value-of select="mid"/></xsl:attribute>
      </xsl:element>

      <xsl:element name="map">
        <xsl:attribute name="name">map1024_<xsl:value-of select="mid"/></xsl:attribute>

          <xsl:for-each select="map1024/instTermbBox">
            <xsl:element name="area">
              <xsl:attribute name="shape">rect</xsl:attribute>
              <xsl:attribute name="coords"><xsl:value-of select="coords"/></xsl:attribute>
              <xsl:attribute name="onmouseout">
                tooltip.hide();
              </xsl:attribute>
              <xsl:attribute name="onmouseover">
                myString = "Name: <xsl:value-of select="instTerm"/>";
                myString = myString.concat("\nInstance: <xsl:value-of select="inst"/>");
                myString = myString.concat("\nNet: <xsl:value-of select="net"/>");
                tooltip.show(myString); 
              </xsl:attribute>
            </xsl:element>
          </xsl:for-each>

          <xsl:for-each select="map1024/bbox">
            <xsl:element name="area">
              <xsl:attribute name="shape">rect</xsl:attribute>
              <xsl:attribute name="coords"><xsl:value-of select="coords"/></xsl:attribute>
              <xsl:attribute name="href">#<xsl:value-of select="refid"/></xsl:attribute>
              <xsl:attribute name="onmouseout">setBigIMG("images/wk_ADPLL/VCO_VI/schematic/thumbnail_256x256.png");
                tooltip.hide();
              </xsl:attribute>
              <xsl:attribute name="onmouseover">setBigIMG('<xsl:value-of select="thumbnail256"/>');
                myString = ""
                <xsl:for-each select="properties/property">
                  myString = myString.concat("<xsl:value-of select="name"/>");
                  myString = myString.concat(": <xsl:value-of select="value"/>\n");
                </xsl:for-each>
                tooltip.show(myString); 
                <!-- tooltip.showImage('<xsl:value-of select="thumbnail256"/>'); -->
              </xsl:attribute>


            </xsl:element>
          </xsl:for-each>

      </xsl:element>  <!-- img -->
      </xsl:element>  <!-- div -->

    </xsl:otherwise>
  </xsl:choose>

</xsl:template>




<xsl:template match="occurrence_tree">
<!-- do not bother to display the occ tree in the main/center frame -->
</xsl:template>


<xsl:template match="occ">
<!-- do not bother to display the occ tree in the main/center frame -->
</xsl:template>

<xsl:template match="indent">
<!-- TODO delete me...indents are not needed -->
</xsl:template>


<xsl:template match="inst">
        <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="lib">
        <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="cell">
        <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="view">
        <xsl:value-of select="."/>
</xsl:template>


</xsl:stylesheet>
