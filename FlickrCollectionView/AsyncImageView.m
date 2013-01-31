//
//  AsyncImageView.m
//  FlickrCollectionView
//
//  Created by 山田 慶 on 2013/01/30.
//  Copyright (c) 2013年 山田 慶. All rights reserved.
//

#import "AsyncImageView.h"

@implementation AsyncImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)loadImage:(NSString *)url{
	self.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
	data = [[NSMutableData alloc] initWithCapacity:0];
    
	NSURLRequest *req = [NSURLRequest
						 requestWithURL:[NSURL URLWithString:url]
						 cachePolicy:NSURLRequestUseProtocolCachePolicy
						 timeoutInterval:30.0];
	conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //	NSLog(@"connection didRecieveResponse");
	[data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)nsdata{
    //	NSLog(@"connection didReceiveData len=%d", [nsdata length]);
	[data appendData:nsdata];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //	NSLog(@"connection didFailWithError - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //	NSLog(@"connection connectionDidFinishLoading");
	self.contentMode = UIViewContentModeScaleAspectFit;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight;
    
	self.image = [UIImage imageWithData:data];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
