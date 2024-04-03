//
//  CustomTableViewCell.swift
//  tableViewComCollectionView
//
//  Created by Jefferson Alves on 18/03/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var carList: [carObject] = [carObject(carImage: UIImage(named: "carBrilho") ?? UIImage()),
                                carObject(carImage: UIImage(named: "carEtiqueta") ?? UIImage()),
                                carObject(carImage: UIImage(named: "racing-car") ?? UIImage()),
                                carObject(carImage: UIImage(named: "taxi") ?? UIImage())]
    
    var carrosList: [String] = ["carBrilho","carEtiqueta","racing-car","taxi"]
    
    
    static let identifier: String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCollectionView()
    }
    
    func configCollectionView (){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    
    func setup(title: String) {
        titleLabel.text = title
    }
    
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carrosList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cells = self.collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        
        cells?.setup(img: carrosList[indexPath.row])
        
        return cells ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 300)
    }
}
