//
//  CommondController.m
//  HomeworkCal
//
//  Created by Fanshidong on 15/10/20.
//  Copyright © 2015年 Fanshidong. All rights reserved.
//

#import "CommondController.h"

#define ENTER 10
#define BLANK 32
#define MAXSIZE 100

@implementation CommondController

- (id)init{
    self = [super init];
    return self;
}
- (void) getLine{
    char buffer;
    scanf("%c" , &buffer);
    string[0] = 0;
    while(buffer != ENTER){
        if(string[0]!=0 && buffer == BLANK && string[ string[0] ] == BLANK) {scanf("%c", &buffer);continue;}
        if( string[0] > 50 ) {scanf("%c", &buffer);continue;}
        string[ ++string[0] ] = buffer;scanf("%c", &buffer);
        
    }
    string[ string[0]+1 ] = '\0';
    //printf("%s\n" , string+1 );
    NSString *tmp = [NSString stringWithUTF8String:(string+1)];
    //NSLog(@"%@", tmp);
    
    _commond = [tmp componentsSeparatedByString:@" "];
   // NSLog(@"%@",_commond);
    
}
- (BOOL) scanfCommond{

    NSDate *now = [NSDate date];
    NSCalendar *cal =  [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSWeekdayCalendarUnit | NSMonthCalendarUnit| NSYearCalendarUnit;
    NSDateComponents *dd = [[NSDateComponents alloc] init];
    dd = [cal components:unitFlags fromDate:now];
    int m = (int)[dd month];
    int y = (int)[dd year];
    // input
    [self getLine];
    NSString *isCAL = [_commond objectAtIndex:0];
    if(![isCAL isEqualToString:@"cal"]) return false;
    if([_commond count] > 3) return false;
    if([_commond count] == 2 ) {
        _mouth = [NSString stringWithFormat:@"%d",m];
        _year = [_commond objectAtIndex:1];
    }
    if([_commond count] == 3 ) {
        _mouth = [_commond objectAtIndex:1];
        _year = [_commond objectAtIndex:2];
    }
    if([_commond count] == 1 ) {
        //[sm setDate:[cc getMouth] AndYear:[cc getYear] :NO];
        //[ay setYear:[cc getYear]];
        _mouth = [NSString stringWithFormat:@"%d",m];
        _year =  [NSString stringWithFormat:@"%d",y];
    }
    
    //int mouth = [_mouth intValue];
    //int year = [_year intValue];
    
    //printf("%d,%d\n",mouth,year);
    return true;
    
}
- (NSString*) getMouth{
    return _mouth;
}
- (NSString*) getYear{
    return _year;
}
- (int) getCount{
    return (int)[_commond count];
}
@end
