//
//  sqlFound.m
//  Sqlite
//
//  Created by Tuna Başaran on 10/3/12.
//  Copyright (c) 2012 e.tirnovali@arox.net. All rights reserved.
//

#import "sqlFound.h"

@implementation sqlFound



//girilen kelimeyi veritabanında sorgulayıp true-false donduren method
- (BOOL) foundSQL : (NSString *)key
{
    bool control = false;
    dbYolu = [NSString stringWithFormat:@"%@/Documents/Main.sqlite",NSHomeDirectory()];

    if (sqlite3_open([dbYolu UTF8String], &db) == SQLITE_OK)
    {
        NSString* query = [NSString stringWithFormat: @"SELECT name FROM vocalist where name = '%@'",key];
        sqlite3_stmt* stmt;
        if (sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW)
            {
                control = true;
            }
        }
        else
            control = false;
        
        sqlite3_finalize(stmt);
    }
    else
    {
        NSLog(@"Veritabanı açılamadı");
        control = false;
    }
    
    return control;
}

//veritanındaki veri sayısına gore random (rasgele) sayı üreten method
- (int) rndmNumber:(int)max
{
    int r = arc4random() % max;
    return r;
}

//id sine gore veritabanından veriyi bulup getiren method
- (NSString *) foundSQLid:(int) rnd
{
    NSString * strng = [[NSString stringWithFormat:@""]init];
    dbYolu = [NSString stringWithFormat:@"%@/Documents/Main.sqlite",NSHomeDirectory()];

    if (sqlite3_open([dbYolu UTF8String], &db) == SQLITE_OK)
    {
        NSString* query = [NSString stringWithFormat: @"SELECT name FROM vocalist where id = '%i'",rnd];
        sqlite3_stmt* stmt;
        if (sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW)
            {
                NSString* words = [NSString stringWithUTF8String:(char*)sqlite3_column_text(stmt, 0)];
                strng = words;
                
            }
        }
        sqlite3_finalize(stmt);
    }
    else
    {
        NSLog(@"Veritabanı açılamadı");
    }
    return strng;
}

//veritabanındaki veri sayısını döndüren method
- (int)howMuchWords
{
    dbYolu = [NSString stringWithFormat:@"%@/Documents/Main.sqlite",NSHomeDirectory()];
    int a = 0 ;
    if (sqlite3_open([dbYolu UTF8String], &db) == SQLITE_OK)
    {
        NSString* query = [NSString stringWithFormat: @"SELECT COUNT(id) AS WordsNum FROM vocalist"];
        sqlite3_stmt* stmt;
        if (sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW)
            {
                NSString* words = [NSString stringWithUTF8String:(char*)sqlite3_column_text(stmt, 0)];
                a = words.intValue;
            }
        }
        sqlite3_finalize(stmt);
    }
    else
    {
        NSLog(@"Veritabanı açılamadı");
    }
    return a;
}


@end
