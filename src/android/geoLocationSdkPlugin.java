
package com.sipl.geoLocationsdkplugin;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import com.sipl.geolocationsdk.LocationTracking;
import com.sipl.geolocationsdk.MainActivity;


import android.content.Context;
import android.content.Intent;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sipl.util.Preferences;


public class geoLocationSdkPlugin extends CordovaPlugin {


public static final String NATIVE_ACTION_STRING ="locationAction";
public static final String PREF_NAME = "prefs";
    Context context = MainActivity.ctx;
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

		try {
			if (NATIVE_ACTION_STRING.equals(action)) {



				JSONObject arg_object = args.getJSONObject(0);

				String geoLocationKey = arg_object.getString("geoLocationApiKey");// Getting the value of API key from JSON object which is coming from JS file.
				String locationNotification = arg_object.getString("geoLocationNotification");// Getting the value of Notification from JSON object which is coming from JS file.
				String platformOS = arg_object.getString("OSPlatform"); // Getting the value of platform from JSON object which is coming from JS file.

                //You can use above variables wherever you want as we have saved in the preferences below.

				// Preferences.save(context,Preferences.KEY_API,geoLocationKey); //Saving the API key value in local storage of android by shared preferences.
				// Preferences.save(context,Preferences.KEY_Notification,locationNotification); //Saving the Notification value in local storage of android by shared preferences.
				// Preferences.save(context,Preferences.KEY_Platform,platformOS); //Saving the platform value in local storage of android by shared preferences.

				callbackContext.success();
				Log.d("Plugin Successfully:", "hmm");
				context.startService(new Intent(context, LocationTracking.class));
				return true;
			}
			callbackContext.error("Invalid action");
			return false;
		} catch(Exception e) {
			System.err.println("Exception: " + e.getMessage());
			callbackContext.error(e.getMessage());
			return false;
		}
	}
}