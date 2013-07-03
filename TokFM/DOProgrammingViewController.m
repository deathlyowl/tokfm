//
//  DOProgrammingViewController.m
//  TokFM
//
//  Created by Paweł Ksieniewicz on 03.07.2013.
//  Copyright (c) 2013 Deathly Owl. All rights reserved.
//

#import "DOProgrammingViewController.h"
#import "DOProgramViewController.h"

@implementation DOProgrammingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    programming = [[RadioDataModel sharedObject] programming];

    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    
    NSInteger weekday = [[gregorian components:NSWeekdayCalendarUnit
                                      fromDate:[NSDate date]] weekday];
    
    [_weekdayControl setSelectedSegmentIndex:( 7 + weekday - 2) % 7];
    [self valueChanged:nil];
    
    self.clearsSelectionOnViewWillAppear = NO;
}



- (IBAction)valueChanged:(id)sender {
    day = [self dayWithIndex:( 7 + _weekdayControl.selectedSegmentIndex ) % 7];
    keys = [[[programming objectForKey:day] allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString *a, NSString *b) {return a.intValue > b.intValue;}];
    [self.tableView reloadData];    
}

- (NSString *) dayWithIndex:(int) index {
    switch (index) {
        case 0: return @"MON";
        case 1: return @"TUE";
        case 2: return @"WEN";
        case 3: return @"THU";
        case 4: return @"FRI";
        case 5: return @"SAT";
        case 6: return @"SUN";
        default:return nil;
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow
                                  animated:YES];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *)selectedProgram{
    return [[[RadioDataModel sharedObject] programs] objectForKey:[self selectedTitle]];
}

- (NSString *) selectedTitle{
    NSString *key = [keys objectAtIndex:self.tableView.indexPathForSelectedRow.row];

    return [[[[programming objectForKey:day] objectForKey:key] componentsSeparatedByString:@" — "] firstObject];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DOProgramViewController *programViewController = (DOProgramViewController *)segue.destinationViewController;
    [programViewController setProgram:[self selectedProgram]];
    [programViewController setTitle:[self selectedTitle]];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([self selectedProgram]) return YES;
    else {
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow
                                      animated:YES];
        return NO;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return keys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *key = [keys objectAtIndex:indexPath.row];
    
    NSString *hour = [NSString stringWithFormat:@"%i:%02i", key.intValue / 60, key.intValue % 60];
    NSArray *componnents = [[[programming objectForKey:day] objectForKey:key] componentsSeparatedByString:@" — "];
    [cell.textLabel setText:hour];
    [cell.detailTextLabel setText:componnents.lastObject];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
@end
