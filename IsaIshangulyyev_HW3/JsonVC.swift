//
//  JsonVC.swift
//  IsaIshangulyyev_HW3
//
//  Created by Isa Ishangulyyev on 4.05.2021.
//

import UIKit

class JsonVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var mTableView: UITableView!
	// var data: DataSource! = nil
	let data = DataSource(type: "json")

	func numberOfSections(in tableView: UITableView) -> Int {
		return self.data.numberOfCategories()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.numbeOfItemsInEachCategory(index: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//var cell = UITableViewCell()

		// Recommended way
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell

		let items: [Record] = data.itemsInCategory(index: indexPath.section)
		let item = items[indexPath.row]

		cell.textLabel?.text = item.name
		cell.imageView?.image = UIImage(named: item.image.lowercased())

		return cell
	}
	
	// Setting the header title for each section
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return data.getCategoryLabelAtIndex(index: section)
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 40.0
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier != "detail" {
			return;
		}

		if let indexPath = getIndexPathForSelectedRow() {
			let item = data.itemsInCategory(index: indexPath.section)[indexPath.row]
			let detailViewController = segue.destination as! DetailVC
			detailViewController.mItem = item
		}
	}

	// Our function to have a reference to indexPath for the TableView
	func getIndexPathForSelectedRow() -> IndexPath? {
		var indexPath: IndexPath?
		
		if mTableView.indexPathsForSelectedRows!.count > 0 {
			indexPath = mTableView.indexPathsForSelectedRows![0] as IndexPath
		}
		
		return indexPath
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.mTableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
