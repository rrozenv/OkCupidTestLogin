//
//  UserInfoViewController.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/24/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, UIScrollViewDelegate {
    
    fileprivate var viewWidth: CGFloat = UIScreen.main.bounds.width //375
    fileprivate var viewHeight: CGFloat = UIScreen.main.bounds.height //667
    
    var selectGenderLabel: UILabel!
    var userSelectGender: HorizontalButtonStackView!
    var currentlySelectedGender: ButtonWithLabel?
    var lineDividerViewOne: UIView!
    var genderStackView: UIStackView!
    
    var selectInterestLabel: UILabel!
    var userSelectInterest: HorizontalButtonStackView!
    var currentlySelectedInterest: ButtonWithLabel?
    var lineDividerViewTwo: UIView!
    var interestStackView: UIStackView!
    
    var selectBirthYearLabel: UILabel!
    var userSelectBirthYear: HorizontalButtonStackView!
    var currentlySelectedYear: ButtonWithLabel?
    var lineDividerViewThree: UIView!
    var birthYearStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupSelectGenderLabel()
        setupSelectGenderButtons()
        setupLineDividerView()
        setupStackViewForGenderElements()
        
        setupSelectInterestLabel()
        setupSelectInterestButtons()
        setupLineDividerViewTwo()
        setupStackViewForInterestElements()
        
        setupSelectBirthYearLabel()
        setupSelectBirthYearButtons()
        setupLineDividerViewThree()
        setupStackViewForBirthYearElements()
    }
    
}

//MARK: Actions

extension UserInfoViewController {
    
    func didSelectGender(_ sender: UITapGestureRecognizer) {
        let button = sender.view as! ButtonWithLabel
        currentlySelectedGender?.isSelected = false
        currentlySelectedGender = button
        currentlySelectedGender?.isSelected = true
    }
    
    func didSelectInterest(_ sender: UITapGestureRecognizer) {
        let button = sender.view as! ButtonWithLabel
        currentlySelectedInterest?.isSelected = false
        currentlySelectedInterest = button
        currentlySelectedInterest?.isSelected = true
    }
    
    func didSelectBirthYear(_ sender: UITapGestureRecognizer) {
        let button = sender.view as! ButtonWithLabel
        currentlySelectedYear?.isSelected = false
        currentlySelectedYear = button
        currentlySelectedYear?.isSelected = true
    }
    
}

//MARK: View Setup

extension UserInfoViewController {
    
    func setupSelectGenderLabel() {
        selectGenderLabel = UILabel()
        selectGenderLabel.text = "I'm a..."
        selectGenderLabel.font = UIFont(name: "Avenir-Black", size: 14)
    }
    
