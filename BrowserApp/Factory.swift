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

//MARK: - Text Field
func makeTextField(withPlaceholderText placeHolderText: String) -> UITextField {
   let textField = UITextField()
   textField.setContentHuggingPriority(UILayoutPriority(749), for: .horizontal)
   textField.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
   textField.textAlignment = .center
   textField.translatesAutoresizingMaskIntoConstraints = false
   textField.placeholder = placeHolderText
   textField.borderStyle = .roundedRect
   
   return textField
}

//MARK: - Buttons
func makeButton(withText text: String) -> UIButton {
   let button = UIButton(type: .system)
   button.translatesAutoresizingMaskIntoConstraints = false
   button.setTitle(text, for: .normal)

   var config = UIButton.Configuration.filled()
   config.baseBackgroundColor = .systemBlue
   config.cornerStyle = .capsule
   config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
   button.configuration = config
   
   return button
}

func makeButton(withText text: String, color: UIColor) -> UIButton {
   let button = makeButton(withText: text)
   button.backgroundColor = color
   
   return button
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
