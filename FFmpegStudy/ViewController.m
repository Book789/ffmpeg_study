//
//  ViewController.m
//  ZJHVideoProcessing
//
//  Created by ZJH on 2018/1/29.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "ViewController.h"
//#import "DownloadFileViewController.h"
#import "ConverFileViewController.h"
#import "FFmpegManager.h"
#import "PlayerViewController.h"
//#import "ZJHUIWebViewController.h"
//#import "ZJHWKWebViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *nameArr;

@property (nonatomic, strong)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameArr = @[ @"M3U8文件下载", @"视频格式转码", @"接口请求", @"UIWebView", @"WKWebView"];
    
    UITableView * tableView =
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    if (@available(iOS 11.0, *)) {
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }

    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell_id"];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_Id = @"cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_Id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell_Id];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.nameArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        PlayerViewController *vc = [PlayerViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        ConverFileViewController *vc = [ConverFileViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
//        [self requestNetworkData];
    }
    else if (indexPath.row == 3) {
//        ZJHUIWebViewController *vc = [ZJHUIWebViewController new];
//        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 4) {
//        ZJHWKWebViewController *vc = [ZJHWKWebViewController new];
//        [self.navigationController pushViewController:vc animated:YES];
    }
}

//- (void)requestNetworkData {
//    AFHTTPSessionManager *sessionMgr = [AFHTTPSessionManager manager];
//    sessionMgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//    sessionMgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    sessionMgr.responseSerializer.acceptableContentTypes =
//    [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//
//    NSString *getstr = @"http://c.m.163.com/recommend/getChanListNews?channel=T1457068979049&size=20";
////    NSString *getstr = @"http://www.baidu.com";
//
//    [sessionMgr GET:getstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if ([responseObject isKindOfClass:[NSData class]]) {
//            NSString *str = [[NSString alloc] initWithData:responseObject
//                                                  encoding:NSUTF8StringEncoding];
//            NSLog(@"返回数据 ： %@", str);
//        } else {
//            NSLog(@"返回数据 ： %@", responseObject);
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"获取数据失败：%@", error);
//    }];
//}


@end