    func setupSelectGenderButtons() {
        userSelectGender = HorizontalButtonStackView(backgroundColor: Palette.navy.color, textColor: UIColor.white, textLabels: ["man", "woman", "neither"], numberOfViews: 3)
        //userSelectGender.scrollView.delegate = self
        
        for button in userSelectGender.buttons {
            let didSelectGenderGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectGender(_:)))
            button.addGestureRecognizer(didSelectGenderGesture)
        }
        
        userSelectGender.translatesAutoresizingMaskIntoConstraints = false
        userSelectGender.widthAnchor.constraint(equalToConstant: 270).isActive = true
        userSelectGender.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupLineDividerView() {
        lineDividerViewOne = UIView()
        lineDividerViewOne.backgroundColor = Palette.lightGrey.color
        lineDividerViewOne.layer.cornerRadius = 2.0
        lineDividerViewOne.layer.masksToBounds = true
        
        lineDividerViewOne.translatesAutoresizingMaskIntoConstraints = false
        lineDividerViewOne.heightAnchor.constraint(equalToConstant: viewHeight * (3/667)).isActive = true
        lineDividerViewOne.widthAnchor.constraint(equalToConstant: viewWidth * (270/375)).isActive = true
    }
    
    func setupStackViewForGenderElements() {
        let views = [selectGenderLabel, userSelectGender, lineDividerViewOne]
        
        genderStackView = UIStackView(arrangedSubviews: views as! [UIView])
        genderStackView.axis = .vertical
        genderStackView.distribution = .equalSpacing
        genderStackView.alignment = .leading
        genderStackView.spacing = 15
        
        view.addSubview(genderStackView)
        genderStackView.translatesAutoresizingMaskIntoConstraints = false
        genderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        genderStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

extension UserInfoViewController {
    
    func setupSelectInterestLabel() {
        selectInterestLabel = UILabel()
        selectInterestLabel.text = "I'm interested in..."
        selectInterestLabel.font = UIFont(name: "Avenir-Black", size: 14)
    }
    
    func setupSelectInterestButtons() {
        userSelectInterest = HorizontalButtonStackView(backgroundColor: Palette.lightGrey.color, textColor: Palette.grey.color, textLabels: ["men", "women", "both"], numberOfViews: 3)
        //userSelectInterest.scrollView.delegate = self
        
        for button in userSelectInterest.buttons {
            let didSelectGenderGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectInterest(_:)))
            button.addGestureRecognizer(didSelectGenderGesture)
        }
        
        userSelectInterest.translatesAutoresizingMaskIntoConstraints = false
        userSelectInterest.widthAnchor.constraint(equalToConstant: 270).isActive = true
        userSelectInterest.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupLineDividerViewTwo() {
        lineDividerViewTwo = UIView()
        lineDividerViewTwo.backgroundColor = Palette.lightGrey.color
        lineDividerViewTwo.layer.cornerRadius = 2.0
        lineDividerViewTwo.layer.masksToBounds = true
        
        lineDividerViewTwo.translatesAutoresizingMaskIntoConstraints = false
        lineDividerViewTwo.heightAnchor.constraint(equalToConstant: viewHeight * (3/667)).isActive = true
        lineDividerViewTwo.widthAnchor.constraint(equalToConstant: viewWidth * (270/375)).isActive = true
    }
    
    func setupStackViewForInterestElements() {
        interestStackView = UIStackView()
        interestStackView.addArrangedSubview(selectInterestLabel)
        interestStackView.addArrangedSubview(userSelectInterest)
        interestStackView.addArrangedSubview(lineDividerViewTwo)
        
        interestStackView.axis = .vertical
        interestStackView.distribution = .equalSpacing
        interestStackView.alignment = .leading
        interestStackView.spacing = 15
        
        view.addSubview(interestStackView)
        interestStackView.translatesAutoresizingMaskIntoConstraints = false
        interestStackView.topAnchor.constraint(equalTo: genderStackView.bottomAnchor, constant: 30).isActive = true
        interestStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    
}

extension UserInfoViewController {
    
    func setupSelectBirthYearLabel() {
        selectBirthYearLabel = UILabel()
        selectBirthYearLabel.text = "I was born in..."
        selectBirthYearLabel.font = UIFont(name: "Avenir-Black", size: 14)
    }
    
    func setupSelectBirthYearButtons() {
        userSelectBirthYear = HorizontalButtonStackView(backgroundColor: Palette.lightGrey.color, textColor: Palette.green.color, textLabels: ["1999", "1998", "1997", "1996", "1995", "1994"], numberOfViews: 6)
        //userSelectInterest.scrollView.delegate = self
        
        for button in userSelectBirthYear.buttons {
            let didSelectGenderGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectBirthYear(_:)))
            button.addGestureRecognizer(didSelectGenderGesture)
        }
        
        userSelectBirthYear.translatesAutoresizingMaskIntoConstraints = false
        userSelectBirthYear.widthAnchor.constraint(equalToConstant: 270).isActive = true
        userSelectBirthYear.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupLineDividerViewThree() {
        lineDividerViewThree = UIView()
        lineDividerViewThree.backgroundColor = Palette.lightGrey.color
        lineDividerViewThree.layer.cornerRadius = 2.0
        lineDividerViewThree.layer.masksToBounds = true
        
        lineDividerViewThree.translatesAutoresizingMaskIntoConstraints = false
        lineDividerViewThree.heightAnchor.constraint(equalToConstant: viewHeight * (3/667)).isActive = true
        lineDividerViewThree.widthAnchor.constraint(equalToConstant: viewWidth * (270/375)).isActive = true
    }
    
    func setupStackViewForBirthYearElements() {
        birthYearStackView = UIStackView()
        birthYearStackView.addArrangedSubview(selectBirthYearLabel)
        birthYearStackView.addArrangedSubview(userSelectBirthYear)
        birthYearStackView.addArrangedSubview(lineDividerViewThree)
        
        birthYearStackView.axis = .vertical
        birthYearStackView.distribution = .equalSpacing
        birthYearStackView.alignment = .leading
        birthYearStackView.spacing = 15
        
        view.addSubview(birthYearStackView)
        birthYearStackView.translatesAutoresizingMaskIntoConstraints = false
        birthYearStackView.topAnchor.constraint(equalTo: interestStackView.bottomAnchor, constant: 30).isActive = true
        birthYearStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
