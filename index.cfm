<!--- Envoi du formulaire de connexion --->
<cfif (IsDefined("Form.Connexion"))>
	<!--- Vérification si tout les informations sont remplies --->
	<cfif (IsDefined("Form.pseudo") and Form.pseudo neq "") and (IsDefined("Form.passwd") and Form.passwd neq "")>

		<!--- Initialise la classe --->
		<!--- <cfinvoke component="classes/VerificationFormulaires" method="init" returnvariable="objBoy" Name="Ben Nadel" Gender="male" /> --->
		<cfinvoke component="classes/VerificationFormulaires" method="init" returnvariable="objBoy" />


		<!--- Hash MDP --->
		<cfset pass_hash = Hash(Form.passwd, "MD5")>
		                
		<!--- Requête SQL--->
		<cfquery datasource="loverz" name="mysql">
		SELECT * FROM clients WHERE pseudo = '#Form.pseudo#' AND pass = '#pass_hash#'
		</cfquery>

		<!--- Vardump --->
		<cfdump var="#mysql#">

		<!--- Test si résultat trouvé --->
		<cfif IsDefined("mysql.pseudo") and mysql.pseudo neq "">
			Réponse OK (#mysql.pseudo#)
		</cfif>

		<!--- Créer la session --->
	<!--- Renvoyer message d'erreur --->
	<cfelse>
		<cfset e_connexion = "Tous les champs ne sont pas remplies !"> 
	</cfif>
</cfif>


<!--- Afficher la page --->
<cfinclude template="templates/pages/form.cfm">
