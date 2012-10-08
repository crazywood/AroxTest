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

//Terörkan
//Master değişiklik

@end

@implementation ViewController
@synthesize txtEnter;
@synthesize rndmText;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
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
     
     */
    
    
    test = [[sqlFound alloc]init];
    maxSQL = [test howMuchWords];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTxtEnter:nil];
    [self setImageView:nil];
    [self setRndmText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)sorgu:(id)sender {
    
    UIImage *imgOk = [UIImage imageNamed:@"ok.jpeg"];
    UIImage *imgCancel = [UIImage imageNamed:@"cancel.jpeg"];
    
    
    
    if (![txtEnter.text isEqualToString:@""]) {
        [test foundSQL:txtEnter.text] ? [self.imageView setImage:imgOk] : [self.imageView setImage:imgCancel] ;
        
        //condition ? boooo : fooooo;
        
    }
    
    rndmText.text = [test foundSQLid:[test rndmNumber:maxSQL]];
    
    [txtEnter resignFirstResponder];
    
    
}




















@end
