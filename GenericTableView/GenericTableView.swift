//
//  GenericTableView.swift
//  GenericTableView
//
//  Created by Derrick Ho on 12/18/16.
//  Copyright © 2016 Derrick Ho. All rights reserved.
//

import Foundation
import UIKit

final class GTVSection: NSObject {
	fileprivate var _headerTitle: String = ""
	public func setHeaderTitle(_ title: String) -> Self {
		_headerTitle = title
		return self
	}
	
	fileprivate var _footerTitle: String = ""
	public func setFooterTitle(_ title: String) -> Self {
		_footerTitle = title
		return self
	}
	
	fileprivate var _cells: [GTVCell] = []
	public func setCells(_ cells: [GTVCell]) -> Self {
		_cells = cells
		return self
	}
	
}

final class GTVCell: NSObject {
	fileprivate var _tableView_cellForRowAtIndexPath: (UITableView, IndexPath) -> UITableViewCell = { _ in  UITableViewCell() }
	public func setBlock_cellForRowAtIndexPath(_ block: @escaping (UITableView, IndexPath) -> UITableViewCell) -> Self {
		_tableView_cellForRowAtIndexPath = block
		return self
	}
	
	fileprivate var _tableView_estimatedHeightForRowAtIndexPath: (UITableView, IndexPath) -> CGFloat = { _ in 44.0 }
	public func setBlock_estimatedHeightForRowAtIndexPath(_ block: @escaping (UITableView, IndexPath) -> CGFloat) -> Self {
		_tableView_estimatedHeightForRowAtIndexPath = block
		return self
	}
	
	fileprivate var _tableView_heightForRowAtIndexPath: (UITableView, IndexPath) -> CGFloat = { _ in UITableViewAutomaticDimension }
	public func setBlock_heightForRowAtIndexPath(_ block: @escaping (UITableView, IndexPath) -> CGFloat) -> Self {
		_tableView_heightForRowAtIndexPath = block
		return self
	}
	
	fileprivate var _tableView_didSelectRowAtIndexPath: (UITableView, IndexPath) -> () = { _ in }
	public func setBlock_didSelectRowAtIndexPath(_ block: @escaping (UITableView, IndexPath) -> ()) -> Self {
		_tableView_didSelectRowAtIndexPath = block
		return self
	}
}

/**
UITableView subclass
*/
@IBDesignable
final class GenericTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
	
	override init(frame: CGRect, style: UITableViewStyle) {
		super.init(frame: frame, style: style)
		dataSource = self
		delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		dataSource = self
		delegate = self
	}
	
	var dataSourceArray = [GTVSection]()
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return dataSourceArray.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSourceArray[section]._cells.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return dataSourceArray[indexPath.section]._cells[indexPath.row]
			._tableView_cellForRowAtIndexPath(tableView, indexPath)
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return dataSourceArray[section]._headerTitle
	}
	
	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return dataSourceArray[section]._footerTitle
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return dataSourceArray[indexPath.section]._cells[indexPath.row]
			._tableView_estimatedHeightForRowAtIndexPath(tableView, indexPath)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return dataSourceArray[indexPath.section]._cells[indexPath.row]
			._tableView_heightForRowAtIndexPath(tableView, indexPath)
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		return dataSourceArray[indexPath.section]._cells[indexPath.row]
			._tableView_didSelectRowAtIndexPath(tableView, indexPath)
	}
	
}
