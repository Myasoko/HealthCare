<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/zdravotni_centrum">
        {
        "nazev": "<xsl:value-of select="informace/nazev"/>",
        "verze": "<xsl:value-of select="@verze"/>",
        "adresa": {
        "ulice": "<xsl:value-of select="informace/adresa/ulice"/>",
        "mesto": "<xsl:value-of select="informace/adresa/mesto"/>",
        "psc": "<xsl:value-of select="informace/adresa/psc"/>",
        "zeme": "<xsl:value-of select="informace/adresa/zeme"/>"
        },
        "kontakt": {
        "email": "<xsl:value-of select="informace/kontakt/email"/>",
        "web": "<xsl:value-of select="informace/kontakt/web"/>",
        "telefon": "<xsl:value-of select="informace/kontakt/telefon"/>"
        },
        "oteviraci_doba": [
        <xsl:for-each select="informace/oteviraci_doba/den">
            <xsl:if test="position() > 1">, </xsl:if>
            {
            "den": "<xsl:value-of select="."/>",
            "od": "<xsl:value-of select="@od"/>",
            "do": "<xsl:value-of select="@do"/>",
            "specialni": <xsl:choose>
            <xsl:when test="@specialni = 'true'">true</xsl:when>
            <xsl:otherwise>false</xsl:otherwise>
        </xsl:choose>
            }
        </xsl:for-each>
        ],
        "oddeleni": [
        <xsl:for-each select="oddeleni">
            <xsl:if test="position() > 1">, </xsl:if>
            {
            "oddeleni_nazev": "<xsl:value-of select="oddeleni_nazev"/>",
            "lekari": [
            <xsl:for-each select="lekar">
                <xsl:sort select="jmeno" order="ascending"/>
                <xsl:if test="position() > 1">, </xsl:if>
                {
                "id": "<xsl:value-of select="@id"/>",
                "jmeno": "<xsl:value-of select="jmeno"/>",
                "kontakt": {
                "telefon": "<xsl:value-of select="kontakt/telefon"/>",
                "email": "<xsl:value-of select="kontakt/email"/>",
                "web": "<xsl:value-of select="kontakt/web"/>"
                },
                "ordinacni_hodiny": [
                <xsl:for-each select="ordinacni_hodiny/den">
                    <xsl:if test="position() > 1">, </xsl:if>
                    {
                    "den": "<xsl:value-of select="."/>",
                    "od": "<xsl:value-of select="@od"/>",
                    "do": "<xsl:value-of select="@do"/>",
                    "specialni": <xsl:choose>
                    <xsl:when test="@specialni = 'true'">true</xsl:when>
                    <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
                    }
                </xsl:for-each>
                ]
                }
            </xsl:for-each>
            ]
            }
        </xsl:for-each>
        ],
        "sluzby": [
        <xsl:for-each select="sluzby/kategorie">
            <xsl:if test="position() > 1">, </xsl:if>
            {
            "kategorie": "<xsl:value-of select="@nazev"/>",
            "sluzby": [
            <xsl:for-each select="sluzba">
                <xsl:if test="position() > 1">, </xsl:if>
                {
                "id": "<xsl:value-of select="@id"/>",
                "nazev": "<xsl:value-of select="nazev"/>",
                "popis": "<xsl:value-of select="popis"/>",
                "cena": {
                "hodnota": <xsl:value-of select="cena"/>,
                "jednotka": "<xsl:value-of select="cena/@jednotka"/>"
                },
                "dostupnost": "<xsl:value-of select="dostupnost"/>"
                }
            </xsl:for-each>
            ]
            }
        </xsl:for-each>
        ],
        "novinky": [
        <xsl:for-each select="novinky/kategorie">
            <xsl:if test="position() > 1">, </xsl:if>
            {
            "kategorie": "<xsl:value-of select="@nazev"/>",
            "clanky": [
            <xsl:for-each select="clanek">
                <xsl:sort select="@datum" order="descending"/>
                <xsl:if test="position() > 1">, </xsl:if>
                {
                "id": "<xsl:value-of select="@id"/>",
                "datum": "<xsl:value-of select="@datum"/>",
                "nadpis": "<xsl:value-of select="nadpis"/>",
                "text": "<xsl:value-of select="text"/>"
                }
            </xsl:for-each>
            ]
            }
        </xsl:for-each>
        ],
        "certifikace": "<xsl:value-of select="certifikace"/>",
        "hodnoceni": {
        "skore": <xsl:value-of select="hodnoceni/skore"/>,
        "recenze": "<xsl:value-of select="hodnoceni/recenze"/>"
        }
        }
    </xsl:template>

</xsl:stylesheet>