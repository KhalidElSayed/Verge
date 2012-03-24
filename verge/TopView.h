//
//  TopView.h
//  verge
//
//  Created by Philip Bernstein on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBContainedURLConnection.h"

@class TopView;
@protocol TopViewDelegate
@required
-(void)topViewDidClick:(int)index;
-(void)topViewDidFail:(int)index error:(NSError *)error;
@end
@interface TopView : UIView
{
    JBContainedURLConnection *imageConnection;
}
-(id)initWithGradient:(int)grad frame:(CGRect )frame image:(NSString *)image link:(NSString *)link title:(NSString *)title;
-(void)renderView;
-(void)didTap;
@property (nonatomic) int index;
@property (nonatomic, retain) id<TopViewDelegate> delegate;
@property (nonatomic, retain) UITextView *titleView;
@end
