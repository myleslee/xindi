<cfscript>
	function exitCode(required numeric code) {
		local.exitcodeFile = GetDirectoryFromPath(GetCurrentTemplatePath()) & "/.exitcode";
		FileWrite(local.exitcodeFile, arguments.code);
	}

	try {
		testbox = new testbox.system.TestBox(options = {}, reporter = "text", directory = {
			recurse = true,
			mapping = "tests/xunit",
			filter = function(required path) {
				return true;
			}
		});
		echo(testbox.run());
		resultObject = testbox.getResult();
		errors = resultObject.getTotalFail() + resultObject.getTotalError();
		exitCode(errors ? 1 : 0);
	} catch (any e) {
		echo("An error occurred running the tests. Message: [#e.message#], Detail: [#e.detail#]");
		exitCode(1);
	}
</cfscript>
