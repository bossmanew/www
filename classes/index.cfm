<cfset objBoy = CreateObject( "component", "GenderedPerson" ).Init(Name = "Ben Nadel", Gender = "male") />



    <cfoutput>
    #objBoy.GetName()#
    </cfoutput>