//
//  VergePageController.h
//  verge
//
//  Created by Philip Bernstein on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
    NOTE: This is probably the WORST way to make a page controller, but I seriously am unsure as to how to make a more efficient / quicker version. For this, we just use images, and I really dont need it to actually manage pages, just show the dots. PageView Controller does not let you customize the UI, as far as I can tell.
 
 
 
 */

@interface VergePageController : UIView
{
    NSMutableArray *pages;
}
-(void)changePage:(int)page;
-(void)setPages:(int)pages;
-(id)initWithPages:(int)pgs frame:(CGRect )frame;
-(void)render; // because im lazy.
@property (nonatomic) int currentPage;
@property (nonatomic) int numberOfPages;
@end
