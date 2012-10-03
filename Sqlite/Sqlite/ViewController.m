//
//  ViewController.m
//  Sqlite
//
//  Created by Yunus Emre  Tırnovalı on 9/27/12.
//  Copyright (c) 2012 e.tirnovali@arox.net. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

{
    NSMutableArray *temp;

}

@end

@implementation ViewController
@synthesize txtField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    temp = [[NSMutableArray alloc]init];
    
    
    NSString* dbYolu = [NSString stringWithFormat:@"%@/Documents/Main.sqlite",NSHomeDirectory()];
    sqlite3* db;
    
    //added
    if (sqlite3_open([dbYolu UTF8String], &db) == SQLITE_OK) 
    {
        // Çalıştırılacak SQLite sorgusunu hazırla
        NSString* query = @"SELECT name FROM vocalist where name = 'telefon'";
        
        sqlite3_stmt* stmt;
        
        // Statement'ı hazırla
        if (sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK) 
        {
            // Sorgudan dönen tüm satırları dolaş
            while (sqlite3_step(stmt) == SQLITE_ROW)
            {
                // Ders kodunu ve alınan notu oku
                NSString* ders_kodu = [NSString stringWithUTF8String:(char*)sqlite3_column_text(stmt, 0)];
                [temp addObject:ders_kodu];
                
                //double not = sqlite3_column_double(stmt, 1);
                
                // Okunan değerleri konsola yaz
                //NSLog(@"%@ : %f", ders_kodu, not); 
                //NSLog(@"%@ :", ders_kodu); 
            }
        }
        
        // Statement nesnesini yok et
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"Veritabanı açılamadı");
    
    self.txtField.text = [temp objectAtIndex:0];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTxtField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
