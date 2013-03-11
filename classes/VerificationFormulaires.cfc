<--- --------------------------------------------------------------------------------------- ----
  Classe VerificationFormulaire : 
---- --------------------------------------------------------------------------------------- --->
 <cfcomponent output="false" hint="I am a gendered Person.">
     <!--- call init() automatically when the CFC is instantiated --->
     <!--- <cfset init()> --->
<!----------------------------------------------------------------------------------------------------------------------->
<!----------------------------------------------------------------------------------------------------------------------->
<!----------------------------------------------------------------------------------------------------------------------->
    <!--- Constructeur --->
    <cffunction name="Init" returntype="any" output="false" hint="I return an initialized component.">
        <!--- Définir les arguments --->
        <!--- <cfargument name="Name" type="string" required="true" hint="I am the name of this person." />
        <cfargument name="Gender" type="string" required="true" hint="I am the gender of this person." />
        <!--- Initialise les variables --->
        <cfset v.Name = arguments.Name>
        <cfset v.Gender = arguments.Gender>
        <!--- Créer les variables --->
         --->
        <cfreturn this />
    </cffunction>
<!----------------------------------------------------------------------------------------------------------------------->
<!----------------------------------------------------------------------------------------------------------------------->
<!----------------------------------------------------------------------------------------------------------------------->    
    <!--- Fonction GetGender : Renvoi le genre --->
    <cffunction name="CheckPseudo" description="Vérification d'un champs utilisateur : Pseudo">
        <cfargument name="pseudo" type="string" required="true" />

        <cfset var len_pseudo = len(pseudo)>
        <!--- Retourne 1 = Erreur trouvé --->
        <!--- 3 < x < 20 --->
        <cfif (len_pseudo gt 20) or (len_pseudo lt 3)>
            <cfreturn "Le pseudo n'est pas valide" />
        </cfif>
    </cffunction> 
</cfcomponent>