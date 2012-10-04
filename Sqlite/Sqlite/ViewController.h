//
//  ViewController.h
//  Sqlite
//
//  Created by Yunus Emre  Tırnovalı on 9/27/12.
//  Copyright (c) 2012 e.tirnovali@arox.net. All rights reserved.
//


//HOBAAAAAAAAAAÂA111ÂA1Â


#import <UIKit/UIKit.h>
#import "sqlFound.h"

@interface ViewController : UIViewController
{
    int maxSQL;
    sqlFound * test;
}

@property (weak, nonatomic) IBOutlet UITextField *txtEnter;
- (IBAction)sorgu:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *rndmText;

@end
