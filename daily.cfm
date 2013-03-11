  <!--- Fonction Recup HTML d'une URL --->
  <cffunction name="HTML_vid">
    <cfargument name="url" type="string" required="true">
    <cfhttp url="#url#">
    <cfreturn cfhttp.FileContent>
  </cffunction>

  

  <!--- Fonction Recherche Format Disponible --->
  <cffunction name="formatliste_vid">
    <cfargument name="html_code" type="any" required="true">
    <cfset formats=["ldURL","sdURL","hqURL", "hd720URL", "hd1080URL"]>

    <cfset trouv = ArrayNew(1)>
    <cfloop index="x" array="#formats#">
      <cfif find("#x#", "#html_code#")>
        <cfset ArrayAppend(trouv, "#x#")> 
      </cfif>
    </cfloop>

    <cfreturn trouv>
  </cffunction>


  <!--- Fonction Recherche Liens Formats Video --->
  <cffunction name="liens_vid">
    <cfargument name="html_code" type="any" required="true">
    <cfset liens = REMatch('(?i)ldURL%22%3A%22(.+?)%22', #urlo#)>

    <cfset ltrouv = StructNew()>
    <cfloop index="x" array="#format_trouv#">
      <cfset StructInsert(ltrouv, x, REMatch('(?i)#x#%22%3A%22(.+?)%22', #urlo#)[1])>
    </cfloop>

    <cfreturn ltrouv>
  </cffunction>


  <!--- Formate Liens Video --->
  <cffunction name="HTMLliens_vid">
    <cfargument name="liens_code" type="struct" required="true">

    <cfloop collection="#liens_code#" item="a">
        <cfset un_lien = replace(URLDecode(StructFind(liens_code,a), "utf-8"), '\',"","All")>
        <cfset un_lien = REMatch('(?:http?://)?(((\w+\.)+\w{2,6})(/.*)?)', un_lien)[1]>
        <cfset liens_code[a] = RemoveChars(un_lien, len(un_lien), 1)>
    </cfloop>
    <cfreturn liens_code>
  </cffunction>


  <!--- Information sur la Video --->
  <cffunction name="info_vid">
    <cfargument name="url_video" type="any" required="true">
    <cfargument name="html_code" type="any" required="true">
    <cfset informations = StructNew()>
    <cfset informations['titre'] = REMatch('(?i)<span[^>]+class="title foreground"[^>]*>(.+?)</span>', #html_code#)[1]>
    <cfset informations['id'] = left(replace(url_video, 'http://www.dailymotion.com/video/',"","All"), 6)>
    <cfset informations['auteur'] = REMatch('(?i)<a[^>]+rel="author"[^>]*>(.+?)</a>', #html_code#)[1]>

    <cfreturn informations>
  </cffunction> 


  <!--- Attrib à une variable FORM.id --->
  <cfset url_video="http://www.dailymotion.com/video/xuoy44_jormungand-episode-15-vostfr_shortfilms">
  <cfset urlo="#HTML_vid("#url_video#")#">
  <cfset format_trouv="#formatliste_vid("#urlo#")#">

  <cfset info = #info_vid(url_video,"#urlo#")#>
  <cfset les_liens = HTMLliens_vid(liens_vid("#urlo#"))>


<!--- Afficher la page --->
<cfinclude template="templates/pages/index.cfm">
