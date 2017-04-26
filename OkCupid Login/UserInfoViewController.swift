//
//  UserInfoViewController.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/24/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import UIKit

struct DeviceSize {
    var viewWidth: CGFloat = UIScreen.main.bounds.width //375
    var viewHeight: CGFloat = UIScreen.main.bounds.height //667
}

class UserInfoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var viewWidth: CGFloat = self.view.frame.width
    lazy var viewHeight: CGFloat = self.view.frame.height
    lazy var itemWidth: CGFloat = self.view.frame.width * (269/self.view.frame.width)
    lazy var itemHeight: CGFloat = self.view.frame.height * (45/self.view.frame.height)
    
    //Selected time for collection view
    let selectHourCollectionViewLayout = UICollectionViewFlowLayout()
    lazy var selectHourCollectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.selectHourCollectionViewLayout)
    let cellID = "BirthYear"
    
    var selectedYear: Year?
    var previouslySelectedIndexPath: IndexPath?
    var years: [Year] = [Year("1999"), Year("1999"), Year("1999"), Year("1999"), Year("1999"), Year("1999")]
    
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
    var lineDividerViewThree: UIView!
    
    var doneButton: UIButton!
    var userInfoImageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupDoneButton()
        
        //Select birth year views
        setupLineDividerViewThree()
        setupCollectionViewLayout()
        setupCollectionView()
        setupSelectBirthYearLabel()
        
        //Select interest views
        setupSelectInterestLabel()
        setupSelectInterestButtons()
        setupLineDividerViewTwo()
        setupStackViewForInterestElements()
        
        //Select gender views
        setupSelectGenderLabel()
        setupSelectGenderButtons()
        setupLineDividerView()
        setupStackViewForGenderElements()
        
        setupUserInfoImageView()
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
}

//MARK: Actions

extension UserInfoViewController {
    
    func didSelectGender(_ sender: UITapGestureRecognizer) {
        let button = sender.view as! ButtonWithLabel
        currentlySelectedGender?.isSelected = false
        currentlySelectedGender = button
        currentlySelectedGender?.isSelected = true
        
        if currentlySelectedGender != nil && currentlySelectedInterest != nil && selectedYear != nil {
            doneButton.alpha = 1.0
        }
    }
    
    func didSelectInterest(_ sender: UITapGestureRecognizer) {
        let button = sender.view as! ButtonWithLabel
        currentlySelectedInterest?.isSelected = false
        currentlySelectedInterest = button
        currentlySelectedInterest?.isSelected = true
        
        if currentlySelectedGender != nil && currentlySelectedInterest != nil && selectedYear != nil {
            doneButton.alpha = 1.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! BirthYearCell
        guard !cell.year.isSelected else { return }

        if let currentYear = selectedYear, let previousIndexPath = previouslySelectedIndexPath {
            currentYear.isSelected = false
            let previousCell = collectionView.cellForItem(at: previousIndexPath) as? BirthYearCell
            previousCell?.deselectCell()
        }
        
        cell.year.isSelected = true
        cell.year = years[indexPath.row]
        selectedYear = cell.year
        
        let currentIndexPath = collectionView.indexPath(for: cell)
        previouslySelectedIndexPath = currentIndexPath
        
        if currentlySelectedGender != nil && currentlySelectedInterest != nil && selectedYear != nil {
            doneButton.alpha = 1.0
        }
    }
    
}

//MARK: Birth Year Collection View DataSource

extension UserInfoViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return years.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BirthYearCell
        cell.year = years[indexPath.row]
        if cell.layer.cornerRadius != 2.0 {
            cell.layer.cornerRadius = 2.0
            cell.layer.masksToBounds = true
        }
        return cell
    }

}

//MARK: Birth Year Collection View Delegate

extension UserInfoViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return viewWidth * (10/viewWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let currentCell = cell as! BirthYearCell
        currentCell.year = years[indexPath.row]
        if !currentCell.year.isSelected {
            currentCell.deselectCell()
        }
    }
    
}

//MARK: Select Birth Year View Setup

extension UserInfoViewController {
    
