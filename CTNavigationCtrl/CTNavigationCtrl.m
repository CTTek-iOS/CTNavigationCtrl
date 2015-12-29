//
//  CTNavigationCtrl.m
//
//  Created by kinsuft on 6/20/14.
//

#import "CTNavigationCtrl.h"

@interface CTNavigationCtrl ()

@end

@implementation CTNavigationCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self settingOfNavigationBar];
    }
    return self;
}

- (id)init
{
   id instance =  [super init];

    [self settingOfNavigationBar];
    
    return instance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view

}

- (void)settingOfNavigationBar
{
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[CTCommen getColor:TitelTextColor],UITextAttributeTextColor,[UIFont fontWithName:TitelTextFont size:TitelFontSize], UITextAttributeFont, TitelTextShodowColor,UITextAttributeTextShadowColor,nil];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



-(UIBarButtonItem*)customLeftBackButton{
    
    UIImage *image = [UIImage imageNamed:LeftBtnImage];
    UIImage *image3 = [UIImage imageNamed:LeftBtnImageHighLighted];
    UIImage *image1  = image;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=CGRectMake(0, 10, image1.size.width, image1.size.height);
    
    [btn setImage:image1 forState:UIControlStateNormal];
    [btn setImage:image3 forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];

        
    btn.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,0);
        

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [contentView addSubview:btn];
    //UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    

    return backItem;
}

- (void)popself
{
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated

{
    [super pushViewController:viewController animated:animated];
    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1) {
        viewController.navigationItem.leftBarButtonItem =[self customLeftBackButton];
    }
}


@end
