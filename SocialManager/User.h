//
//  User.h
//  
//
//  Created by Aynur Galiev on 29.09.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * avatarURL;
@property (nonatomic, retain) NSNumber * isOnline;
@property (nonatomic, retain) Post *sentPost;

@end
