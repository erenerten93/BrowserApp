//
//  Factory.swift
//  BrowserApp
//
//  Created by Eren Erten on 18.07.2023.
//
import UIKit

// MARK: - Label
func makeLabel(withText text: String) -> UILabel {
   let label = UILabel()
   label.translatesAutoresizingMaskIntoConstraints = false
   label.textAlignment = .center
   label.numberOfLines = 0
   label.textColor = .lightGray
   label.text = text
   label.minimumScaleFactor = 0.2

   return label
}

//MARK: - StackView
func makeStackView(withOrientation axis: NSLayoutConstraint.Axis,distribution : UIStackView.Distribution) -> UIStackView {
   let stackView = UIStackView()
   stackView.translatesAutoresizingMaskIntoConstraints = false
   stackView.axis = axis
   stackView.distribution =  distribution
    stackView.alignment = .center
   stackView.spacing = 10.0
   return stackView
}
//MARK: - Make TableView
func makeTableView() -> UITableView{
   let tableView = UITableView()
   tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .white
   return tableView
}
