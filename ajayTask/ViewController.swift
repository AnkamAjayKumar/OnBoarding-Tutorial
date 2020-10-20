//
//  ViewController.swift
//  ajayTask
//
//  Created by Himansu Sekhar Panigrahi on 27/07/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let buttonText = ["Next","Next","Lets Go!"]
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl:UIPageControl!
    let headerLabelText = ["Headre Text 1", "Headre Text 2","Headre Text 3"]
    let descriptionLabelText = ["This is a sample description text for image no 1", "This is a sample description text for image no 2","This is a sample description text for image no 3"]
    let imagesName = ["image1", "image2", "image3"]
    let extraText = "\nasdasjkdfhaksjf\nsdfhskhf"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        pageControl.tintColor = .orange
        pageControl.isEnabled = false
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(buttonEH), for: UIControl.Event.touchUpInside)
    }
    
    private func getImage(_ name:String) -> UIImage {
        return UIImage(named:name)!
    }
    
    @objc func buttonEH() {
        let currentPos = collectionView.contentOffset
        let max = self.view.frame.width * 2
        if currentPos.x != max {
            collectionView.contentOffset = CGPoint(x: currentPos.x + self.view.frame.width, y: 0)
        }
        let pageNo = getPageNo()
        self.button.setTitle(buttonText[pageNo], for: UIControl.State.normal)
        print(getPageNo())
        self.pageControl.currentPage = pageNo
    }
}

//MARK:- Collection View Datasource & Delegates
extension ViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func configureCollectionView() {
                self.collectionView.dataSource = self
                self.collectionView.delegate = self
                self.collectionView.isPagingEnabled = true
                self.collectionView.showsHorizontalScrollIndicator = false
            }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: WalkthroughCVCell.self), for: indexPath) as? WalkthroughCVCell
    
        let configureCell:(UIImage?, WalkthroughCVCell?, String) -> Void = { (image, cell, headerText)
            in
            cell?.imageView.image = image
            
            cell?.headerLabel.text = headerText
            cell?.descriptionLabel.text = self.descriptionLabelText[indexPath.row] + self.extraText
        }
        let image = self.getImage(imagesName[indexPath.row])
        configureCell(image, cell, headerLabelText[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let viewDimn = self.collectionView.frame
        
       return CGSize(width: viewDimn.width, height: viewDimn.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.x
        let screenWidth = self.view.frame.width
        let pageNo = Int(pos/screenWidth)
        self.pageControl.currentPage = pageNo
        
       
        self.button.setTitle(buttonText[pageNo], for: UIControl.State.normal)
       
        print("JJJ")
    }
    
    private func getPageNo() -> Int {
        let pos = collectionView.contentOffset.x
        let screenWidth = self.view.frame.width
        let pageNo = Int(pos/screenWidth)
        
        return pageNo
    }
    
}
