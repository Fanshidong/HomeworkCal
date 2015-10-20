//
//  SingleMonthCal.m
//  HomeworkCal
//
//  Created by Fanshidong on 15/10/20.
//  Copyright © 2015年 Fanshidong. All rights reserved.
//

#import "SingleMonthCal.h"

@implementation SingleMonthCal

- (id)init{
    _mouthName = @[@"nil",@"Jan.",@"Feb.",@"Mar.",@"Apr.",@"May.",@"June",@"July",@"Aug.",@"Sept.",@"Oct.",@"Nov.",@"Dec"];
    _weekName = @[@"nil",@"Sun",@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat"];
    _numbDay = @[@0,@31,@28,@31,@30,@31,@30,@31,@31,@30,@31,@30,@31];
    self = [super init];
    return self;
}

- (void) setDate:(NSString *)mouth AndYear:(NSString *)year :(BOOL)stop{

    _year = [year intValue];
    _mouth = [mouth intValue];
    if( _year < 1 || _year > 9999 || _mouth < 1 || _mouth > 12 ){
        NSLog(@"Year or mouth error");
        return ;
    }
    NSDate *now = [NSDate date];
    NSCalendar *cal =  [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSWeekdayCalendarUnit | NSMonthCalendarUnit| NSYearCalendarUnit;
    NSDateComponents *dd = [[NSDateComponents alloc] init];
    dd = [cal components:unitFlags fromDate:now];
    [dd setMonth:_mouth];
    [dd setYear:_year];
    
    const char *tmp = [[_mouthName objectAtIndex:_mouth] UTF8String];
    if(stop==NO)printf("%12s %d\n", tmp , _year);
    //week
    if(stop==NO)for( int i = 1 ; i < [_weekName count] ; ++ i ){
        const char *utfString = [[_weekName objectAtIndex:i] UTF8String];
        printf("%s " , utfString);
    }
    if(stop==NO)printf("\n");
    //day
    [dd setDay:1];
    NSDate *firstDay = [cal dateFromComponents:dd];
    dd = [cal components:unitFlags fromDate:firstDay];
    int _week = (int)[dd weekday];
    _week--;
    
    //printf("%d\n", _week);
    int days = (int)[[_numbDay objectAtIndex:_mouth] integerValue];
    
    if(_year%4==0&&(_year%100==0&&_year%400==0)&&_mouth==2) days++;
    int d = 1;
    _len = 0;
    for(int i = 0 ; i < 8 ; ++ i ) for(int j = 0 ; j < 8 ; ++ j)
        _dayData[i][j] = 0 ;
    for( int i = 0 ; i < _week ; ++ i ){
        _dayData[_len][i] = 0;
    }
    while( d <= days ){
        _dayData[_len][_week] = d++;
        _week ++ ;
        if( _week == 7 ){
            _week = 0 ;
            _len++;
        }
    
    }
    if( _week != 7 ){
        _len++;
    }
  
    for(int j = 0 ; j < _len ; ++ j ){
        for(int i = 0 ; i < 7 ; ++ i ){
            if(_dayData[j][i] == 0 ){
                if(stop==NO)printf("    ");
            }
            else
                if(stop==NO)printf("%3d " , _dayData[j][i]);
        }
        if(stop==NO)printf("\n");
    }
    /*if(_week!=7)for(int i = 0 ; i < _week; ++ i ) {_dayData[_len][i] = 0;}
    while( d <= days){
        _dayData[_len][_week] = d++;
        //printf("%3d " , d++);
        if(_week == 6 ){
          //  printf("\n");
            _len++;
        }
        if(_week == 7) _week=0;
        
        _week++;
    }
    if(_week != 7 ){
        printf("\n");
        
    }*/

}
- (void) outMouthName:(int)mouth{
    const char *utfString = [[_mouthName objectAtIndex:mouth] UTF8String];
    printf("%s" , utfString);
    
}
- (void) outWeekName{
    for( int i = 1 ; i < [_weekName count] ; ++ i ){
        const char *utfString = [[_weekName objectAtIndex:i] UTF8String];
        printf("%s " , utfString);
    }
}
- (int) getDayDataX:(int)x AndY:(int)y{
    return _dayData[x][y];
}
- (int) getLen{
    return _len;
}
@end
