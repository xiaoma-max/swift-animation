//
//  PackTableViewController.swift
//  SwiftAnimation
//
//  Created by Max on 27/07/2015.
//  Copyright (c) 2015 Max. All rights reserved.
//

import UIKit

class PackViewController: UIViewController {
  //MARK: IB outlets
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var buttonMenu: UIButton!
  @IBOutlet weak var titleLabel: UILabel!
  
 // var slider: HorizontalItemList!
  var isMenuOpen = false
  var items: [Int] = [5, 6, 7]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView?.rowHeight = 54.0
  }
  
  func showItem(index: Int) {
    println("tapped item \(index)")
    
  }
}
let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

extension PackViewController: UITableViewDelegate, UITableViewDataSource {
  // MARK: Table View methods
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    cell.accessoryType = .None
    cell.textLabel?.text = itemTitles[items[indexPath.row]]
    cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    showItem(items[indexPath.row])
  }

}