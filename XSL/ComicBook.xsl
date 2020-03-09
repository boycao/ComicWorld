<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" name="html"/>
    <xsl:template match="/">
        <xsl:call-template name="pageFullView">
            <xsl:with-param name="navType" select="'hierarchy'"/>
        </xsl:call-template>
        <xsl:call-template name="pageFullView">
            <xsl:with-param name="navType" select="'index'"/>
        </xsl:call-template>
        <xsl:call-template name="pageFullView">
            <xsl:with-param name="navType" select="'sequence'"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="pageFullView">
        <xsl:param name="navType"/>
        <xsl:for-each select="//comicbook">
            <xsl:variable name="itemId" select="@id"/>
            <xsl:result-document href="../html/{$itemId}_{$navType}.html" format="html">
                <html>
                    <head>
                        <title>about/title will go here</title>
                        <meta charset="utf-8">
                            <xsl:text> </xsl:text>
                        </meta>
                        <link href="CSS/Comicbook.css" rel="stylesheet">
                            <xsl:text> </xsl:text>
                        </link>
                        <meta name="viewport" content="width=device-width, initial-scale=1"/>
                        <link rel="stylesheet"
                            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"/>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"/>
                    </head>
                    <body>
                        <div class="page">
                            <div class="bannerArea">
                                <xsl:call-template name="bannerArea"/>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="localNavArea">
                                        <xsl:call-template name="localNavSwitch">
                                            <xsl:with-param name="navType" select="$navType"/>
                                        </xsl:call-template>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="contentArea">
                                        <xsl:call-template name="fullView">
                                            <xsl:with-param name="itemId" select="$itemId"/>
                                        </xsl:call-template>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="fullView" match="/comicbookBase/comicbooks/comicbook/description">
            <xsl:param name="itemId"/>
            <xsl:for-each select="//comicbook[@id=$itemId]">
                <h4><xsl:value-of select="title"/></h4>
                <div class="sources">
                    References:
                    <xsl:for-each select="sources/sourceRefId">
                        <a href="{//sourceDefs/sourceDef[@id=current()]/url}"><xsl:value-of select="//sourceDefs/sourceDef[@id=current()]/description/p"/></a>
                    </xsl:for-each>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="product-img col-md-4">
                            <img src="{images/image[1]/@filename}" alt="{images/image[1]/@caption}"></img>
                        </div>
                        <div class="product-desc col-md-8">
                            <div class="short-desc">
                                <xsl:copy-of select="description"></xsl:copy-of>
                            </div>
                            <div class="author">
                                <b>Author</b>: <xsl:value-of select="specs/author"/>
                            </div>
                            <div class="year">
                                <b>Year</b>: <xsl:value-of select="specs/year"/>
                            </div>
                            <div class="price">
                                <b>Price</b><span class="money">$<xsl:value-of select="price"/></span>
                            </div>
                            <div class="publisher">
                                <b>publisher</b>: <xsl:value-of select="specs/publisher"/>
                            </div>
                            <div class="series">
                                <b>series</b>: <xsl:value-of select="series"/>
                            </div>
                            <div class="language">
                                <b>language</b>: <xsl:value-of select="specs/language"/>
                            </div>
                            <div class="coverType">
                                <b>Cover Type</b>: <xsl:value-of select="specs/coverType"/>
                            </div>
                            <div class="overallRating">
                                <b>Overall Rating</b>: <xsl:value-of select="rating"/>
                            </div>
                            
                            <div class="storage">
                                <b>Storage</b>: <xsl:value-of select="storage"/>
                            </div>
                            
                        </div>
                        <div class="commentsArea">
                            <h4>comments</h4> 
                            <xsl:if test="comments/comment">
                                <div class="review-items row">
                                    <xsl:for-each select="comments/comment">
                                        <div class="col-md-5">
                                            <xsl:choose>
                                                <xsl:when test="@new = 'true'">
                                                    <div class="comment new">
                                                        <span class="customer-name"><xsl:value-of select="@author"/><xsl:text>  </xsl:text><img src="images/new.png" alt="new review" width="20" height="20"/></span>
                                                        <p class="mb-4 box-shadow"><xsl:value-of select="."/></p>
                                                    </div>
                                                </xsl:when>
                                                <xsl:when test="@new = 'false'">
                                                    <div class="comment">
                                                        <span class="customer-name"><xsl:value-of select="@author"/></span>
                                                        <p class="mb-4 box-shadow"><xsl:value-of select="."/></p>
                                                    </div>
                                                </xsl:when>
                                            </xsl:choose>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </xsl:if>
                        </div>
                    </div>
                </div>
            </xsl:for-each>
        
    </xsl:template>
    <xsl:template name="bannerArea">
        <div class="page">
            <div class="bannerArea"/>
            <div class="globalNavArea">
                <a href="">home</a> | <a href="../html/{@id}_hierarchy.html">hierarchy</a> | <a href="../html/{@id}_index.html"
                    >index</a> | <a href="../html/{@id}_sequence.html">sequence</a> | </div>
        </div>
    </xsl:template>
    <xsl:template name="localNavView">
        <xsl:param name="navType"/>
        <div class="localNavArea"> 
            <ul class="nav flex-column">
                <li class="nav-desc">Comic Book Series</li>
                <xsl:for-each select="//comicbook">
                    <xsl:sort select="title"/>
                    <li class="nav-item"><a class="nav-link" href="#"><xsl:value-of select="title"/></a></li>
                </xsl:for-each>
            </ul>
            <div></div>
        </div>
    </xsl:template>
    <xsl:template name="globalNavView">
        <div class="globaNavlArea navbar-nav-scroll">
            <ul class="nav flex-row">
                <li class="nav-item active"><a class="nav-link" href="../HTML/Home.html">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-itme"><a class="nav-link" href="#">ComicBookFullView</a></li>
                <li class="nav-itme"><a class="nav-link" href="#">ComicMovieFullView</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li> 
            </ul>
        </div>
    </xsl:template>
    <xsl:template name="footerArea">
        <footer class="footerArea page">
            <div class="container">
                <span class="footer-text">Boya Cao</span>
                <br/>
                <span class="footer-text">Comic Book InfoType</span>
            </div>
        </footer>
    </xsl:template>
    <xsl:template name="localNavSwitch">
        <xsl:param name="navType"/>
        <xsl:choose>
            <xsl:when test="$navType = 'hierarchy'">
                <xsl:for-each select="//series/series">
                    <xsl:call-template name="hierarchyView">
                        <xsl:with-param name="indent" select="'10'"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$navType = 'index'">
                <xsl:call-template name="indexView">
                    <xsl:with-param name="indent" select="'10'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$navType = 'sequence'">
                <xsl:call-template name="sequenceView">
                    <xsl:with-param name="indent" select="'10'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <p>You passed an unknown type: <xsl:value-of select="$navType"/></p>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template name="hierarchyView">
        <xsl:param name="indent"/>
        <p style="margin-left: {$indent}px;margin-top:0px;margin-bottom:0px;">
            <xsl:value-of select="title"/>
        </p>
        <xsl:for-each select="itemRefId">
            <xsl:variable name="currItemId" select="."/>
            <p style="margin-left: {number($indent)+10}px;margin-top:0px;margin-bottom:0px;">
                <a href="{$currItemId}_hierarchy.html">
                    <xsl:value-of select="//comicbook[@id = $currItemId]/title"/>
                </a>
            </p>
        </xsl:for-each>
        <xsl:for-each select="series">
            <xsl:call-template name="hierarchyView">
                <xsl:with-param name="indent" select="number($indent) + 5"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="indexView">
        <xsl:param name="indent"/>
        <xsl:for-each select="//outieIndex/keyword">
            <xsl:sort select="title"/>
            <p style="margin-left: {$indent}px;margin-top:0px;margin-bottom:0px;">
                <xsl:value-of select="title"/>
            </p>
            <xsl:for-each select="sectionRefId">
                <xsl:variable name="sectionRefId" select="."/>
                <p style="margin-left: {number($indent)+10}px;margin-top:0px;margin-bottom:0px;">
                    <a href="{$sectionRefId}_index.html">
                        <xsl:value-of select="//comicbook[@id = $sectionRefId]/title"/>
                    </a>
                </p>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="associationView">
        <p>Related Comicbooks</p>
        <ul>
            <xsl:for-each select="relatedComicbooks/comicbookRefId">
                <xsl:variable name="relatedComicbookId" select="."/>
                <li>
                    <a href="{$relatedComicbookId}_hierarchy.html">
                        <xsl:value-of select="//comicbook[@id = $relatedComicbookId]/title"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template name="sequenceView">
        <xsl:param name="indent"/>
        <xsl:for-each select="//sequences/sequence">
            <p style="margin-left: {$indent}px;margin-top:0px;margin-bottom:0px;">
                <xsl:value-of select="@title"/>
            </p>
            <xsl:for-each select="comicbookRefId">
                <xsl:variable name="itemRefId" select="."/>
                <p style="margin-left: {number($indent)+10}px;margin-top:0px;margin-bottom:0px;">
                    <a href="{//comicbook[@id=$itemRefId]/@id}_sequence.html">
                        <xsl:value-of select="//comicbook[@id = $itemRefId]/title"/>
                    </a>
                </p>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>