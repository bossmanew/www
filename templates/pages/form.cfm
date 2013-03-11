<cfinclude template="../header.cfm">

    <div class="container">
      <h3>Connexion : </h3>
      <!--- <cfoutput>#objBoy.CheckPseudo("Azs")#</cfoutput> --->
      <!--- Si message d'erreur detecté --->
      <cfif (IsDefined("e_connexion"))>
        <cfoutput>
          <div class="alert">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Attention !</strong> #e_connexion#
          </div>
        </cfoutput>
      </cfif>
      <!------------------------------------->
      <cfform action="" method="post">
        Pseudo : <cfinput type="Text" name="pseudo" size="20" maxlength="35"><br />
        Mot de passe : <cfinput type="password" name="passwd" size="20" maxlength="35"><br />
        <cfinput type="Submit" name="Connexion" value="Submit">
      </cfform>
    </div>
<cfinclude template="../footer.cfm">