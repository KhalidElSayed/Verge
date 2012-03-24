//
//  ViewController.h
//  verge
//
//  Created by Philip Bernstein on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBContainedURLConnection.h"
#import "VergePageController.h"
#import "TopView.h"
@interface ViewController : UIViewController <UIScrollViewDelegate, TopViewDelegate, UIWebViewDelegate>
{
    JBContainedURLConnection *topConnection;
    JBContainedURLConnection *listConnection;
    IBOutlet UIViewController *storyViewController;
    
    // interface
    IBOutlet UIScrollView *topScroll;
    VergePageController *pageController;
    NSMutableArray *top;
    
    IBOutlet UIViewController *readController;
    IBOutlet UIWebView *readWeb;
}
-(void)error:(NSString *)error;
-(IBAction)done:(id)sender;
@end
