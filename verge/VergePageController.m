//
//  VergePageController.m
//  verge
//
//  Created by Philip Bernstein on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VergePageController.h"

@implementation VergePageController
@synthesize numberOfPages, currentPage;

-(id)initWithPages:(int)pgs frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        currentPage = 0;
        numberOfPages = pgs;
        self.backgroundColor = [UIColor clearColor];
        pages = [[NSMutableArray alloc] initWithObjects:nil];

        [self render];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    return [self initWithPages:0 frame:frame];
}
-(void)changePage:(int)page
{
    if (page >= 0 && page < numberOfPages)
    {
    NSLog(@"CHANGE PAGE %d", page);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [[pages objectAtIndex:currentPage] setAlpha:.6];
    [[pages objectAtIndex:page] setAlpha:1];
    
    [UIView commitAnimations];
    self.currentPage = page;
    }
}
-(void)setPages:(int)pages
{
    
}

-(void)render
{
    for (int i = 0; i < numberOfPages; i++)
    {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dot.png"]];
        [pages addObject:img];
        if (i == currentPage)
            img.alpha = 1;
        else
            img.alpha = .6;
        img.frame = CGRectMake(15*i, 0, 15,15);
        [self addSubview:img];
    }

}

@end
