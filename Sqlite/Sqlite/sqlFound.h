//
//  sqlFound.h
//  Sqlite
//
//  Created by Tuna Başaran on 10/3/12.
//  Copyright (c) 2012 e.tirnovali@arox.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface sqlFound : NSObject

{
    NSString* dbYolu ;
    sqlite3* db;
}

- (BOOL) foundSQL : (NSString *)key;
- (int) rndmNumber:(int)max;
- (NSString *) foundSQLid:(int) rnd;
- (int)howMuchWords;

@end
