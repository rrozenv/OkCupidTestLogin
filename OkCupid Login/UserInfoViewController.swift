
import UIKit

class UserInfoViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate var doneButton: UIButton!
    fileprivate var userInfoImageView: UIImageView!
    
    //Select Birth Year Properties
    fileprivate let birthYearCollViewLayout = UICollectionViewFlowLayout()
    lazy var itemWidth: CGFloat = DeviceSize.viewWidth * (269/375)
    lazy var itemHeight: CGFloat = DeviceSize.viewHeight * (45/667)
    fileprivate lazy var birthYearCollView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.birthYearCollViewLayout)
    fileprivate var years = [Year]()
    fileprivate let cellID = "BirthYear"
    fileprivate var currentYear: Year?
    fileprivate var currentYearIndexPath: IndexPath?
    fileprivate var selectBirthYearLabel: UILabel!
    fileprivate var birthYearLineDividerView: UIView!
    
    //Select Gender Properties
    fileprivate var currentGender: ButtonWithLabel?
    fileprivate var genderElementsStackView: UIStackView!
    fileprivate var selectGenderLabel: UILabel!
    fileprivate var genderLineDivider: UIView!
    fileprivate var genderOptionsStackView: HorizontalButtonStackView! {
        didSet {
            genderOptionsStackView.views.forEach {
                let gesture = UITapGestureRecognizer(target: self, action: #selector(didSelectGender(_:)))
                $0.addGestureRecognizer(gesture)
            }
        }
    }
    
    //Select Interest Properties
    fileprivate var currentInterest: ButtonWithLabel?
    fileprivate var interestedInElementsStackView: UIStackView!
    fileprivate var selectInterestLabel: UILabel!
    fileprivate var interestLineDivider: UIView!
    fileprivate var interestedInOptionsStackView: HorizontalButtonStackView! {
        didSet {
            interestedInOptionsStackView.views.forEach {
                let gesture = UITapGestureRecognizer(target: self, action: #selector(didSelectInterest(_:)))
                $0.addGestureRecognizer(gesture)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupDoneButton()
        setupBirthYears()
        
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
    
    @objc fileprivate func didSelectGender(_ sender: UITapGestureRecognizer) {
        let button = sender.view as? ButtonWithLabel
        currentGender?.isSelected = false
        currentGender = button
        currentGender?.isSelected = true
        checkIfDoneButtonShouldBePresented()
    }
    
    @objc fileprivate func didSelectInterest(_ sender: UITapGestureRecognizer) {
        let button = sender.view as? ButtonWithLabel
        currentInterest?.isSelected = false
        currentInterest = button
        currentInterest?.isSelected = true
        checkIfDoneButtonShouldBePresented()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BirthYearCell {
            guard !cell.year.isSelected else { return }
            
            if let currentYear = currentYear, let previousIndexPath = currentYearIndexPath {
                currentYear.isSelected = false
                let previousCell = collectionView.cellForItem(at: previousIndexPath) as? BirthYearCell
                previousCell?.deselectCell()
            }
            
            cell.year.isSelected = true
            cell.year = years[indexPath.row]
            currentYear = cell.year
            
            let currentIndexPath = collectionView.indexPath(for: cell)
            currentYearIndexPath = currentIndexPath
            
            checkIfDoneButtonShouldBePresented()
        }
    }
    
    fileprivate func checkIfDoneButtonShouldBePresented() {
        if currentGender != nil && currentInterest != nil && currentYear != nil {
            doneButton.alpha = 1.0
        }
    }
    
}

//MARK: Birth Year Collection View DataSource

extension UserInfoViewController: UICollectionViewDataSource {
    
    fileprivate func setupBirthYears() {
        var startYear = 2000
        for _ in 0...50 {
            let year: Year = Year("\(startYear)")
            years.append(year)
            startYear -= 1
        }
    }
    
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
        return DeviceSize.viewWidth * (10/375)
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
    
    fileprivate func setupDoneButton() {
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
    
    fileprivate func setupLineDividerViewThree() {
        birthYearLineDividerView = UIView()
        birthYearLineDividerView.backgroundColor = Palette.lightGrey.color
        birthYearLineDividerView.layer.cornerRadius = 2.0
        birthYearLineDividerView.layer.masksToBounds = true
        
        view.addSubview(birthYearLineDividerView)
        birthYearLineDividerView.translatesAutoresizingMaskIntoConstraints = false
        birthYearLineDividerView.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (3/667)).isActive = true
        birthYearLineDividerView.widthAnchor.constraint(equalToConstant: DeviceSize.viewWidth * (270/375)).isActive = true
        birthYearLineDividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DeviceSize.viewWidth * (53/375)).isActive = true
        birthYearLineDividerView.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -DeviceSize.viewHeight * (28/667)).isActive = true
    }
    
    fileprivate func setupCollectionViewLayout() {
        let leftInset: CGFloat = DeviceSize.viewWidth * (53/375)
        let itemWidth = DeviceSize.viewWidth * (83/375)
        let itemHeight = DeviceSize.viewHeight * (45/667)
        birthYearCollViewLayout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: leftInset)
        birthYearCollViewLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        birthYearCollViewLayout.scrollDirection = .horizontal
    }
    
    fileprivate func setupCollectionView() {
        birthYearCollView.backgroundColor = UIColor.white
        birthYearCollView.allowsMultipleSelection = false
        birthYearCollView.showsHorizontalScrollIndicator = false
        birthYearCollView.delegate = self
        birthYearCollView.dataSource = self
        birthYearCollView.register(BirthYearCell.self, forCellWithReuseIdentifier: cellID)
        
        view.addSubview(birthYearCollView)
        birthYearCollView.translatesAutoresizingMaskIntoConstraints = false
        birthYearCollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        birthYearCollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        birthYearCollView.bottomAnchor.constraint(equalTo: birthYearLineDividerView.topAnchor, constant: -DeviceSize.viewHeight * (15/667)).isActive = true
        birthYearCollView.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
    }
    
    fileprivate func setupSelectBirthYearLabel() {
        selectBirthYearLabel = UILabel()
        selectBirthYearLabel.text = "I was born in..."
        selectBirthYearLabel.font = UIFont(name: "Avenir-Black", size: 14)
        
        view.addSubview(selectBirthYearLabel)
        selectBirthYearLabel.translatesAutoresizingMaskIntoConstraints = false
        selectBirthYearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: DeviceSize.viewWidth * (53/375)).isActive = true
        selectBirthYearLabel.bottomAnchor.constraint(equalTo: birthYearCollView.topAnchor, constant: -DeviceSize.viewHeight * (15/667)).isActive = true
    }
    
}

