//
//  ViewController.swift
//  youtube
//
//  Created by N-X on 2017/3/17.
//  Copyright © 2017年 Marauder. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(YouTuBeCell.self, forCellWithReuseIdentifier: "cellID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


//UICollectionView delegate
extension ViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        return cell
    }
}

//UICollectionViewDelegateFlowLayout
extension ViewController{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


// MARK:- 自定义cell


//自定义cell
class YouTuBeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    let thumbnailImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return imageView
    }()
    
    
    func setUpView(){
        addSubview(thumbnailImageView)
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":thumbnailImageView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":thumbnailImageView]))
        addConstraintsWithFromart(format: "H:|-10-[v0]-10-|", views: thumbnailImageView)
        addConstraintsWithFromart(format: "V:|-10-[v0]-10-|", views: thumbnailImageView)
        thumbnailImageView.backgroundColor = .orange
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK:- view 扩展方法
// 添加约束VFL
extension UIView {
    
    func addConstraintsWithFromart(format:String, views: UIView ...){
        var viewDictionary = [String:UIView]()
        
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}
