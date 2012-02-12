//
//  SFViewController.m
//  soundfiel
//
//  Created by Tom MacWright on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SFViewController.h"


@implementation SFViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id) init {
    NSLog(@"in init");
    [self setupAudioSession];
}

- (void) setupAudioSession {
    NSLog(@"in setupAudioSession");
    AVAudioSession *mySession = [AVAudioSession sharedInstance];
    
    // Specify that this object is the delegate of the audio session, so that
    //    this object's endInterruption method will be invoked when needed.
    [mySession setDelegate: self];
    
    // Assign the Playback category to the audio session.
    NSError *audioSessionError = nil;
    [mySession setCategory: AVAudioSessionCategoryPlayback
                     error: &audioSessionError];
    
    if (audioSessionError != nil) {
        
        NSLog (@"Error setting audio session category.");
        return;
    }
    
    // Request the desired hardware sample rate.
    self.graphSampleRate = 44100.0;    // Hertz
    
    [mySession setPreferredHardwareSampleRate: self.graphSampleRate
                                        error: &audioSessionError];
    
    if (audioSessionError != nil) {
        
        NSLog (@"Error setting preferred hardware sample rate.");
        return;
    }
    
    // Activate the audio session
    [mySession setActive: YES
                   error: &audioSessionError];
    
    if (audioSessionError != nil) {
        
        NSLog (@"Error activating audio session during initial setup.");
        return;
    }
    
    // Obtain the actual hardware sample rate and store it for later use in the audio processing graph.
    //self.graphSampleRate = [mySession currentHardwareSampleRate];
    
    // Register the audio route change listener callback function with the audio session.
    /* AudioSessionAddPropertyListener (
                                     kAudioSessionProperty_AudioRouteChange,
                                     audioRouteChangeListenerCallback,
                                     self
                                     );
     */
}

@end
