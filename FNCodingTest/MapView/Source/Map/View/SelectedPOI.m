//
//  SelectedPOI.m
//  MapView
//
//  Created by psagc on 25/03/22.
//

#import "SelectedPOI.h"
#import "POI.h"
#import "NSBundle+Category.h"
@implementation SelectedPOI

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
    [[self lablePOIIdentity] setText:[[self selectedPOI] identity]];
    [[self lablePOIType] setText:[[self selectedPOI] type]];
}
@end
