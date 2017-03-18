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
        self.title = "视频首页"
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
        return imageView
    }()
    
    //添加cell分割线
    let separateLine : UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .black
        return lineView
    }()
    
    let userProfilerImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        return imageView
    }()
    
    let titleLabel :UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.purple
        return label
    }()
    
    let subTitle : UITextView = {
        let subTitle = UITextView()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.backgroundColor = .red
        return subTitle
    }()
    func setUpView(){
        addSubview(thumbnailImageView)
        addSubview(separateLine)
        addSubview(userProfilerImage)
        addSubview(titleLabel)
        addSubview(subTitle)
        
        
        addConstraintsWithFromart(format: "H:|-10-[v0]-10-|", views: thumbnailImageView)
        addConstraintsWithFromart(format: "V:|-10-[v0]-10-[v1(44)]-10-[v2(1)]|", views: thumbnailImageView,userProfilerImage,separateLine)
        addConstraintsWithFromart(format: "H:|[v0]|", views: separateLine)
        addConstraintsWithFromart(format: "H:|-10-[v0(44)]|", views: userProfilerImage)
        
        
        //MARK:-  A 视图    =      B视图  *  multiplier   +   constant；

        //top
        addConstraints([NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: NSLayoutRelation.equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 10)])
        
        //left
        addConstraints([NSLayoutConstraint.init(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfilerImage, attribute: .right, multiplier: 1, constant: 8)])
        //height
        addConstraints([NSLayoutConstraint.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])
        //right
        addConstraints([NSLayoutConstraint.init(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0)])
        
        
        //MARK:- subTitle
        //top
        addConstraints([NSLayoutConstraint.init(item: subTitle, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8)])
        //left
        addConstraints([NSLayoutConstraint.init(item: subTitle, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .left, multiplier: 1, constant: 0)])
        //right
        addConstraints([NSLayoutConstraint.init(item: subTitle, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0)])
        //height
        addConstraints([NSLayoutConstraint.init(item: subTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])

        
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
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}
