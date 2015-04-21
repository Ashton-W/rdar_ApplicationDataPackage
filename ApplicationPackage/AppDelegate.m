#import "AppDelegate.h"
#import "DetailViewController.h"
#import "MasterViewController.h"
#import "CoreDataStack.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@property (nonatomic) CoreDataStack *coreDataStack;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;

    UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
    MasterViewController *controller = (MasterViewController *)masterNavigationController.topViewController;
    controller.managedObjectContext = self.managedObjectContext;
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - CoreData Stack

- (CoreDataStack *)coreDataStack
{
    return [CoreDataStack sharedInstance];
}

- (NSManagedObjectContext *)managedObjectContext
{
    return self.coreDataStack.managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    return self.coreDataStack.managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return self.coreDataStack.persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [self.coreDataStack applicationDocumentsDirectory];
}

- (void)saveContext
{
    [self.coreDataStack saveContext];
}

@end
