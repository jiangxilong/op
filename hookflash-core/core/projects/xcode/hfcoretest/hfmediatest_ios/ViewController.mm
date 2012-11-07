//
//  ViewController.m
//  hfmediatest_ios
//
//  Created by Vladimir Morosev on 9/12/12.
//
//

#import "ViewController.h"
#import "MediaEngineDelegateWrapper.h"
#include <hookflash/IClient.h>

@implementation ViewController

- (void) SendLastFrameToMainView:(UIImage*) image :(id) sender
{
    IPhoneRenderView* renderView = (IPhoneRenderView*) sender;
    if (renderView == _renderView1)
    {
        [_imgView1 setFrame:CGRectMake(_imgView1.frame.origin.x, _imgView1.frame.origin.y, image.size.width, image.size.height)];
        [_imgView1 performSelectorOnMainThread:@selector(setImage:)
                                withObject:image waitUntilDone:NO];
    }
    else if (renderView == _renderView2)
    {
        [_imgView2 setFrame:CGRectMake(_imgView2.frame.origin.x, _imgView2.frame.origin.y, image.size.width, image.size.height)];
        [_imgView2 performSelectorOnMainThread:@selector(setImage:)
                                withObject:image waitUntilDone:NO];
    }
}

- (void) SendLastFrameToSubView:(UIImage*) image :(id) sender
{
    IPhoneRenderView* renderView = (IPhoneRenderView*) sender;
    if (renderView == _renderView1)
    {
        [_imgView1 performSelectorOnMainThread:@selector(setImage:)
                                withObject:image waitUntilDone:NO];
    }
    else if (renderView == _renderView2)
    {
        [_imgView2 performSelectorOnMainThread:@selector(setImage:)
                                withObject:image waitUntilDone:NO];
    }
}
-(IBAction)startTest1
{
    //NSString* documents = [NSHomeDirectory() stringByAppendingString:@"/Documents/"];
    //const char* buffer = [documents UTF8String];
    //const char* receiverIPAddress = [receiverIPAddressTextField.text UTF8String];
    //const char* receiverIPAddress = "127.0.0.1";
  
    IClient::setup();
    
    mediaEngineDelegatePtr = MediaEngineDelegateWrapper::create();
  
//    IClient::setLogLevel(IClient::Log::Trace);
//    IClient::setLogLevel("hookflash_services", IClient::Log::Debug);      // recommend Debug
//    IClient::setLogLevel("hookflash_media", IClient::Log::Debug);         // recommend Debug
//    IClient::installTelnetLogger(59999, 60, true);
  
    hookflash::internal::IMediaEngineForTestApplication::setup(mediaEngineDelegatePtr);
  
    hookflash::internal::IMediaEngineForTestApplicationPtr mediaEngine =
        hookflash::internal::IMediaEngineForTestApplication::singleton();
  
    mediaEngine->setCaptureRenderView(_renderView1);
    mediaEngine->setChannelRenderView(_renderView2);
    
    mediaEngine->setEcEnabled(true);
    mediaEngine->setAgcEnabled(true);
    mediaEngine->setNsEnabled(false);
    mediaEngine->setMuteEnabled(false);
    mediaEngine->setLoudspeakerEnabled(false);
    
    mediaEngine->setReceiverAddress("127.0.0.1");
  
    mediaEngine->startVoice();
    mediaEngine->startVideo();
}

-(IBAction)startTest2
{
    hookflash::internal::IMediaEngineForTestApplicationPtr mediaEngine =
        hookflash::internal::IMediaEngineForTestApplication::singleton();
  
//    mediaEngine->setVideoOrientation();

    mediaEngine->stopVoice();
    mediaEngine->stopVideo();
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        _renderView1 = [[IPhoneRenderView alloc] init];
        _renderView1.viewId = 0;
        _renderView1.delegate = self;
        _renderView2 = [[IPhoneRenderView alloc] init];
        _renderView2.viewId = 0;
        _renderView2.delegate = self;
        self.title = @"Video Test";
    }
  
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged) name:@"orientationChanged" object:nil];
    [[UIApplication sharedApplication] setIdleTimerDisabled: YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"orientationChanged" object:nil];
}

- (void)orientationChanged
{
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"orientationChanged" object:nil];
}

@end
