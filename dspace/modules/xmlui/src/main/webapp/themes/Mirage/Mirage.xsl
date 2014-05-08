<?xml version="1.0" encoding="UTF-8"?>
<!--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

-->
<!--
    TODO: Describe this XSL file
    Author: Alexey Maslov

-->

<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:dri="http://di.tamu.edu/DRI/1.0/"
	xmlns:mets="http://www.loc.gov/METS/"
	xmlns:xlink="http://www.w3.org/TR/xlink/"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:mods="http://www.loc.gov/mods/v3"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns="http://www.w3.org/1999/xhtml"
	exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc">

    <xsl:import href="../dri2xhtml-alt/dri2xhtml.xsl"/>
    <xsl:import href="lib/xsl/core/global-variables.xsl"/>
    <xsl:import href="lib/xsl/core/page-structure.xsl"/>
    <xsl:import href="lib/xsl/core/navigation.xsl"/>
    <xsl:import href="lib/xsl/core/elements.xsl"/>
    <xsl:import href="lib/xsl/core/forms.xsl"/>
    <xsl:import href="lib/xsl/core/attribute-handlers.xsl"/>
    <xsl:import href="lib/xsl/core/utils.xsl"/>
    <xsl:import href="lib/xsl/aspect/general/choice-authority-control.xsl"/>
    <xsl:import href="lib/xsl/aspect/administrative/administrative.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/item-list.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/item-view.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/community-list.xsl"/>
    <xsl:import href="lib/xsl/aspect/artifactbrowser/collection-list.xsl"/>
    <xsl:output indent="yes"/>
    
    
    <!-- customized templates -->
    
    
    <!-- Show always context browsing menu only and a link to the regular publishing program.
    Appand link to collection with not regular publications as last option -->
	<xsl:template match="dri:options/dri:list/dri:list" priority="3" mode="nested">
                <li>
                        <xsl:if test="not(starts-with(./@id, 'aspect.browseArtifacts.Navigation'))">
                                <xsl:apply-templates select="dri:head" mode="nested"/>
                        </xsl:if>
                        <ul class="ds-simple-list sublist">
                                <xsl:if test="//dri:list[@id='aspect.browseArtifacts.Navigation.list.context'][count(child::*) &gt; 0] and contains(./@id, 'browseArtifacts.Navigation')">
                                        <li class="ds-simple-list-item"><a href="{$context-path}/{$home-collection}"><i18n:text>xmlui.ArtifactBrowser.Navigation.home.collection</i18n:text></a></li>
                                </xsl:if>
                                <xsl:apply-templates select="dri:item" mode="nested"/>
                                <xsl:if test="//dri:list[@id='aspect.browseArtifacts.Navigation.list.context'][count(child::*) &gt; 0] and contains(./@id, 'browseArtifacts.Navigation')">
                                        <li class="ds-simple-list-item"><a href="{$context-path}/{$special-collection}"><i18n:text>xmlui.ArtifactBrowser.Navigation.special.collection</i18n:text></a></li>
                                </xsl:if>
                        </ul>
                </li>
        </xsl:template>

        <xsl:template match="dri:options/dri:list/dri:list[@id='aspect.browseArtifacts.Navigation.list.global']" priority="3" mode="nested">
                <xsl:choose>
                        <xsl:when test="//dri:list[@id='aspect.browseArtifacts.Navigation.list.context'][count(child::*) &gt; 0]">
                        </xsl:when>
                        <xsl:otherwise>
                               <li>

                                        <ul class="ds-simple-list sublist">
                                                <xsl:apply-templates select="dri:item" mode="nested"/>
                                        </ul>
                                </li>
                        </xsl:otherwise>
                </xsl:choose>
        </xsl:template>
</xsl:stylesheet>
