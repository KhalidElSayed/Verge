//
//  TopView.m
//  verge
//
//  Created by Philip Bernstein on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TopView
@synthesize  delegate, titleView;
@synthesize index;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithGradient:(int)grad frame:(CGRect )frame image:(NSString *)image link:(NSString *)link title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
        [self addGestureRecognizer:gesture];
        grad++;
        self.titleView = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 320, 128)];
        self.titleView.userInteractionEnabled = NO;
        self.titleView.font = [UIFont fontWithName:@"Adelle Basic" size:20];
        self.titleView.textColor = [UIColor whiteColor];
        self.titleView.backgroundColor = [UIColor clearColor];
        title = [title stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
        self.titleView.text = title;
        self.index = grad;
        [self renderView];
        index = grad;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        imageView.layer.opacity = .7;
        NSString *gradient = [NSString stringWithFormat:@"Gradient-%d.png", grad];
        imageView.image = [UIImage imageNamed:gradient];
        [self addSubview:imageView];
        [self addSubview:titleView];
        [titleView.layer setShadowColor:[[UIColor darkGrayColor] CGColor]];
        [titleView.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
        [titleView.layer setShadowOpacity:1];
        [titleView.layer setShadowRadius:0.3];
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:imageView.frame];
        imageConnection = [[JBContainedURLConnection alloc] initWithURLString:image userInfo:nil completionHandler:^(JBContainedURLConnection *connection, NSError *error, NSString *urlString, NSDictionary *userInfo, NSData *data) {
            NSLog(@"COMPLETE: %@", image);
            backgroundImage.image = [UIImage imageWithData:data];
            [self addSubview:backgroundImage];
            [self sendSubviewToBack:backgroundImage];
        }];
    }
    return self;
}
-(void)didTap
{
    NSLog(@"TAP ARTICLE");
    if (self.delegate)
    {
        [self.delegate topViewDidClick:index-1];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)renderView
{
    
}

@end
