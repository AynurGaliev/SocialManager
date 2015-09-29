//
//  ImageUrl.h
//  
//
//  Created by Aynur Galiev on 29.09.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface ImageUrl : NSManagedObject

@property (nonatomic, retain) NSString * small;
@property (nonatomic, retain) NSString * medium;
@property (nonatomic, retain) NSString * large;
@property (nonatomic, retain) Post *post;

@end
