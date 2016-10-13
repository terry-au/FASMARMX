//
//  TNFLineNumberRulerView.m
//  FASMARMX
//
//  Created by Terry Lewis on 13/10/16.
//  Copyright © 2016 School. All rights reserved.
//

#import "TNFLineNumberRulerView.h"

@implementation TNFLineNumberRulerView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (instancetype)initWithTextView:(NSTextView *)textView{
    if (self = [super initWithScrollView:textView.enclosingScrollView orientation:NSVerticalRuler]) {
        self.font = textView.font ? : [NSFont systemFontOfSize:[NSFont smallSystemFontSize]];
        self.clientView = textView;
        
        self.ruleThickness = 40;
    }
    return self;
}
static NSDictionary *lineNumberAttributes = nil;

void drawLineNumber(NSString *lineNumberString, CGFloat y, CGPoint relativePoint){
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:lineNumberString attributes:lineNumberAttributes];
    CGFloat x = 35 - attString.size.width;
    [attString drawAtPoint:(NSMakePoint(x, relativePoint.y + y))];
}

- (void)drawHashMarksAndLabelsInRect:(NSRect)rect{
    NSTextView *textView = (NSTextView *)self.clientView;
    
    if (textView) {
        if (!lineNumberAttributes) {
            lineNumberAttributes = @{NSFontAttributeName : textView.font, NSForegroundColorAttributeName : [NSColor grayColor]};
        }
        NSLayoutManager *layoutManager = textView.layoutManager;
        
        if (layoutManager) {
            NSPoint relativePoint = [self convertPoint:NSZeroPoint toView:textView];
            
            NSRange visibleGlyphRange = [layoutManager glyphRangeForBoundingRect:textView.visibleRect inTextContainer:textView.textContainer];
            NSUInteger firstVisibleGlyphCharacterIndex = [layoutManager characterIndexForGlyphAtIndex:visibleGlyphRange.location];
            
            NSRegularExpression *newLineRegex = [[NSRegularExpression alloc] initWithPattern:@"\n" options:0 error:nil];
            NSInteger lineNumber = [newLineRegex numberOfMatchesInString:textView.string options:0 range:NSMakeRange(0, firstVisibleGlyphCharacterIndex)] + 1;
            
            NSInteger glyphIndexForStringLine = visibleGlyphRange.location;
            
            while (glyphIndexForStringLine < NSMaxRange(visibleGlyphRange)) {
                NSUInteger loc = [layoutManager characterIndexForGlyphAtIndex:glyphIndexForStringLine];
                NSRange characterRangeForStringLine = [textView.string lineRangeForRange:NSMakeRange(loc, 0)];
                NSRange glyphRangeForStringLine = [layoutManager glyphRangeForCharacterRange:characterRangeForStringLine actualCharacterRange:nil];
                NSInteger glyphIndexForGlyphLine = glyphIndexForStringLine;
                NSInteger glyphLineCount = 0;
                
                while (glyphIndexForGlyphLine < NSMaxRange(glyphRangeForStringLine)) {
                    
                    // See if the current line in the string spread across
                    // several lines of glyphs
                    NSRange effectiveRange = NSMakeRange(0, 0);
                    
                    // Range of current "line of glyphs". If a line is wrapped,
                    // then it will have more than one "line of glyphs"
                    NSRect lineRect = [layoutManager lineFragmentRectForGlyphAtIndex:glyphIndexForGlyphLine effectiveRange:&effectiveRange withoutAdditionalLayout: true];
                    
                    if (glyphLineCount > 0) {
                        drawLineNumber(@"", lineRect.origin.y, relativePoint);
                    } else {
                        drawLineNumber([NSString stringWithFormat:@"%li", lineNumber], lineRect.origin.y, relativePoint);
                    }
                    
                    // Move to next glyph line
                    glyphLineCount++;
                    glyphIndexForGlyphLine = NSMaxRange(effectiveRange);
                }
                
                glyphIndexForStringLine = NSMaxRange(glyphRangeForStringLine);
                lineNumber++;
            }
            
            // Draw line number for the extra line at the end of the text
            if (layoutManager.extraLineFragmentTextContainer != nil) {
                drawLineNumber([NSString stringWithFormat:@"%li", lineNumber], layoutManager.extraLineFragmentRect.origin.y, relativePoint);
            }
        }
    }
}

@end
