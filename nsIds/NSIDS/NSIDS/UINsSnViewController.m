//
//  UINsSnViewController.m
//  NSIDS
//
//  Created by adelskott on 26/08/13.
//  Copyright (c) 2013 Adelskott. All rights reserved.
//

#import "UINsSnViewController.h"
#import "Extends+Libs.h"
#import "UIMasterApplication.h"

@interface UINsSnViewController ()

@end

@implementation UINsSnViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"TokenFound" object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self.token setText:note.object];
    }];
    self.udid.text = [[UIDevice currentDevice] uniqueGlobalDeviceIdentifier];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendmail:(id)sender {
    NSString *sujet = [NSString stringWithFormat:@"Apps IDS :%@",[[NSBundle mainBundle] bundleIdentifier]];
    
    NSString *message = [NSString stringWithFormat:@"UDID NETCO:%@ TOKEN PUSH: %@",[[UIDevice currentDevice] uniqueGlobalDeviceIdentifier],[UIMasterApplication getInstance].token];
    [self sendEmailWithMail:@"dev@netcosports.com" Address:@"dev@netcosports.com" Subject:sujet Body:message];
}


- (void)sendEmailWithMail:(NSString *) senderAddress Address:(NSString *) toAddress Subject:(NSString *) subject Body:(NSString *) bodyText {
    NSString *mailtoAddress = [[NSString stringWithFormat:@"mailto:%@?Subject=%@&body=%@",toAddress,subject,bodyText] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailtoAddress]];
    NSLog(@"Mailto:%@",mailtoAddress);
}
@end
