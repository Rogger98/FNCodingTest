//
//  NSBundle+Category.m
//  MapView
//
//  Created by psagc on 25/03/22.
//

#import "NSBundle+Category.h"

@implementation NSBundle_Extentions
+(NSBundle*)currentBundle {
    return [NSBundle bundleForClass:[self class]];
}
@end
