<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" indent="yes" encoding="UTF-8" />

    <!-- function -->
    <xsl:template name="boxContent">
        <!-- temperature range -->
        <xsl:value-of select="lowest" />
        <xsl:text>&#176; - </xsl:text>
        <xsl:value-of select="highest" />
        <xsl:text>&#176;</xsl:text>
        <br />

        <!-- display the right image based on overallCode -->
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="overallCode" />
                <xsl:choose>
                    <xsl:when test="overallCode='cloudy'">.jpeg</xsl:when>
                    <xsl:when test="overallCode='partlySunny'">.jpeg</xsl:when>
                    <xsl:when test="overallCode='sunny'">.jpeg</xsl:when>
                    <xsl:when test="overallCode='rain'">.png</xsl:when>
                    <xsl:when test="overallCode='thunderstorm'">.png</xsl:when>
                    <xsl:otherwise></xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="height">40px</xsl:attribute>
        </img>
        <br />

        <!-- Colour-coded for weather description -->
        <div>
            <xsl:attribute name="style">
                <xsl:choose>
                    <xsl:when test="overallCode='cloudy'">color: blue;</xsl:when>
                    <xsl:when test="overallCode='thunderstorm'">color: orange;</xsl:when>
                    <xsl:when test="overallCode='rain'">color: orange;</xsl:when>
                    <xsl:when test="overallCode='sunny'">color: red;</xsl:when>
                    <xsl:when test="overallCode='partlySunny'">color: red;</xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="overall" />
        </div>
    </xsl:template>

    <xsl:template match="/forecast">
        <html>
            <head>
                <style>
                    th{
                    width: 150px;
                    }
                    td{
                    height: 120px;
                    width: 150px;
                    }
                    .dateColumn{
                    background-color: yellow;
                    width: 60px;
                    }
                </style>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="@queryLocation" />
                    [<xsl:value-of select="@queryTime" />]
                </h1>
                <table border="1" style="text-align:center">
                    <!-- First row -->
                    <tr style="background-color: yellow; width: 40px;">
                        <th class="dateColumn">Date</th>
                        <th>Mon</th>
                        <th>Tue</th>
                        <th>Wed</th>
                        <th>Thu</th>
                        <th>Fri</th>
                        <th>Sat</th>
                        <th>Sun</th>
                    </tr>

                    <!-- Loop through each <weather> entry and for each item, display one table row. -->
                    <xsl:for-each select="weather">
                        <xsl:sort select="@yyyymmdd" data-type="number" order="descending" />
                        <tr>
                            <!-- First column -->
                            <td class="dateColumn">
                                <xsl:value-of select="date" />
                                <xsl:text> </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="month=1">Jan</xsl:when>
                                    <xsl:when test="month=2">Feb</xsl:when>
                                    <xsl:when test="month=3">Mar</xsl:when>
                                    <xsl:when test="month=4">Apr</xsl:when>
                                    <xsl:when test="month=5">May</xsl:when>
                                    <xsl:when test="month=6">Jun</xsl:when>
                                    <xsl:when test="month=7">Jul</xsl:when>
                                    <xsl:when test="month=8">Aug</xsl:when>
                                    <xsl:when test="month=9">Sep</xsl:when>
                                    <xsl:when test="month=10">Oct</xsl:when>
                                    <xsl:when test="month=11">Nov</xsl:when>
                                    <xsl:when test="month=12">Dec</xsl:when>
                                    <xsl:otherwise></xsl:otherwise>
                                </xsl:choose>
                            </td>

                            <!-- Rest of column -->
                            <!-- Mon -->
                            <td>
                                <xsl:if test="@yyyymmdd=20251006">
                                    <xsl:call-template name="boxContent" />
                                </xsl:if>
                            </td>

                            <!-- Tue -->
                            <td></td>

                            <!-- Wed -->
                            <td>
                                <xsl:if test="@yyyymmdd=20250709">
                                    <xsl:call-template name="boxContent" />
                                </xsl:if>
                            </td>

                            <!-- Thu -->
                            <td>
                                <xsl:if test="@yyyymmdd=20250410">
                                    <xsl:call-template name="boxContent" />
                                </xsl:if>
                            </td>

                            <!-- Fri -->
                            <td>
                                <xsl:if test="@yyyymmdd=20250530">
                                    <xsl:call-template name="boxContent" />
                                </xsl:if>
                            </td>

                            <!-- Sat -->
                            <td></td>

                            <!-- Sun -->
                            <td>
                                <xsl:if test="@yyyymmdd=20250615">
                                    <xsl:call-template name="boxContent" />
                                </xsl:if>
                                <xsl:if test="@yyyymmdd=20250608">
                                    <xsl:call-template name="boxContent" />
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>


    </xsl:template>
</xsl:stylesheet>