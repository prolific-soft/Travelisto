//
//  HotelPopularDestinationTVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HotelPopularDestinationTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

        @IBOutlet weak var hotelPopularDestinationCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hotelPopularDestinationCollectionView.delegate = self
        hotelPopularDestinationCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}





//MARK: - Layouts
extension HotelPopularDestinationTVCell {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDefaultHeight = CGFloat(168)
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
extension HotelPopularDestinationTVCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlightSuggestionCell.hotelPopularDestinationCVCell.rawValue, for: indexPath) as! HotelPopularDestinationCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
    
}
