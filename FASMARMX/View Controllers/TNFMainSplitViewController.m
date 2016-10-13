//
//  TNFMainSplitViewController.m
//  FASMARMX
//
//  Created by School on 13/10/2016.
//  Copyright © 2016 School. All rights reserved.
//

#import "TNFMainSplitViewController.h"
//#import "NSTextView+LineNumbers.h"
#import "FASMARMX-Swift.h"

@class LineNumberRulerView;

@interface TNFMainSplitViewController () <NSSplitViewDelegate, NSTextViewDelegate>

@end

@implementation TNFMainSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do view setup here.
    self.consoleView.hidden = YES;
    self.horizontalSplitView.delegate = self;
    
    self.editorTextView.font = [NSFont fontWithName:@"Menlo" size:12];
    self.editorTextView.delegate = self;
    [self.editorTextView lnv_setUpLineNumberView];
//    [self.editorTextView lnv_setUpLineNumberView];
}

- (void)viewDidAppear{
    [super viewDidAppear];
    [self.verticalSplitView setPosition:100 ofDividerAtIndex:0];
}

- (NSRect)splitView:(NSSplitView *)splitView effectiveRect:(NSRect)proposedEffectiveRect forDrawnRect:(NSRect)drawnRect ofDividerAtIndex:(NSInteger)dividerIndex{
    if (self.consoleView.hidden && self.horizontalSplitView == splitView) {
        return NSZeroRect;
    }
    return proposedEffectiveRect;
}

@end
