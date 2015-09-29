//
//  Post.h
//  
//
//  Created by Aynur Galiev on 29.09.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ImageUrl, User;

@interface Post : NSManagedObject

@property (nonatomic, retain) NSNumber * likesCount;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSSet *imageURLs;
@property (nonatomic, retain) User *owner;
@end

@interface Post (CoreDataGeneratedAccessors)

- (void)addImageURLsObject:(ImageUrl *)value;
- (void)removeImageURLsObject:(ImageUrl *)value;
- (void)addImageURLs:(NSSet *)values;
- (void)removeImageURLs:(NSSet *)values;

@end
