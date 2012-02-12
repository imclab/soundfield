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
#import <CoreLocation/CoreLocation.h>

@interface SFViewController : UIViewController

@property (nonatomic,strong) AVAudioRecorder* recorder;
@property (nonatomic,strong) NSString* recorderFilePath;
@property (nonatomic,strong) CLLocationManager* locationManager;

- (void) setupAudioSession;
- (IBAction)recordButton:(id)sender;
- (IBAction)stopButton:(id)sender;
- (IBAction)startLocation:(id)sender;

@end
