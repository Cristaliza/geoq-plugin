#import "geoLocationSdkPlugin.h"
#import "FG_Tracking.h"
#import <Cordova/CDV.h>

@implementation geoLocationSdkPlugin
- (void)locationAction : (CDVInvokedUrlCommand*)command{      //Value of all the parameter from the js file comes in this function.
    NSLog(@"init called");
   //  NSString *responseString = [NSString stringWithFormat:@"Hello %@", [command.arguments objectAtIndex:0]];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Working"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    NSString *javaScript = [pluginResult toSuccessCallbackString:@"callMyJS"];
    NSMutableDictionary* myarg = [command.arguments objectAtIndex:0];
    NSLog(@"APIKEY%@",[myarg objectForKey:@"geoLocationApiKey"]);// Fetching and printing API key value form the js file by locationAction function.
    NSLog(@"Notification%@",[myarg objectForKey:@"geoLocationNotification"]); // Fetching and printing Notification value form the js file by locationAction function.
    NSLog(@"Platform%@",[myarg objectForKey:@"OSPlatform"]); // Fetching and printing Platform value form the js file by locationAction function.
    
    
    
    
//    self.trackingManager = [[TrackingManager alloc] init];
//    [self.trackingManager platformRegistrationWithAPIKey:@"Xa7UMeci8AQA9edo9ABedIVi5OmI4i" andToken:@"RellenarParaEnvioDeNotificaciones" andPlatform:@"http://microsoa.platform.cristaliza.com"];
//    [self.trackingManager startTracking];
    
   }
@end



