//
//  SelectedPOIView.m
//  MapView
//
//  Created by psagc on 25/03/22.
//

#import "SelectedPOIView.h"
#import "POI.h"
#import "NSBundle+Category.h"
@implementation SelectedPOIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init:(POI*)poi;
{
    self = [super init];
    self = [[[NSBundle_Extentions currentBundle] loadNibNamed:@"SelectedPOI" owner:self options:nil] objectAtIndex:0];
    [self setSelectedPOI:poi];
    if (self) {
        return self;
    }
    return self;
}
-(void)willMoveToWindow:(UIWindow *)newWindow {
    [self setBackgroundColor:[UIColor whiteColor]];
    [[self lablePOIIdentity] setText:[[self selectedPOI] identity]];
    [[self lablePOIType] setText:[[self selectedPOI] type]];
}

-(void)changePOIdetails:(POI*)poi {
    [[self lablePOIIdentity] setText:[poi identity]];
    [[self lablePOIType] setText:[poi type]];
}
-(void)showPOIDetailsOnView:(UIView*)view{
    
    CGFloat yFrame = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    [self setFrame:CGRectMake(0, yFrame, width, 120)];
    
    if(![view.subviews containsObject:self]) {
        [view addSubview:self];
    }
    
    [UIView animateWithDuration:0.30 animations:^{
        [self setFrame:CGRectMake(0, yFrame - 120, width, 120)];
    }];
}
@end
