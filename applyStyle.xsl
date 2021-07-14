<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes"/>

		<xsl:template match="/">
				<html>
						<head>
                <title>Trois premières conférences à l'Université | Progetto di Codifica di Testi </title>
								<link href="style.css" rel="stylesheet" type="text/css"/>
								<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
								<script src="script.js"></script>

						</head>
						<body>

								<header>
                  <div class="bilang">
                    <h1 class="fr"><xsl:value-of select="//tei:title" /></h1>
                    <h1 class="it"><xsl:value-of select="//tei:title[@xml:lang='it']" /></h1>
                  </div>
                  <h2>di <xsl:value-of select="//tei:author" /></h2>
                  <h2>doc. <span id="docID"><xsl:value-of select="//tei:idno" /></span></h2>
								</header>

                <nav>
                  <li><a href="#features">Caratteristiche</a></li>
                  <li><a href="#p8">Pagina 8</a></li>
                  <li><a href="#p9">Pagina 9</a></li>
                  <li><a href="#notes">Note</a></li>
                </nav>

                <div id="contents">
                  <section id="features">
                    <h3> Caratteristiche </h3>
                    <div id="fWrapper">
                      <div class="fCol1">
                        <xsl:apply-templates select="//tei:msContents" />
                        <xsl:apply-templates select="//tei:history" />
                      </div>
                      <div class="fCol2">
                        <xsl:apply-templates select="//tei:physDesc" />
                      </div>
                    </div>
                  </section>

                  <section id="vOptions">
                    <h3> Opzioni di visualizzazione </h3>
                    <div class="options">
                      <div id="keywords">
                        <h4>Keywords</h4>
                        <div class="keyBtns">
                          <button class="btnOff" id="showKword">Parole chiave</button>
                          <button class="btnOff" id="showPers">Nomi</button>
                          <button class="btnOff" id="showPlaces">Luoghi</button>
                        </div>
                      </div>
                      <div id="translation">
                        <h4>Traduzione</h4>
                        <div class="keyBtns">
                          <button class="btnOff" id="trslBtn">Mostra</button> <br />
                          <div id="trslWrapper">
                            <h5>Paragrafo</h5>
                            <div class="slider">
                              <label for="trSlider">1</label>
                              <input name="trSlider" type="range" min="1" max="5" value="1" />
                              <label for="trSlider">5</label>
                            </div>
                            <div id="trslTextContainer">
                              <xsl:apply-templates select="//tei:div[@type='translation']" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div id="edits">
                        <h4>Interventi editoriali</h4>
                        <div class="keyBtns">
                          <button class="btnOff" id="showGaps"><i>Gaps</i></button>
                          <button class="btnOff" id="showAdds">Aggiunte</button>
                          <button class="btnOff" id="showDlted">Parole cancellate</button>
                        </div>
                      </div>
                    </div>
                  </section>

                  <section id="p8">
                    <h3> Pagina 8 </h3>
                    <div class="page">
                      <div class="imgContainer">
                        <xsl:apply-templates select="//tei:surface[@xml:id='P1_008']" />
                        <xsl:apply-templates select="//tei:surface[@xml:id='P1_008a']" />
                        <div class="chooseSide">
                          <label for="vers8">
                            <input type="checkbox" id="vers8" name="cSide_8" class="chSideBtn versOn" /> Mostra retro
                          </label>
                        </div>
                      </div>
                      <div class="textContainer">
                        <xsl:apply-templates select="//tei:body/tei:div[@n = '8']" />
                      </div>
                    </div>
                  </section>

                  <section id="p9">
                    <h3> Pagina 9 </h3>
                    <div class="page">
                      <div class="imgContainer">
                        <xsl:apply-templates select="//tei:surface[@xml:id='P1_009']" />
                        <xsl:apply-templates select="//tei:surface[@xml:id='P1_009a']" />
                        <div class="chooseSide">
                          <label for="vers9">
                            <input type="checkbox" id="vers9" name="cSide_9" class="chSideBtn versOn" /> Mostra retro
                          </label>
                        </div>
                      </div>
                      <div class="textContainer">
                        <xsl:apply-templates select="//tei:body/tei:div[@n = '9']" />
                      </div>
                    </div>
                  </section>

                  <section id="notes">
                    <h3>Note</h3>
                    <xsl:apply-templates select="//tei:list[@type='notes']" />
                  </section>

                  <section id="bibliography">
                    <h3>Bibliografia</h3>
                    <xsl:apply-templates select="//tei:listBibl" />
                  </section>
                </div>

                <footer>
                  <xsl:apply-templates select="//tei:titleStmt" />
                  <div class="fEdition">
                    <xsl:apply-templates select="//tei:editionStmt" />
                  </div>
                  <div class="fEdition">
                    <xsl:apply-templates select="//tei:publicationStmt" />
                  </div>
                </footer>

                <button id="backToTop">Torna su</button>

						</body>
				</html>
		</xsl:template>

    <!-- Gestione immagini -->

    <xsl:template match="tei:surface">
      <xsl:element name="img">
        <xsl:attribute name="class">document
          <xsl:choose>
            <xsl:when test="current()/@n mod 2 = 0"> iVerso </xsl:when>
            <xsl:when test="current()/@n mod 2 = 1"> iRecto </xsl:when>
          </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="id">
          <xsl:value-of select="concat(@xml:id, '_page')" />
        </xsl:attribute>
        <xsl:attribute name="src">
          <xsl:value-of select="concat('src/', @xml:id, '.jpg')" />
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="concat('Immagine ', @xml:id)" />
        </xsl:attribute>
        <xsl:attribute name="width">350px</xsl:attribute>
        <xsl:attribute name="usemap">
          <xsl:value-of select="concat('#Pagemap_', @xml:id)" />
        </xsl:attribute>
      </xsl:element>
      <xsl:element name="map">
        <xsl:attribute name="name">
          <xsl:value-of select="concat('Pagemap_', @xml:id)" />
        </xsl:attribute>

        <xsl:for-each select="current()/tei:zone">
          <xsl:element name="area">
            <xsl:attribute name="shape">rect</xsl:attribute>
            <xsl:attribute name="coords">
              <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)" />
            </xsl:attribute>
            <xsl:attribute name="href"><xsl:text>#</xsl:text></xsl:attribute>
            <xsl:attribute name="id">
              <xsl:value-of select="@xml:id" />
            </xsl:attribute>
          </xsl:element>
        </xsl:for-each>

      </xsl:element>


    </xsl:template>

    <!-- Template ausiliari -->

    <xsl:template match="tei:ab[@type='parag']">
      <xsl:element name="span">
        <xsl:attribute name="class">parag</xsl:attribute>
        <xsl:attribute name="class">pr_p<xsl:value-of select="current()/@n" /></xsl:attribute>
        <xsl:apply-templates />
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:ab[@type='translation']">
      <xsl:element name="span">
        <xsl:attribute name="class">translation</xsl:attribute>
        <xsl:attribute name="class">tr_p<xsl:value-of select="current()/@n" /></xsl:attribute>
        <xsl:apply-templates />
      </xsl:element>
    </xsl:template>

    <!-- Translated by -->
    <xsl:template match="tei:titleStmt">
      <div class="fCredits">
        <span class="fRole">
          <xsl:value-of select="current()//tei:resp" />
        </span> <br />
        <span class="fName">
          <xsl:value-of select="current()//tei:name" />
        </span>
      </div>
    </xsl:template>

    <!-- EditionStmt -->

    <xsl:template match="tei:editionStmt">
        <div class="fCredits">
          <span class="edition">
            <xsl:value-of select="current()/tei:edition" />
          </span>
        </div> <br />
        <xsl:for-each select="current()/tei:respStmt">
          <div class="fCredits">
            <xsl:element name="span">
              <xsl:attribute name="class">fRole</xsl:attribute>
              <xsl:value-of select="current()//tei:resp" />
            </xsl:element> <br />
            <xsl:element name="span">
              <xsl:attribute name="class">fName</xsl:attribute>
              <xsl:value-of select="current()//tei:name" />
            </xsl:element>
          </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="//tei:publicationStmt">
      <div class="fCredits">
        <xsl:element name="span">
          <xsl:attribute name="class">fRole</xsl:attribute>
          Published by
        </xsl:element> <br />
        <xsl:element name="span">
          <xsl:attribute name="class">publisher</xsl:attribute>
          <xsl:value-of select="current()//tei:publisher" />
        </xsl:element> <br />
        <xsl:element name="span">
          <xsl:attribute name="class">commons</xsl:attribute>
          <xsl:value-of select="current()//tei:licence" />
        </xsl:element>
      </div>
    </xsl:template>

    <!-- Caratteristiche del documento -->

    <xsl:template match="tei:msContents">
      <xsl:element name="div">
        <xsl:attribute name="id">infoBox</xsl:attribute>
        <xsl:element name="h4">Informazioni generali</xsl:element>
        <xsl:element name="div">
          <xsl:attribute name="class">info</xsl:attribute>
          <strong>Titolo</strong> |
          <xsl:element name="i">
            <xsl:apply-templates select="current()//tei:title" />
          </xsl:element> <br />
          <strong>Autore</strong> |
          <xsl:element name="i">
            <xsl:apply-templates select="current()//tei:author" />
          </xsl:element> <br />
          <strong>Date di composizione</strong> |
          <xsl:element name="i">
            <xsl:apply-templates select="//tei:origin//tei:ref" />
          </xsl:element> <br />
          <strong>Luogo</strong> |
          <xsl:element name="i">
            <xsl:apply-templates select="//tei:settingDesc//tei:name" />
          </xsl:element> <br />
          <strong>Lingua</strong> |
          <xsl:element name="i">
            <xsl:apply-templates select="//tei:profileDesc//tei:language" />
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:history">
      <xsl:element name="div">
        <xsl:attribute name="id">history</xsl:attribute>
        <xsl:element name="h4">Cenni storici</xsl:element>
        <xsl:element name="h5">Origine della bozza</xsl:element>
        <xsl:element name="div">
          <xsl:attribute name="class">info</xsl:attribute>
          <xsl:attribute name="id">docOrigin</xsl:attribute>
          <xsl:apply-templates select="current()/tei:origin" />
        </xsl:element>
        <xsl:element name="h5">Acquisizione</xsl:element>
        <xsl:element name="div">
          <xsl:attribute name="class">info</xsl:attribute>
          <xsl:attribute name="id">docAcq</xsl:attribute>
          <xsl:apply-templates select="current()/tei:acquisition" />
        </xsl:element>
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:physDesc">
      <xsl:element name="div">
        <xsl:attribute name="id">physical</xsl:attribute>
        <xsl:element name="h4">Descrizione fisica</xsl:element>
        <xsl:element name="div">
          <xsl:attribute name="class">info</xsl:attribute>
          <strong>Supporto</strong> |
          <xsl:element name="span">
            <xsl:apply-templates select="current()//tei:support" />
          </xsl:element> <br />
          <strong>Quantità</strong> |
          <xsl:element name="span">
            <xsl:apply-templates select="current()//tei:extent" />
          </xsl:element> <br />
          <strong>Condizioni</strong> |
          <xsl:element name="span">
            <xsl:apply-templates select="current()//tei:condition" />
          </xsl:element> <br />
          <strong>Layout</strong> |
          <xsl:element name="span">
            <xsl:apply-templates select="current()//tei:layout" />
          </xsl:element> <br />
          <strong>Grafia</strong> |
          <xsl:element name="span">
            <xsl:apply-templates select="current()//tei:typeDesc" />
          </xsl:element> <br />
          <strong>Mani</strong> |
          <xsl:element name="span">
            <xsl:apply-templates select="current()//tei:handDesc" />
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:template>

    <!-- Template delle leaves -->

    <xsl:template match="tei:abbr">
      <abbr><xsl:value-of select="current()" /></abbr>
    </xsl:template>

    <xsl:template match="tei:expan">
      <xsl:element name="span">
        <xsl:attribute name="class">expan</xsl:attribute>
        <xsl:value-of select="current()" />
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:add">
      <ins><xsl:apply-templates /></ins>
    </xsl:template>

    <xsl:template match="tei:del">
      <del><xsl:apply-templates /></del>
    </xsl:template>

    <xsl:template match="tei:foreign | tei:hi[@rend = 'italic']">
      <i><xsl:apply-templates /></i>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'bold']">
      <strong><xsl:apply-templates /></strong>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'underline']">
      <u><xsl:apply-templates /></u>
    </xsl:template>

    <xsl:template match="tei:gap">
      <span class="gap">?</span>
    </xsl:template>

    <xsl:template match="tei:lb">
      <br />
      <xsl:element name="span">
        <xsl:attribute name="class">lineNumber</xsl:attribute>
        <xsl:attribute name="id">line_<xsl:value-of select="current()/@n" /></xsl:attribute>
        <xsl:value-of select="@n" />
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:pb">
      <xsl:element name="span">
        <xsl:attribute name="class">pageNumber</xsl:attribute>
        <xsl:attribute name="id">page_<xsl:value-of select="current()/@n" /></xsl:attribute>
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:ptr">
      <xsl:element name="span">
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:value-of select="@target" />
          </xsl:attribute>
          <xsl:attribute name="class">noteIndex</xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="concat('n_', substring(current()/@target, 2))" />
          </xsl:attribute>
            <xsl:value-of select="substring(current()/@target, 10)" />
        </xsl:element>
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:list[@type='notes']">
      <xsl:element name="div">
        <xsl:attribute name="class">noteList</xsl:attribute>
        <xsl:for-each select="current()/tei:item">

          <xsl:element name="span">
            <xsl:attribute name="class">noteIndex</xsl:attribute>
            <xsl:attribute name="id">
              <xsl:value-of select="concat('i_', current()//@xml:id)" />
            </xsl:attribute>
            <xsl:value-of select="@n" />
          </xsl:element>

          <xsl:element name="span">
            <xsl:attribute name="class">noteDesc</xsl:attribute>
            <xsl:attribute name="id">
              <xsl:value-of select="current()//@xml:id" />
            </xsl:attribute>
            <xsl:apply-templates select="current()/tei:note" />
          </xsl:element>

          <br />
        </xsl:for-each>
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:term | tei:persName | tei:placeName">

      <xsl:element name="div">
        <xsl:attribute name="class">key</xsl:attribute>
        <xsl:element name="span">
            <xsl:choose>
              <xsl:when test="name() = 'term'">
                <xsl:attribute name="class">keyword</xsl:attribute>
                <xsl:attribute name="id">
                  <xsl:value-of select="concat('k_', substring(current()/@ref, 2))" />
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="name() = 'persName'">
                <xsl:attribute name="class">
                  <xsl:value-of select="name()" />
                </xsl:attribute>
                <xsl:attribute name="id">
                  <xsl:value-of select="concat('pr_', substring(current()/@ref, 2))" />
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="name() = 'placeName'">
                <xsl:attribute name="class">
                  <xsl:value-of select="name()" />
                </xsl:attribute>
                <xsl:attribute name="id">
                  <xsl:value-of select="concat('pl_', substring(current()/@ref, 2))" />
                </xsl:attribute>
              </xsl:when>
            </xsl:choose>

          <xsl:apply-templates />
        </xsl:element>

        <!-- Descrizione dei termini -->

        <xsl:element name="div">
          <xsl:choose>
            <xsl:when test="name() = 'term'">
              <xsl:attribute name="class">tooltip keyDesc</xsl:attribute>
              <xsl:attribute name="id">
                <xsl:value-of select="concat('kD_', substring(current()/@ref, 2))" />
              </xsl:attribute>
              <xsl:apply-templates select="//tei:gloss[@target=current()/@ref]" />
            </xsl:when>

            <xsl:when test="name() = 'persName'">
              <xsl:attribute name="class">tooltip persDesc</xsl:attribute>
              <xsl:attribute name="id">
                <xsl:value-of select="concat('prD_', substring(current()/@ref, 2))" />
              </xsl:attribute>

              <xsl:element name="span">

                <xsl:attribute name="class">fullName</xsl:attribute>
                <xsl:for-each select="//tei:person[concat('#', @xml:id) = current()/@ref]//tei:forename">
                  <xsl:apply-templates /><xsl:text> </xsl:text>
                </xsl:for-each>
                <xsl:text> </xsl:text>
                <xsl:for-each select="//tei:person[concat('#', @xml:id) = current()/@ref]//tei:surname">
                  <xsl:apply-templates /><xsl:text> </xsl:text>
                </xsl:for-each>
                <xsl:element name="img">
                  <xsl:attribute name="class">icon</xsl:attribute>
                  <xsl:attribute name="src">
                    <xsl:value-of select="concat('src/', //tei:person[concat('#', @xml:id) = current()/@ref]/tei:sex, '.ico')" />
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="concat('Sesso ', //tei:person[concat('#', @xml:id) = current()/@ref]/tei:sex)" />
                  </xsl:attribute>
                </xsl:element>
              </xsl:element> <br />

              <xsl:element name="span">
                <xsl:attribute name="class">birth</xsl:attribute>
                <xsl:element name="img">
                  <xsl:attribute name="class">icon</xsl:attribute>
                  <xsl:attribute name="src">src/birth.png</xsl:attribute>
                  <xsl:attribute name="alt">Icon nascita</xsl:attribute>
                  <xsl:text> </xsl:text>
                  <span><xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:birth//tei:settlement[@type='municipality']" /></span>
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:birth/tei:date" />
                </xsl:element>
              </xsl:element> <br />

              <xsl:if test="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:death">
                <xsl:element name="span">
                  <xsl:attribute name="class">death</xsl:attribute>
                  <xsl:element name="img">
                    <xsl:attribute name="class">icon</xsl:attribute>
                    <xsl:attribute name="src">src/death.png</xsl:attribute>
                    <xsl:attribute name="alt">Icon morte</xsl:attribute>
                    <xsl:text> </xsl:text>
                    <span><xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:death//tei:settlement[@type='municipality']" /></span>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="//tei:person[concat('#', @xml:id) = current()/@ref]/tei:death/tei:date" />
                  </xsl:element>
                </xsl:element>
              </xsl:if>

            </xsl:when>

            <xsl:when test="name() = 'placeName'">
              <xsl:attribute name="class">tooltip placeDesc</xsl:attribute>
              <xsl:attribute name="id">
                <xsl:value-of select="concat('plD_', substring(current()/@ref, 2))" />
              </xsl:attribute>
              <xsl:element name="span">
                <xsl:attribute name="class">settlement</xsl:attribute>
                <xsl:choose>
                  <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'canton'">
                    Cantone
                  </xsl:when>
                  <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'state'">
                    Stato
                  </xsl:when>
                  <xsl:when test="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement/@type = 'region'">
                    Regione
                  </xsl:when>
                </xsl:choose>
                <strong>
                  <xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:settlement" />
                </strong>
              </xsl:element>
              <br />
              <xsl:element name="span">
                <xsl:attribute name="class">country</xsl:attribute>
                <xsl:element name="img">
                  <xsl:attribute name="class">icon</xsl:attribute>
                  <xsl:attribute name="src">
                    <xsl:value-of select="concat('src/', //tei:place[concat('#', @xml:id) = current()/@ref]/tei:country/@key, '.png')" />
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="concat('Bandiera ', //tei:place[concat('#', @xml:id) = current()/@ref]/tei:country)" />
                  </xsl:attribute>
                </xsl:element>
                <strong><xsl:value-of select="//tei:place[concat('#', @xml:id) = current()/@ref]/tei:country" /></strong>
              </xsl:element>
            </xsl:when>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:template>

    <!-- Traduzione -->

    <xsl:template match="//tei:div[@type='translation']">
      <xsl:for-each select="current()/tei:ab">
        <xsl:element name="p">
          <xsl:attribute name="class">trslText</xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="concat('tr_', substring(@corresp, 2))" />
          </xsl:attribute>
          <xsl:apply-templates />
        </xsl:element>
      </xsl:for-each>
   </xsl:template>

   <!-- Bibliografia -->

   <xsl:template match="tei:listBibl">
     <xsl:for-each select="current()/tei:bibl">
        <xsl:element name="li">
          <xsl:attribute name="class">bBook</xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id" />
          </xsl:attribute>

          <xsl:for-each select="current()//tei:author">
            <xsl:element name="span">
              <xsl:attribute name="class">bAuth</xsl:attribute>
                <xsl:for-each select="current()//tei:surname">
                  <xsl:apply-templates />
                </xsl:for-each>
                <xsl:text> </xsl:text>
                <xsl:for-each select="current()//tei:forename">
                  <xsl:value-of select="concat(substring(current(), 1, 1), '. ')" />
                </xsl:for-each>
              </xsl:element>
              <xsl:text>, </xsl:text>
            </xsl:for-each>

            <xsl:element name="span">
              <xsl:attribute name="class">bTitle</xsl:attribute>
              <xsl:element name="i">
                <xsl:for-each select="current()//tei:title">
                  <xsl:apply-templates />
                  <xsl:text>. </xsl:text>
                </xsl:for-each>
              </xsl:element>
            </xsl:element>

            <xsl:element name="span">
              <xsl:attribute name="class">bPlace</xsl:attribute>
              <xsl:for-each select="current()//tei:pubPlace">
                <xsl:apply-templates />
                <xsl:text>, </xsl:text>
              </xsl:for-each>
            </xsl:element>

            <xsl:element name="span">
              <xsl:attribute name="class">bPubl</xsl:attribute>
              <xsl:apply-templates select="current()//tei:publisher" />
            </xsl:element>
            <xsl:text>, </xsl:text>

            <xsl:element name="span">
              <xsl:attribute name="class">bDate</xsl:attribute>
              <xsl:apply-templates select="current()//tei:date" />
            </xsl:element>

            <xsl:if test="current()//tei:biblScope">
              <xsl:text> (</xsl:text>
              <xsl:element name="span">
                <xsl:attribute name="class">bFormat</xsl:attribute>
                <xsl:if test="current()//@unit = 'volume'">
                  <xsl:value-of select="concat('vol. ', //tei:biblScope[@unit = 'volume'])" />
                  <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:if test="current()//@unit = 'page'">
                  <xsl:value-of select="concat('p. ', //tei:biblScope[@unit = 'page'])" />
                </xsl:if>
              </xsl:element>
              <xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:text>.</xsl:text>

            <xsl:if test="current()//tei:note">
              <br />
              <xsl:element name="div">
                <xsl:attribute name="class">bkDesc</xsl:attribute>
                <xsl:apply-templates select="current()//tei:note" />
                <br />
                <xsl:element name="span">
                  <xsl:attribute name="class">closePanel</xsl:attribute>
                  Chiudi
                </xsl:element>
              </xsl:element>
            </xsl:if>

          </xsl:element>
     </xsl:for-each>
   </xsl:template>

</xsl:stylesheet>
