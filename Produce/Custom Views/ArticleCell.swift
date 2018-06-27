//
//  ArticleCell.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation
import UIKit

class ArticleCell: UITableViewCell {
    var mainImage: UIImage?
    
    var article: Article?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.textColor = .white
        label.numberOfLines = 4
        return label
    }()
    
    let sourceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Italic", size: 15)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isOpaque = false
        imageView.alpha = 0.3
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .black
        
        addSubview(mainImageView)
        addSubview(titleLabel)
        addSubview(sourceLabel)
        
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: contentView.layoutMargins.left).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: contentView.layoutMargins.right * -1).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: sourceLabel.topAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.font.pointSize * CGFloat(titleLabel.numberOfLines))

        sourceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.layoutMargins.left).isActive = true
        sourceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: self.layoutMargins.right * -1).isActive = true
        sourceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.layoutMargins.bottom * -1).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let article = article,
            let title = article.title,
            let source = article.source.name else { return }
        titleLabel.text = title
        sourceLabel.text = source
        
        if let image = article.image {
            mainImageView.image = image
        }
    }
    
    func fetchImage(with url: URL, completion: @escaping (UIImage) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.sync {
                    self.cropImage(from: image, with: completion)
                }
            }
        }
        task.resume()
    }
    
    func cropImage(from image: UIImage, with completion: @escaping (UIImage) -> Void) {
        let imageHeight = image.size.width * 150 / contentView.bounds.width
        let cropRect = CGRect(x: 0, y: 0, width: image.size.width, height: imageHeight)
        let cutImageRef: CGImage = (image.cgImage?.cropping(to: cropRect))!
        let croppedImage = UIImage(cgImage: cutImageRef)
        mainImageView.image = croppedImage
        completion(croppedImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
