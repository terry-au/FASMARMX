//
//  TNFProject.h
//  FASMARMX
//
//  Created by School on 13/10/2016.
//  Copyright © 2016 School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TNFProject : NSObject

@property (nonatomic, strong) NSString *path;

@property (nonatomic, strong) NSString *outputPath;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *lastOpenedFile;

@end
