//
//  ViewController.swift
//  GenericTableView
//
//  Created by Derrick Ho on 12/18/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

import UIKit

@IBDesignable
class View: UIView {
	
	var tableView: GenericTableView = GenericTableView(frame: CGRect.zero, style: UITableViewStyle.plain)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUp()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUp()
	}
	
	func setUp() {
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		leadingAnchor.constraint(equalTo: tableView.leadingAnchor).isActive = true
		trailingAnchor.constraint(equalTo: tableView.trailingAnchor).isActive = true
		topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
		bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
		
		tableView.dataSourceArray = [
			GTVSection()
				.setCells([
					GTVCell()
						.setBlock_cellForRowAtIndexPath({ _ in
							let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
							cell.textLabel!.text = "Apple"
							return cell
						})
						.setBlock_didSelectRowAtIndexPath({ _ in
							print("pressed Apple")
						})
					, GTVCell()
						.setBlock_cellForRowAtIndexPath({ _ in
							let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
							cell.textLabel!.text = "Banana"
							return cell
						})
						.setBlock_didSelectRowAtIndexPath({ _ in
							UIAlertView(title: nil, message: "pressed bananna", delegate: nil, cancelButtonTitle: "ok").show()
						})
					])
		]
	}
	
}

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

class OldViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	var tableView: UITableView = UITableView()
	
	var array = ["Apple", "Bananna"]
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return array.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
		if indexPath.row == 0 {
			cell.textLabel!.text = array[indexPath.row]
		} else if indexPath.row == 1 {
			cell.textLabel!.text = array[indexPath.row]
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 0 {
			print("pressed Apple")
		} else if indexPath.row == 1 {
			UIAlertView(title: nil, message: "pressed bananna", delegate: nil, cancelButtonTitle: "ok").show()
		}
	}
	
}


