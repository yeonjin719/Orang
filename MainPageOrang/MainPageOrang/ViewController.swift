//
//  ViewController.swift
//  Orang_mainpage
//
//  Created by 김연진 on 2023/01/18.
//

import UIKit
import SideMenu
import Then

// var images 이거 수정해야함
var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
class ViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        imgView.image = UIImage(named: images[0])

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if (pageControl.currentPage<pageControl.numberOfPages-1) {
                    pageControl.currentPage = pageControl.currentPage + 1
                }
                print("Swiped Left")
            case UISwipeGestureRecognizer.Direction.right:
                if (pageControl.currentPage>0) {
                    pageControl.currentPage = pageControl.currentPage - 1
                }
                print("Swiped Right")
            default:
                break
            }
            
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
}
