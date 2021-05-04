//
//  DetailVC.swift
//  IsaIshangulyyev_HW3
//
//  Created by Isa Ishangulyyev on 4.05.2021.
//

import UIKit

class DetailVC: UIViewController {
	var mItem: Record?
	@IBOutlet weak var mImageView: UIImageView!
	@IBOutlet weak var mTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		if let item = mItem {
			mImageView.image = UIImage(named: item.image.lowercased())
			self.title = item.name
			self.mTextView.text = item.description
		}
    }
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
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
