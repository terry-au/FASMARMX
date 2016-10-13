//
//  TNFProject.m
//  FASMARMX
//
//  Created by School on 13/10/2016.
//  Copyright © 2016 School. All rights reserved.
//

#import "TNFProject.h"

static NSString *const kTNFProjectVersionKey = @"version";
static NSString *const kTNFOutputPathKey = @"output_path";
static NSString *const kTNFOpenedFileKey = @"opened_file";
static NSString *const kTNFCursorIndexKey = @"cursor_index";
static NSString *const kTNFSaveDateKey = @"date";

static NSFileManager *fileManager;

@implementation TNFProject{
    
}

+ (instancetype)projectWithFilePath:(NSString *)filePath error:(NSError **)error{
    TNFProject *project = [[self.class alloc] init];
    
    if (filePath != nil && project) {
        project.path = filePath;
        fileManager = [NSFileManager defaultManager];
        BOOL isDirectory = NO;
        
        if ([fileManager fileExistsAtPath:filePath isDirectory:&isDirectory] && !isDirectory){
            NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
            if (dict) {
                BOOL success = [project processDictionary:dict];
                if (!success && error != NULL) {
                    *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey : @"The project file is invalid."}];
                }
            }else if(error != NULL){
                *error = [NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey : @"The project file is invalid or corrupt."}];
            }
            
        }
    }
    return project;
}

- (BOOL)processDictionary:(NSDictionary *)dictionary{
    return YES;
}

@end
