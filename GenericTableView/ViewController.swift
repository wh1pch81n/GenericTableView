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
			GTVSection().setHeaderTitle("apple")
				.setCells([
					GTVCell()
						.setBlock_cellForRowAtIndexPath({ (UITableView, IndexPath) -> UITableViewCell in
							let cell = UITableViewCell()
							cell.contentView.backgroundColor = .red
							return cell
						})
					])
				.setFooterTitle("tree")
			, GTVSection().setHeaderTitle("Banana")
				.setCells([
					GTVCell()
						.setBlock_cellForRowAtIndexPath({ (UITableView, IndexPath) -> UITableViewCell in
							let cell = UITableViewCell()
							cell.contentView.backgroundColor = .yellow
							return cell
						})
					])
			, GTVSection().setHeaderTitle("orange")
				.setCells([
					GTVCell()
						.setBlock_cellForRowAtIndexPath({ (UITableView, IndexPath) -> UITableViewCell in
							let cell = UITableViewCell()
							cell.contentView.backgroundColor = .orange
							return cell
						})
					])
			, GTVSection().setHeaderTitle("Grape")
				.setCells([
					GTVCell()
						.setBlock_cellForRowAtIndexPath({ (UITableView, IndexPath) -> UITableViewCell in
							let cell = UITableViewCell()
							cell.contentView.backgroundColor = .purple
							return cell
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

