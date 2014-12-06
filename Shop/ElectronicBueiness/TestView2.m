//
//  TestView2.m
//  ElectronicBueiness
//
//  Created by yao on 14-9-7.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "TestView2.h"
#import "BrandModel.h"
#import "TestTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation TestView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.baseTableView = [[UITableView alloc] initWithFrame:frame];
        self.baseTableView.dataSource = self;
        self.baseTableView.delegate = self;
        self.baseTableView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.baseTableView];
    }
    return self;
}
//----------------------------------------------------------------------------------------------------------------------
//  列表分组头的高度
//----------------------------------------------------------------------------------------------------------------------
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 1;
//}
//
////----------------------------------------------------------------------------------------------------------------------
////  索引
////----------------------------------------------------------------------------------------------------------------------
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return _keys;
//}
//
////----------------------------------------------------------------------------------------------------------------------
////  行高
////----------------------------------------------------------------------------------------------------------------------
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 0)
//    {
//        if( 0 == _hotBrandsSearch.searchResult.count )
//            return 45;
//        return SCROLLIMAGE_HEIGHT;
//    }
//    else
//        return 45;
//}
//
////----------------------------------------------------------------------------------------------------------------------
////  更改列表分组头
////----------------------------------------------------------------------------------------------------------------------
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView  *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
//    if( (1 == section && 0 != _hotBrandsSearch.searchResult.count) || (0 == section && 0 == _hotBrandsSearch.searchResult.count) )
//    {
//        header.backgroundColor = [UIColor clearColor];
//        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
//        line.backgroundColor = AAColor(c_seperator_line);
//        [header addSubview:line];
//        [line release];
//    }
//    else
//    {
//        if ( 0 == section )
//        {
//            header.backgroundColor = [UIColor clearColor];
//        }
//        else
//        {
//            header.backgroundColor = [UIColor whiteColor];
//        }
//    }
//    return [header autorelease];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"BrandTableViewCell";
    TestTableViewCell *cell   = [self.baseTableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//        cell.backgroundColor = [UIColor clearColor];
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
        cell.backgroundColor = [UIColor clearColor];
        
    }
    if (!self.brandArray) {
        cell.textLabel.text = @"12321";
    }
    else
    {
        BrandModel *model = [self.brandArray objectAtIndex:indexPath.row];
        //cell.textLabel.text = model.brandName;
        NSLog(@"%@",model.carPic);
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.carPic] placeholderImage:nil];
    }
    NSLog(@"contentInset:%f",self.baseTableView.contentInset.top);
    NSLog(@"contentsize of height : %f",self.baseTableView.contentSize.height);
    NSLog(@"contentoffset:%f",self.baseTableView.contentOffset.y);
    return cell;
}
@end
