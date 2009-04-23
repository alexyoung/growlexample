//
//  GrowlExample_AppDelegate.m
//  GrowlExample
//
//  Created by Alex on 23/04/2009.
//  Copyright 2009 Helicoid Limited. All rights reserved.
//

#import "GrowlExample_AppDelegate.h"


@implementation GrowlExample_AppDelegate

- (void)awakeFromNib {
	NSBundle *myBundle = [NSBundle bundleForClass:[GrowlExample_AppDelegate class]];
	NSString *growlPath = [[myBundle privateFrameworksPath] stringByAppendingPathComponent:@"Growl-WithInstaller.framework"];
	NSBundle *growlBundle = [NSBundle bundleWithPath:growlPath];
	
	if (growlBundle && [growlBundle load]) {
		// Register ourselves as a Growl delegate
		[GrowlApplicationBridge setGrowlDelegate:self];
		
		[GrowlApplicationBridge notifyWithTitle:@"Alert"
									description:@"Hello!"
							   notificationName:@"Example"
									   iconData:nil
									   priority:0
									   isSticky:NO
								   clickContext:[NSDate date]];
	}
	else {
		NSLog(@"ERROR: Could not load Growl.framework");
	}
}

@end
