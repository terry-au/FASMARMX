//
//  TNFMainSplitViewController.h
//  FASMARMX
//
//  Created by School on 13/10/2016.
//  Copyright © 2016 School. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TNFMainSplitViewController : NSViewController

@property (weak) IBOutlet NSSplitView *horizontalSplitView;
@property (weak) IBOutlet NSSplitView *verticalSplitView;

@property (weak) IBOutlet NSView *consoleView;
@property (weak) IBOutlet NSView *projectView;
@property (weak) IBOutlet NSView *directoryView;
@property (weak) IBOutlet NSView *editorView;

@property (unsafe_unretained) IBOutlet NSTextView *consoleTextView;
@property (weak) IBOutlet NSOutlineView *directoryOutlineView;
@property (unsafe_unretained) IBOutlet NSTextView *editorTextView;


@end
