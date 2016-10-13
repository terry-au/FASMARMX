//
//  TNFSplitView.m
//  FASMARMX
//
//  Created by School on 13/10/2016.
//  Copyright © 2016 School. All rights reserved.
//

#import "TNFSplitView.h"

@implementation TNFSplitView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (CGFloat)dividerThickness{
    return 0.1f;
}

- (NSColor *)dividerColor{
    return [NSColor clearColor];
}

@end
