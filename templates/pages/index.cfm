<cfinclude template="../header.cfm">
    <div class="container">

    <h3>Lien vers une vidéo : </h3>

    <form class="form-search" method="post">
      <div class="input-append">
      <input type="text" class="span8 search-query" name="url">
      <button type="submit" class="btn">Search</button>
    </div>

      <h1><cfoutput>#info.titre#</cfoutput></h1>
      <cfif ArrayFind(format_trouv, "ldURL")><span class="badge badge-inverse">240p</span></cfif>
      <cfif ArrayFind(format_trouv, "sdURL")><span class="badge">380p</span></cfif>
      <cfif ArrayFind(format_trouv, "hqURL")><span class="badge badge-info">480p</span></cfif>
      <cfif ArrayFind(format_trouv, "hd720URL")><span class="badge badge-success">720p</span></cfif>
      <cfif ArrayFind(format_trouv, "hd1080URL")><span class="badge badge-warning">1080p</span></cfif>
      <br /><br />

      <iframe frameborder="0" width="720" height="400" src="http://www.dailymotion.com/embed/video/<cfoutput>#info.id#</cfoutput>"></iframe><br /><a href="<cfoutput>#url_video#</cfoutput>" target="_blank"><cfoutput>#info.titre#</cfoutput></a> <i>par <cfoutput>#info.auteur#</cfoutput></i>
      <br /><br /><h6>Téléchargement en cours :</h6>
          
      <div class="progress">
        <div class="bar" style="width: 2%;"><strong>0%</strong></div>
      </div>
      
      <cfif StructKeyExists(les_liens, "ldURL")><a class="btn btn-mini" href="<cfoutput>#les_liens.ldURL#</cfoutput>"><i class="icon-download"></i> Télécharger 240p</a></cfif>
      <cfif StructKeyExists(les_liens, "sdURL")><a class="btn btn-mini" href="<cfoutput>#les_liens.sdURL#</cfoutput>"><i class="icon-download"></i> Télécharger 380p</a></cfif>
      <cfif StructKeyExists(les_liens, "hqURL")><a class="btn btn-mini" href="<cfoutput>#les_liens.hqURL#</cfoutput>"><i class="icon-download"></i> Télécharger 480p</a></cfif>
      <cfif StructKeyExists(les_liens, "hd720URL")><a class="btn btn-mini" href="<cfoutput>#les_liens.hd720URL#</cfoutput>"><i class="icon-download"></i> Télécharger 720p</a></cfif>
      <cfif StructKeyExists(les_liens, "hd1080URL")><a class="btn btn-mini" href="<cfoutput>#les_liens.hd1080URL#</cfoutput>"><i class="icon-download"></i> Télécharger 1080p</a></cfif>

    </div>
<cfinclude template="../footer.cfm">