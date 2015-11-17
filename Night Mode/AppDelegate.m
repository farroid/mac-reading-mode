//
//  AppDelegate.m
//  Night Mode
//
//  Created by Farrukh Jawed on 11/15/15.
//  Copyright © 2015 Farrukh Jawed. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

NSString *const python_path = @"/usr/bin/python";
NSBundle *mainBundle;

@synthesize bar = _bar;


- (void)awakeFromNib {
    
    self.bar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [self.bar setTitle: NSLocalizedString(@"",@"")];
    [self.bar setToolTip:@"Reading Mode"];
    [self.bar setHighlightMode:YES];
    [self.bar setMenu: self.statusMenu];
    [self.bar.button setTarget: self];
    self.bar.image = [NSImage imageNamed:@"book"];
    //[self.bar.image setTemplate:YES];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    mainBundle = [NSBundle mainBundle];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)toggleOn:(id)sender {
    NSTask *task = [[NSTask alloc] init];
    
    //2
    task.launchPath = python_path;
    
    //3
    
    task.arguments  = @[[mainBundle pathForResource: @"colorsync" ofType: @"py"],@"set",
                        [mainBundle pathForResource: @"ReadingMode" ofType: @"icc"]];
    //4
    [task launch];
    
    [self.statusMenu.itemArray[0] setState:NSOnState];
    [self.statusMenu.itemArray[1] setState:NSOffState];

}
- (IBAction)toggleOff:(id)sender {
    NSTask *task = [[NSTask alloc] init];
    
    //2
    task.launchPath = python_path;
    
    //3
    task.arguments  = @[[mainBundle pathForResource: @"colorsync" ofType: @"py"], @"unset"];
    
    //4
    [self.statusMenu.itemArray[0] setState:NSOffState];
    [self.statusMenu.itemArray[1] setState:NSOnState];
    [task launch];

}
- (IBAction)quit:(id)sender {
    [self toggleOff:nil];
    [NSApp terminate:nil];
}

@end
