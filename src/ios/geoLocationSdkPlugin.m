#import "geoLocationSdkPlugin.h"
#import "FG_Tracking.h"
#import <Cordova/CDV.h>
#import <GeoQSDK/GeoQSDK.h>
@implementation geoLocationSdkPlugin
- (void)locationAction : (CDVInvokedUrlCommand*)command{
    NSLog(@"init called");
   //  NSString *responseString = [NSString stringWithFormat:@"Hello %@", [command.arguments objectAtIndex:0]];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Working"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    NSString *javaScript = [pluginResult toSuccessCallbackString:@"callMyJS"];
    NSMutableDictionary* myarg = [command.arguments objectAtIndex:0];
    //NSLog(@"APIKEY %@",[myarg objectForKey:@"geoLocationApiKey"]);
    //NSLog(@"Notification %@",[myarg objectForKey:@"geoLocationNotification"]);
    //NSLog(@"Platform %@",[myarg objectForKey:@"OSPlatform"]);

    
    [[GeoQManager sharedManager] initDevice:[myarg objectForKey:@"geoLocationApiKey"] andToken:[myarg objectForKey:@"geoLocationNotification"] andPlatform:[myarg objectForKey:@"OSPlatform"]];
    
    
   
   // Instance object for GeoQManager and calling start tracking method.
    [[GeoQManager sharedManager] startTracking];
    
   }
@end



