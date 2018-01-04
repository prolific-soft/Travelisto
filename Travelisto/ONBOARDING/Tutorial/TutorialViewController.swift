//
//  TutorialViewController.swift
//  Travelisto
//
//  Created by Chidi Emeh on 1/3/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    var slides : [TutorialSlideView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = createSlides()
        setUpSlideScrollView(slides: slides!)
        tutorialPageControl.numberOfPages = (slides?.count)!
        tutorialPageControl.currentPage = 0
    }



    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func alreadyHaveAccountTapped(_ sender: UIButton) {
    }
    

}

//MARK: Create Xib Slides
extension TutorialViewController {
    
    func createSlides() -> [TutorialSlideView] {
        
        var tempSlideViews = [TutorialSlideView]()
        var count = 0
        let images = ["travel-1", "travel-2", "travel-3", "travel-4"]
        let descriptions = ["Plan your travel anywhere, anytime",
                            "Find cheap hotel",
                            "Best flight deals are easy to find",
                            "Take a trip and save memories"]
        
        for imageName in images {
            
            var image = UIImage()
            let slide = Bundle.main.loadNibNamed("TutorialSlideView", owner: self, options: nil)?.first as! TutorialSlideView
            image = UIImage(named: imageName)!
            slide.tutorialImageView.image = image
            slide.tutorialImageView.layer.cornerRadius = slide.tutorialImageView.layer.frame.width/2
            slide.tutorialDescriptionLabel.text = descriptions[count]
            tempSlideViews.append(slide)
            count = count + 1
        }
  
        return tempSlideViews
    }
    
    func setUpSlideScrollView(slides: [TutorialSlideView]){
        let widthOfSlide = 301
        let heightOfSlide = 490 //353
        tutorialScrollView.frame = CGRect(x: 37, y: 0, width: widthOfSlide, height: heightOfSlide)
        tutorialScrollView.contentSize = CGSize(width: CGFloat(widthOfSlide * 4), height: CGFloat(heightOfSlide))
        
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: Int(CGFloat(widthOfSlide) * CGFloat(i)), y: 139, width: widthOfSlide, height: heightOfSlide)
            slides[i].tutorialImageView.layer.cornerRadius =  20
            tutorialScrollView.addSubview(slides[i])

        }
        
    }
}


//MARK: UIScrollViewDelegate
extension TutorialViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Did Scroll")
        let pageIndex = round(scrollView.contentOffset.x/304)
        tutorialPageControl.currentPage = Int(pageIndex)
    }
    
}
