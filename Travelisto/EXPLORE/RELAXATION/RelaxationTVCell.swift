//
//  RelaxationTVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RelaxationTVCell: UITableViewCell {

    @IBOutlet weak var relaxationCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        relaxationCollectionView.delegate = self
//        relaxationCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

//
//
////MARK: - Layouts
//, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//extension RelaxationTVCell {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellDefaultHeight = CGFloat(168)
//        let cellDefaultWidth = CGFloat(135)
//        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
//        return size
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset = UIEdgeInsetsMake(2, 20, 2, 0)
//        return inset
//    }
//
//}
//
//
//
////MARK: - Datasource
//extension RelaxationTVCell {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCells.relaxationCVCell.rawValue, for: indexPath) as! RelaxationCVCell
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //Perform Segue
//    }
//
//
//}