    func setupDoneButton() {
        doneButton = UIButton()
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
        doneButton.backgroundColor = Palette.aqua.color
        doneButton.alpha = 0
        
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    func setupLineDividerViewThree() {
        lineDividerViewThree = UIView()
        lineDividerViewThree.backgroundColor = Palette.lightGrey.color
        lineDividerViewThree.layer.cornerRadius = 2.0
        lineDividerViewThree.layer.masksToBounds = true
        
        view.addSubview(lineDividerViewThree)
        lineDividerViewThree.translatesAutoresizingMaskIntoConstraints = false
        lineDividerViewThree.heightAnchor.constraint(equalToConstant: viewHeight * (3/667)).isActive = true
        lineDividerViewThree.widthAnchor.constraint(equalToConstant: viewWidth * (270/375)).isActive = true
        lineDividerViewThree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53).isActive = true
        lineDividerViewThree.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -28).isActive = true
    }
    
    func setupCollectionViewLayout() {
        let leftInset: CGFloat = 53
        let itemWidth = viewWidth * (83/viewWidth)
        let itemHeight = viewHeight * (45/viewHeight)
        selectHourCollectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: leftInset)
        selectHourCollectionViewLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        selectHourCollectionViewLayout.scrollDirection = .horizontal
    }
    
    func setupCollectionView() {
        selectHourCollectionView.backgroundColor = UIColor.white
        selectHourCollectionView.allowsMultipleSelection = false
        selectHourCollectionView.showsHorizontalScrollIndicator = false
        selectHourCollectionView.delegate = self
        selectHourCollectionView.dataSource = self
        selectHourCollectionView.register(BirthYearCell.self, forCellWithReuseIdentifier: cellID)
        
        view.addSubview(selectHourCollectionView)
        selectHourCollectionView.translatesAutoresizingMaskIntoConstraints = false
        selectHourCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        selectHourCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        selectHourCollectionView.bottomAnchor.constraint(equalTo: lineDividerViewThree.topAnchor, constant: -viewHeight * (15/viewHeight)).isActive = true
        selectHourCollectionView.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
    }
    
    func setupSelectBirthYearLabel() {
        selectBirthYearLabel = UILabel()
        selectBirthYearLabel.text = "I was born in..."
        selectBirthYearLabel.font = UIFont(name: "Avenir-Black", size: 14)
        
        view.addSubview(selectBirthYearLabel)
        selectBirthYearLabel.translatesAutoresizingMaskIntoConstraints = false
        selectBirthYearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53).isActive = true
        selectBirthYearLabel.bottomAnchor.constraint(equalTo: selectHourCollectionView.topAnchor, constant: -15).isActive = true
    }
    
}

//MARK: Select Interest View Setup

extension UserInfoViewController {
    
    func setupLineDividerViewTwo() {
        lineDividerViewTwo = UIView()
        lineDividerViewTwo.backgroundColor = Palette.lightGrey.color
        lineDividerViewTwo.layer.cornerRadius = 2.0
        lineDividerViewTwo.layer.masksToBounds = true
        
        lineDividerViewTwo.heightAnchor.constraint(equalToConstant: viewHeight * (3/667)).isActive = true
        lineDividerViewTwo.widthAnchor.constraint(equalToConstant: viewWidth * (270/375)).isActive = true
    }
    
    func setupSelectInterestButtons() {
        userSelectInterest = HorizontalButtonStackView(backgroundColor: Palette.lightGrey.color, textColor: Palette.grey.color, textLabels: ["men", "women", "both"], numberOfViews: 3)
        
        for button in userSelectInterest.buttons {
            let didSelectGenderGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectInterest(_:)))
            button.addGestureRecognizer(didSelectGenderGesture)
        }
        
        userSelectInterest.translatesAutoresizingMaskIntoConstraints = false
        userSelectInterest.widthAnchor.constraint(equalToConstant: 270).isActive = true
        userSelectInterest.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    func setupSelectInterestLabel() {
        selectInterestLabel = UILabel()
        selectInterestLabel.text = "I'm interested in..."
        selectInterestLabel.font = UIFont(name: "Avenir-Black", size: 14)
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
        interestStackView.bottomAnchor.constraint(equalTo: selectBirthYearLabel.topAnchor, constant: -30).isActive = true
        interestStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

//MARK: Select Gender View Setup

extension UserInfoViewController {
    
    func setupSelectGenderLabel() {
        selectGenderLabel = UILabel()
        selectGenderLabel.text = "I'm a..."
        selectGenderLabel.font = UIFont(name: "Avenir-Black", size: 14)
    }
    
    func setupSelectGenderButtons() {
        userSelectGender = HorizontalButtonStackView(backgroundColor: Palette.navy.color, textColor: UIColor.white, textLabels: ["man", "woman", "neither"], numberOfViews: 3)
        
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
        genderStackView.bottomAnchor.constraint(equalTo: interestStackView.topAnchor, constant: -30).isActive = true
    }
    
    func setupUserInfoImageView() {
        userInfoImageView = UIImageView()
        userInfoImageView.contentMode = .scaleAspectFit
        userInfoImageView.image = UIImage(named: "UserInfoImage")
        
        view.addSubview(userInfoImageView)
        userInfoImageView.translatesAutoresizingMaskIntoConstraints = false
        userInfoImageView.heightAnchor.constraint(equalToConstant: 162).isActive = true
        userInfoImageView.widthAnchor.constraint(equalToConstant: 260).isActive = true
        userInfoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userInfoImageView.bottomAnchor.constraint(equalTo: genderStackView.topAnchor, constant: -32).isActive = true
    }

}
