cordova.define("com.sipl.geoLocationsdkplugin.geoLocationSdkPlugin", function(require, exports, module) {
	 
	// It will be displayed on the html page where id is callPluginJS.
	document.getElementById("callPluginJS").innerHTML = "Executing My Plugin Javascript File... Calling init() Method...";
	
	var geoLocationSDKPlugin =  {

		//geoLocApikey consist of the API key which will be provided by the user in the js file.
		//geoNotification consist of the notificatiion parameter given by the user in the js file.
		// Platform consist of the platform parameter provided by the user in js file.

	    init : function(geoLocApikey,geoNotification,Platform,successCallback, errorCallback) {

 	        cordova.exec(
	            successCallback,             // success callback function
	            errorCallback,               // error callback function
	            'geoLocationSdkPlugin',      // mapped to our native Java class called "geoLocationSdkPlugin"
	            'locationAction',            // with this action name. //By this action name js parameter will be called in the .m or java file for the plugin in specific platform.
	           [{"geoLocationApiKey":geoLocApikey,"geoLocationNotification":geoNotification,"OSPlatform":Platform}]);  // and this array of custom arguments to create our entry
	    }
	}
	module.exports = geoLocationSDKPlugin;
});
