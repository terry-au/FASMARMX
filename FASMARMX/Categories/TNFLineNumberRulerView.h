//
//  TNFLineNumberRulerView.h
//  FASMARMX
//
//  Created by Terry Lewis on 13/10/16.
//  Copyright © 2016 School. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TNFLineNumberRulerView : NSRulerView

- (instancetype)initWithTextView:(NSTextView *)textView;

@property (nonatomic, strong) NSFont *font;

@end
