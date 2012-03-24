//
//  ViewController.m
//  verge
//
//  Created by Philip Bernstein on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    topScroll.delegate = self;
    topScroll.showsHorizontalScrollIndicator = NO;
    topScroll.showsVerticalScrollIndicator = NO;
    topConnection = [[JBContainedURLConnection alloc] initWithURLString:@"http://ozetadesigns.com/verge/top.php" userInfo:nil completionHandler:^(JBContainedURLConnection *connection, NSError *error, NSString *urlString, NSDictionary *userInfo, NSData *data) {
        
        top = [[NSMutableArray alloc] initWithArray:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
        if (top)
        {
            topScroll.scrollEnabled = YES;
            topScroll.pagingEnabled = YES;
            int current = 0;
            topScroll.contentSize = CGSizeMake(320 * [top count], topScroll.frame.size.height);
            for (NSDictionary *dictionary in top)
            {
                NSLog(@"Added Top");
                TopView *topView = [[TopView alloc] initWithGradient:current frame:CGRectMake(current * 320, 0, 320, 200) image:[dictionary objectForKey:@"picture"] link:[dictionary objectForKey:@"link"] title:[dictionary objectForKey:@"title"]];
                topView.delegate = self;
                [topScroll addSubview:topView];
                current++;
                
            }
            pageController = [[VergePageController alloc] initWithPages:5 frame:CGRectMake(123, 170, 320, 50)];
            [storyViewController.view addSubview:pageController];
            [self presentModalViewController:storyViewController animated:YES];
        }
        else {
            [self error:@"Oops! Server error detected. Please try again later!"];
        }
        
    }];
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(void)error:(NSString *)error
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = topScroll.frame.size.width;
    int page = floor((topScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (page != pageController.currentPage)
        [pageController changePage:page];
}
-(void)topViewDidClick:(int)index
{
    NSString *link = [[top objectAtIndex:index] objectForKey:@"link"];
    link = [link stringByReplacingOccurrencesOfString:@"http://mobile.theverge.com/" withString:@""];
    link = [NSString stringWithFormat:@"http://ozetadesigns.com/verge/article.php?u=%@", link];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:link]];
    [readWeb loadRequest:request];
    [storyViewController presentModalViewController:readController animated:YES];
    NSLog(@"LOAD PAGE: %@", link);

}
-(IBAction)done:(id)sender
{
    [storyViewController dismissModalViewControllerAnimated:YES];
    [readWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
}
-(void)topViewDidFail:(int)index error:(NSError *)error
{
    
}
@end
