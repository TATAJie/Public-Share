//
//  SQCodeViewController.m
//  RRKShop
//
//  Created by MAC on 17/6/14.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "SQCodeViewController.h"
#import <AVFoundation/AVFoundation.h>//原生二维码扫描必须导入这个框架
#define QRCodeWidth  260.0   //正方形二维码的边长
@interface SQCodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic,strong)AVCaptureSession *session;
@property (weak, nonatomic) IBOutlet UILabel *lightStatusLabel;

@end

@implementation SQCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"扫一扫";
    [self setupScanWindowView];//设置扫描二维码区域的视图
    [self beginScanning];//开始扫二维码
}



- (void)setupScanWindowView
{
    //设置扫描区域的位置
    UIView *scanWindow = [[UIView alloc]initWithFrame:CGRectMake((Screen_Width-QRCodeWidth)/2.0,(self.view.height-QRCodeWidth)/3.0,QRCodeWidth,QRCodeWidth)];
    scanWindow.clipsToBounds = YES;
    [self.view addSubview:scanWindow];
    
    //设置扫描区域的动画效果
    CGFloat scanNetImageViewH = 10;
    CGFloat scanNetImageViewW = scanWindow.frame.size.width;
    UIImageView *scanNetImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"scan_net"]];
    scanNetImageView.frame = CGRectMake(0, 0, scanNetImageViewW, scanNetImageViewH);
    CABasicAnimation *scanNetAnimation = [CABasicAnimation animation];
    scanNetAnimation.keyPath =@"transform.translation.y";
    scanNetAnimation.byValue = @(QRCodeWidth);
    scanNetAnimation.duration = 2.0;
    scanNetAnimation.repeatCount = MAXFLOAT;
    [scanNetImageView.layer addAnimation:scanNetAnimation forKey:nil];
    [scanWindow addSubview:scanNetImageView];
}

- (void)beginScanning
{
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流

    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    if (!input) return;
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    
    //特别注意的地方：有效的扫描区域，定位是以设置的右顶点为原点。屏幕宽所在的那条线为y轴，屏幕高所在的线为x轴
    CGFloat x = ((Screen_Height-QRCodeWidth)/2.0)/Screen_Height;
    CGFloat y = ((Screen_Width-QRCodeWidth)/2.0)/Screen_Width;
    CGFloat width = QRCodeWidth/Screen_Height;
    CGFloat height = QRCodeWidth/Screen_Width;
    output.rectOfInterest = CGRectMake(x, y, width, height);
    
    //设置代理在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    _session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [_session  setSessionPreset:AVCaptureSessionPresetHigh];
    
    [_session addInput:input];
    [_session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    [self.view.layer insertSublayer:layer atIndex:0];
    //开始捕获
    [_session startRunning];
    
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        [_session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        NSString *str = metadataObject.stringValue;
     
            if (self.delegate && [self.delegate respondsToSelector:@selector(SQCodePickResult:withVC:)]) {
                [self.delegate SQCodePickResult:str withVC:self];
            }
        }
        
       
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openFlash:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.isSelected == YES) { //打开闪光灯
        AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        NSError *error = nil;
        
        if ([captureDevice hasTorch]) {
            BOOL locked = [captureDevice lockForConfiguration:&error];
            if (locked) {
                captureDevice.torchMode = AVCaptureTorchModeOn;
                [captureDevice unlockForConfiguration];
            }
            self.lightStatusLabel.text = @"关闭";
        }
    }else{//关闭闪光灯
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOff];
            [device unlockForConfiguration];
            self.lightStatusLabel.text = @"开启";
        }
    }
    
    
    
}


@end
