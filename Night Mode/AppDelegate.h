//
//  AppDelegate.h
//  Night Mode
//
//  Created by Farrukh Jawed on 11/15/15.
//  Copyright © 2015 Farrukh Jawed. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong, nonatomic) NSStatusItem *bar;
@property IBOutlet NSMenu *statusMenu;
@end
