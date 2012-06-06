<!---
	Xindi - http://www.getxindi.com/
	
	Copyright (c) 2012, Simon Bingham
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
	files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
	modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
	is furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
	IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--->

<cfoutput>
	<div class="page-header"><h1>Oops!</h1></div>

	<cfsavecontent variable="local.error">
		<p>An error has occurred.</p>

		<h2>Failed Action</h2>
		
		<p>#request.failedAction#</p>
	
		<h2>Exception</h2>
		
		<cfdump var="#request.exception#">		
	</cfsavecontent>

	<cfif this.development>
		#local.error#
	<cfelse>
		<p>An error has occurred and the site administrator has been notified.</p>
		
		<cfif rc.config.errorhander.enabled>
			<cfmail to="#rc.config.errorhanderconfig.to#" from="#rc.config.errorhanderconfig.from#" subject="#rc.config.errorhanderconfig.to#" type="html">
				#local.error#
			</cfmail>
		</cfif>
	</cfif>
</cfoutput>