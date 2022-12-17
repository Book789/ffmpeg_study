//
//  PlayerViewController.m
//  FFmpegStudy
//
//

#import "PlayerViewController.h"
#import "XYQMovieObject.h"
#define LERP(A,B,C) ((A)*(1.0-C)+(B)*C)

@interface PlayerViewController ()

@property (nonatomic, strong) XYQMovieObject *video;

@property (nonatomic, strong) UIImageView * sourceImageView;


@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *outputPath = [docDir stringByAppendingPathComponent:@"music.ts"];
//    self.outputView.text = outputPath;
    NSString *inputPath = [[NSBundle mainBundle] pathForResource:@"video.mp4" ofType:nil];

    self.sourceImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    self.sourceImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.sourceImageView];
    
    self.video = [[XYQMovieObject alloc] initWithVideo:outputPath];
    
    //播放本地视频
    //  self.video = [[XYQMovieObject alloc] initWithVideo:[NSString bundlePath:@"Dalshabet.mp4"]];
    //  self.video = [[XYQMoiveObject alloc] initWithVideo:@"/Users/king/Desktop/Stellar.mp4"];
    //  self.video = [[XYQMoiveObject alloc] initWithVideo:@"/Users/king/Downloads/Worth it - Fifth Harmony ft.Kid Ink - May J Lee Choreography.mp4"];
    //  self.video = [[XYQMoiveObject alloc] initWithVideo:@"/Users/king/Downloads/4K.mp4"];
    
    //播放直播
    //  self.video = [[XYQMovieObject alloc] initWithVideo:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    
    
    //设置video
    //  video.outputWidth = 800;
    //  video.outputHeight = 600;
    //  self.audio = [[XYQMovieObject alloc] initWithVideo:@"/Users/king/Desktop/Stellar.mp4"];
    //  NSLog(@"视频总时长>>>video duration: %f",video.duration);
    //  NSLog(@"源尺寸>>>video size: %d x %d", video.sourceWidth, video.sourceHeight);
    //  NSLog(@"输出尺寸>>>video size: %d x %d", video.outputWidth, video.outputHeight);
    //
    //  [self.audio seekTime:0.0];
    //  SJLog(@"%f", [self.audio duration])
    //  AVPacket *packet = [self.audio readPacket];
    //  SJLog(@"%ld", [self.audio decode])
//    int tns, thh, tmm, tss;
//    tns = video.duration;
//    thh = tns / 3600;
//    tmm = (tns % 3600) / 60;
//    tss = tns % 60;
//
//    _lastFrameTime = -1;
//
    // seek to 0.0 seconds
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 300, 100, 40);
    button.backgroundColor =[UIColor greenColor];
    [button addTarget:self action:@selector(player) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


}
-(void)player{
    [_video seekTime:0.0];
    [NSTimer scheduledTimerWithTimeInterval: 1 / _video.fps
                                     target:self
                                   selector:@selector(displayNextFrame:)
                                   userInfo:nil
                                    repeats:YES];

}
-(void)displayNextFrame:(NSTimer *)timer {
//    NSTimeInterval startTime = [NSDate timeIntervalSinceReferenceDate];
//    //    self.TimerLabel.text = [NSString stringWithFormat:@"%f s",video.currentTime];
//    self.TimerLabel.text  = [self dealTime:video.currentTime];
//    if (![video stepFrame]) {
//        [timer invalidate];
//        [playBtn setEnabled:YES];
//        return;
//    }
    if (![_video stepFrame]) {
        return;
    }
    self.sourceImageView.image = _video.currentImage;
//    float frameTime = 1.0 / ([NSDate timeIntervalSinceReferenceDate] - startTime);
//    if (_lastFrameTime < 0) {
//        _lastFrameTime = frameTime;
//    } else {
//        _lastFrameTime = LERP(frameTime, _lastFrameTime, 0.8);
//    }
//    [fps setText:[NSString stringWithFormat:@"fps %.0f",_lastFrameTime]];
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
