<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:variable name="itemId" select="'cm1'"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Comic World</title>
                <meta charset="utf-8" />
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"></link>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
                <link href="css/ComicBook.css" rel="stylesheet"></link>
            </head>
            
            <body>
                <xsl:call-template name="bannerView"></xsl:call-template>
                <div class="page">
                    
                    <xsl:call-template name="globalNavView"></xsl:call-template>
                    <xsl:call-template name="localNavView">
                        <xsl:with-param name="navType" select="'none'"></xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="fullView">
                        <xsl:with-param name="itemId" select="$itemId"></xsl:with-param>
                    </xsl:call-template>
                    
                </div>
                <xsl:call-template name="footerArea"></xsl:call-template>
            </body>     
        </html> 
    </xsl:template>
    <xsl:template name="fullView">
        <xsl:param name="itemId"/>
        <div class="contentArea">
            <xsl:for-each select="//comicmovie[@id=$itemId]">
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
                            <div class="actors">
                                <b>Actors</b>: <xsl:value-of select="actors"/>
                            </div>
                            <div class="year">
                                <b>Year</b>: <xsl:value-of select="year"/>
                            </div>
                            <div class="price">
                                <span class="money">$<xsl:value-of select="price"/></span>
                            </div>
                            <div class="director">
                                <b>director</b>: <xsl:value-of select="director"/>
                            </div>
                            <div class="series">
                                <b>series</b>: <xsl:value-of select="series"/>
                            </div>
                            <div class="language">
                                <b>language</b>: <xsl:value-of select="language"/>
                            </div>
                            <div class="length">
                                <b>length</b>: <xsl:value-of select="length"/>
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
        </div>
    </xsl:template>
    <xsl:template name="bannerView">
        <div class="page bannerArea"> <xsl:value-of select="//about/title"/> </div>
    </xsl:template>
    <xsl:template name="localNavView">
        <xsl:param name="navType"/>
        <div class="localNavArea"> 
            <ul class="nav flex-column">
                <li class="nav-desc">Comic Movie Series</li>
                <xsl:for-each select="//comicmovie">
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
                <span class="footer-text">Qianzhu Fan</span>
                <br/>
                <span class="footer-text">Comic Movie InfoType</span>
            </div>
        </footer>
    </xsl:template>
</xsl:stylesheet>