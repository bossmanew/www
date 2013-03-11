<--- --------------------------------------------------------------------------------------- ----
  
  Blog Entry:
  Creating An Abstract Base Class In ColdFusion
  
  Author:
  Ben Nadel / Kinky Solutions
  
  Link:
  http://www.bennadel.com/index.cfm?event=blog.view&id=1523
  
  Date Posted:
  Mar 11, 2009 at 10:23 AM
  
---- --------------------------------------------------------------------------------------- --->


<cfcomponent
  output="false"
  hint="I provide the abstract base functionality for Person.">
 
 
  <!---
    To make sure that the outside world cannot instantiate
    and then initialize this component, set the access rights
    of this method to Private. That way, it can ONLY be
    accessed by internal methods and the extending classes.
  --->
  <cffunction
    name="Init"
    access="public"
    returntype="void"
    output="false"
    hint="I provide super-constructor functionality for the Person sub-classes.">
 
    <!--- Define arguments. --->
    <cfargument
      name="Name"
      type="string"
      required="true"
      hint="I am the name of this person."
      />
 
    <!--- Set up instance variables. --->
    <cfset VARIABLES.Instance = {
      Name = ARGUMENTS.Name
      } />
 
    <!---
      Return out. Do NOT return THIS scope (as we would
      normally) as we want to try and prevent this
      constructor from being used as our only constructor.
    --->
    <cfreturn />
  </cffunction>
 
 
  <cffunction
    name="GetName"
    access="public"
    returntype="string"
    output="false"
    hint="I return the person name.">
 
    <cfreturn VARIABLES.Instance.Name />
  </cffunction>
 
</cfcomponent>