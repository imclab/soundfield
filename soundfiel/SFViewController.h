//
//  SFViewController.h
//  soundfiel
//
//  Created by Tom MacWright on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SFViewController : UIViewController

@property (readwrite) Float64 graphSampleRate;
- (void) setupAudioSession;

@end
