//
//  SingleSelectVC.m
//  tableView多选删除
//
//  Created by wuguangquan on 2021/1/21.
//

#import "SingleSelectVC.h"
#import "SelectCell.h"
@interface SingleSelectVC ()<UITableViewDelegate,UITableViewDataSource,SelectCellDelegate>
@property(nonatomic,strong) UITableView * pTableView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, strong) UIButton * deleteBtn;
@property(nonatomic, strong) NSString * selectStr;
@end

@implementation SingleSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"单选";
    _dataArray = [NSMutableArray arrayWithArray:@[@"科比·布莱恩特",@"德里克·罗斯",@"勒布朗·詹姆斯",@"凯文·杜兰特",@"德怀恩·韦德",@"克里斯·保罗",@"德怀特·霍华德",@"德克·诺维斯基",@"德隆·威廉姆斯",@"斯蒂夫·纳什",@"保罗·加索尔",@"布兰顿·罗伊",@"奈特·阿奇博尔德",@"鲍勃·库西",@"埃尔文·约翰逊"]];
    
    _pTableView =[[UITableView alloc]init];
    _pTableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-40);
    _pTableView.delegate = self;
    _pTableView.dataSource = self;
    _pTableView.tableFooterView =[UIView new];
    [self.view addSubview:_pTableView];
    
    _deleteBtn =[[UIButton alloc]init];
    _deleteBtn.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-40, [UIScreen mainScreen].bounds.size.width, 40);
    _deleteBtn.backgroundColor =[UIColor orangeColor];
    [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteBtn addTarget:self action:@selector(deleteBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_deleteBtn];
}
-(void)deleteBtnClicked
{
    [_dataArray removeObject:_selectStr];
    [self.pTableView reloadData];
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
    SelectCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell =[[SelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.delegate = self;
    cell.pTitleLabel.text = _dataArray[indexPath.row];
    cell.selectBtn.tag = indexPath.row;
    if([_selectStr isEqualToString:_dataArray[indexPath.row]])
    {
        [cell.selectBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    }else
    {
        [cell.selectBtn setImage:[UIImage imageNamed:@"unselect"] forState:UIControlStateNormal];
    }
  
    return cell;
}
-(void)selectStatus:(NSInteger)pIndex
{
    _selectStr = _dataArray[pIndex];
    [_pTableView reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
