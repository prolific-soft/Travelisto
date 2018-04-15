//
//  DealsTVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/10/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class DealsTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var dealsCollectionView: UICollectionView!
    
    
    var dummyDataCount : Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dealsCollectionView.delegate = self
        dealsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}






//MARK: - Layouts
extension DealsTVCell {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDefaultHeight = CGFloat(119)
        let cellDefaultWidth = CGFloat(323)
        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(10, 16, 0, 0)
        return inset
    }
    
}



//MARK: - Datasource
extension DealsTVCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyDataCount!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCells.dealsCVCell.rawValue, for: indexPath) as! DealsCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
    
}
