//
//  ViewController.m
//  tableView多选删除
//
//  Created by wuguangquan on 2021/1/21.
//

#import "ViewController.h"
#import "SelectCell.h"
#import "MultiSelectVC.h"
#import "SingleSelectVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * pTableView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, strong) NSMutableArray *selectArray;
@property(nonatomic, strong) UIButton * deleteBtn;
@property(nonatomic, strong) UIButton * deleteAllBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    _dataArray = [NSMutableArray arrayWithArray:@[@"单选",@"多选"]];
    _selectArray =[NSMutableArray array];
    
    _pTableView =[[UITableView alloc]init];
    _pTableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-40);
    _pTableView.delegate = self;
    _pTableView.dataSource = self;
    _pTableView.tableFooterView =[UIView new];
    [self.view addSubview:_pTableView];
       
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"cell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
  
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        SingleSelectVC * singleVC = [[SingleSelectVC alloc]init];
       [self.navigationController pushViewController:singleVC animated:YES];
    }else
    {
        MultiSelectVC * multiSelectVC = [[MultiSelectVC alloc]init];
       [self.navigationController pushViewController:multiSelectVC animated:YES];
    }
 
}

@end
