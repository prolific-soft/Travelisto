//
//  DestinationTVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/15/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class DestinationTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {

    //UI properties
    @IBOutlet weak var destinationCollectionView: UICollectionView!
    
    var dummyDataCount : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        destinationCollectionView.delegate = self
        destinationCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



//MARK: - Layouts
extension DestinationTVCell {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDefaultHeight = CGFloat(163)
        let cellDefaultWidth = CGFloat(135)
        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(5, 15, 5, 0)
        return inset
    }
    
}



//MARK: - Datasource
extension DestinationTVCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyDataCount!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCells.destinationCVCell.rawValue, for: indexPath) as! DestinationCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
    
}
