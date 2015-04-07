//
//  ViewController.m
//  LessonThree
//
//  Created by oscar on 04/04/15.
//  Copyright (c) 2015 oscar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//объявляем глобальную переменную Словарь
@property(nonatomic,strong) NSDictionary *dict;
@property(nonatomic,strong) NSMutableArray *mArray1;
@property(nonatomic,strong) NSMutableArray *mArray2;
@property(nonatomic,strong) NSMutableArray * mArrayDict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mArray1 = [NSMutableArray array];
    self.mArray2 = [NSMutableArray array];
    self.dict = [NSDictionary dictionary];
    self.mArrayDict = [NSMutableArray array];
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"Flat", @"TV", @"Mobile Phone",@"Car", nil];
    NSArray *array2 = [NSArray alloc];//выделяем память
    NSString * string = @"999,700,500,300";
    array2 = [string componentsSeparatedByString:@","];//инициализируем значениями в строке string
    
    
    //заполняем изменяемые массивы
    for (NSString * string in array1) {
        [self.mArray1 addObject:string];
    }
    for (NSString * string in array2) {
        [self.mArray2 addObject:string];
    }
    //заполняем словарь
    for (int i=0; i<array1.count;i++){
       self.dict= [[NSDictionary alloc] initWithObjectsAndKeys:
                   [self.mArray1 objectAtIndex:i], @"value",
                   [self.mArray2 objectAtIndex:i], @"price", nil];
        [self.mArrayDict addObject:self.dict];
     
    }
    
    //NSLog(@"%@",[NSString stringWithFormat:@"%@",self.mArray1]);
    //выводим массив со словарем
    NSLog(@"%@",[NSString stringWithFormat:@"%@",self.mArrayDict]);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//=======================================================================

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.mArray1.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[self.mArrayDict objectAtIndex: indexPath.row]objectForKey:@"value"];
    cell.detailTextLabel.text = [[self.mArrayDict objectAtIndex:indexPath.row]objectForKey:@"price"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


@end
