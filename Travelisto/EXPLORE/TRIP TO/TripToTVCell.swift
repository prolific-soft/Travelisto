//
//  TripToTVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TripToTVCell: UITableViewCell {

    
    @IBOutlet weak var tripToCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        tripToCollectionView.delegate = self
//        tripToCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

//
//
////MARK: - Layouts

//, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//extension TripToTVCell {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 30
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellDefaultHeight = CGFloat(200)
//        let cellDefaultWidth = CGFloat(335)
//        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
//        return size
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset = UIEdgeInsetsMake(20, 20, 20, 0)
//        return inset
//    }
//
//}
//
//
//
////MARK: - Datasource
//extension TripToTVCell {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCells.tripToCVCell.rawValue, for: indexPath) as! TripToCVCell
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //Perform Segue
//    }
//
//
//}
