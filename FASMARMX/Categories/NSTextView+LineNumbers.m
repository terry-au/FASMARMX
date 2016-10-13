//
//  NSTextView+LineNumbers.m
//  FASMARMX
//
//  Created by Terry Lewis on 13/10/16.
//  Copyright © 2016 School. All rights reserved.
//

//
//  LineNumberRulerView.swift
//  LineNumber
//
//  Copyright (c) 2015 Yichi Zhang. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "NSTextView+LineNumbers.h"
#import <objc/runtime.h>

//@implementation NSTextView (LineNumbers)
//
//- (void)setLineNumberView:(TNFLineNumberRulerView *)lineNumberView{
//    objc_setAssociatedObject(self, @selector(lineNumberView), lineNumberView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (TNFLineNumberRulerView *)lineNumberView{
//    return objc_getAssociatedObject(self, @selector(lineNumberView));
//}
//
//- (void)lnv_setUpLineNumberView{
//    if (!self.font) {
//        self.font = [NSFont systemFontOfSize:16];
//    }
//    
//    NSScrollView *scrollView = self.enclosingScrollView;
//    if (scrollView) {
//        self.lineNumberView = [[TNFLineNumberRulerView alloc] initWithTextView:self];
//        
//        scrollView.verticalRulerView = self.lineNumberView;
//        scrollView.hasVerticalRuler = YES;
//        scrollView.rulersVisible = YES;
//    }
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lnv_frameDidChange:) name:NSViewFrameDidChangeNotification object:self];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lnv_textDidChange:) name:NSTextDidChangeNotification object:self];
//}
//
//- (void)lnv_frameDidChange:(NSNotification *)aNotification{
//    self.lineNumberView.needsDisplay = YES;
//}
//
//- (void)lnv_textDidChange:(NSNotification *)aNotification{
//    self.lineNumberView.needsDisplay = YES;
//}
//
//@end