//MARK: Select Interest View Setup

extension UserInfoViewController {
    
    fileprivate func setupLineDividerViewTwo() {
        interestLineDivider = UIView()
        interestLineDivider.backgroundColor = Palette.lightGrey.color
        interestLineDivider.layer.cornerRadius = 2.0
        interestLineDivider.layer.masksToBounds = true
        
        interestLineDivider.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (3/667)).isActive = true
        interestLineDivider.widthAnchor.constraint(equalToConstant: DeviceSize.viewWidth * (270/375)).isActive = true
    }
    
    fileprivate func setupSelectInterestButtons() {
        interestedInOptionsStackView = HorizontalButtonStackView(backgroundColor: Palette.interestPurpleLight.color, textColor: UIColor.white, textLabels: ["men", "women", "both"], numberOfViews: 3)
        
        interestedInOptionsStackView.translatesAutoresizingMaskIntoConstraints = false
        interestedInOptionsStackView.widthAnchor.constraint(equalToConstant: DeviceSize.viewWidth * (270/375)).isActive = true
        interestedInOptionsStackView.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (45/667)).isActive = true
    }

    func setupSelectInterestLabel() {
        selectInterestLabel = UILabel()
        selectInterestLabel.text = "I'm interested in..."
        selectInterestLabel.font = UIFont(name: "Avenir-Black", size: 14)
    }
    
    func setupStackViewForInterestElements() {
        let views = [selectInterestLabel, interestedInOptionsStackView, interestLineDivider]
        interestedInElementsStackView = UIStackView(arrangedSubviews: views as! [UIView])
        interestedInElementsStackView.axis = .vertical
        interestedInElementsStackView.distribution = .equalSpacing
        interestedInElementsStackView.alignment = .leading
        interestedInElementsStackView.spacing = 15
        
        view.addSubview(interestedInElementsStackView)
        interestedInElementsStackView.translatesAutoresizingMaskIntoConstraints = false
        interestedInElementsStackView.bottomAnchor.constraint(equalTo: selectBirthYearLabel.topAnchor, constant: -DeviceSize.viewHeight * (30/667)).isActive = true
        interestedInElementsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
        genderOptionsStackView = HorizontalButtonStackView(backgroundColor: Palette.genderBlue.color, textColor: UIColor.white, textLabels: ["man", "woman", "neither"], numberOfViews: 3)
        
        genderOptionsStackView.translatesAutoresizingMaskIntoConstraints = false
        genderOptionsStackView.widthAnchor.constraint(equalToConstant: DeviceSize.viewWidth * (270/375)).isActive = true
        genderOptionsStackView.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (45/667)).isActive = true
    }
    
    func setupLineDividerView() {
        genderLineDivider = UIView()
        genderLineDivider.backgroundColor = Palette.lightGrey.color
        genderLineDivider.layer.cornerRadius = 2.0
        genderLineDivider.layer.masksToBounds = true
        
        genderLineDivider.translatesAutoresizingMaskIntoConstraints = false
        genderLineDivider.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (3/667)).isActive = true
        genderLineDivider.widthAnchor.constraint(equalToConstant: DeviceSize.viewWidth * (270/375)).isActive = true
    }
    
    func setupStackViewForGenderElements() {
        let views = [selectGenderLabel, genderOptionsStackView, genderLineDivider]
        genderElementsStackView = UIStackView(arrangedSubviews: views as! [UIView])
        genderElementsStackView.axis = .vertical
        genderElementsStackView.distribution = .equalSpacing
        genderElementsStackView.alignment = .leading
        genderElementsStackView.spacing = 15
        
        view.addSubview(genderElementsStackView)
        genderElementsStackView.translatesAutoresizingMaskIntoConstraints = false
        genderElementsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        genderElementsStackView.bottomAnchor.constraint(equalTo: interestedInElementsStackView.topAnchor, constant: -DeviceSize.viewHeight * (30/667)).isActive = true
    }
    
    func setupUserInfoImageView() {
        userInfoImageView = UIImageView()
        userInfoImageView.contentMode = .scaleAspectFit
        userInfoImageView.image = UIImage(named: "UserInfoImage")
        
        view.addSubview(userInfoImageView)
        userInfoImageView.translatesAutoresizingMaskIntoConstraints = false
        userInfoImageView.heightAnchor.constraint(equalToConstant: DeviceSize.viewHeight * (162/667)).isActive = true
        userInfoImageView.widthAnchor.constraint(equalToConstant: DeviceSize.viewWidth * (260/375)).isActive = true
        userInfoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userInfoImageView.bottomAnchor.constraint(equalTo: genderElementsStackView.topAnchor, constant: -DeviceSize.viewHeight * (32/667)).isActive = true
    }

}
