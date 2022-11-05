//
//  CarouselTableViewCell.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

protocol MovieCellProtocol: AnyObject {
    func didSelectMovie(movieID: Int)
    func didSelectTag(idxTag: Int)
}

class CarouselTableViewCell: UITableViewCell {

// MARK: @IBOUTLETS -
    @IBOutlet weak var carouselCollection: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
// MARK: STATIC LET -
    static let identifier = "CarouselTableViewCell"
    
// MARK: PROPERTIES-
    var cellType: TypeCell?
    var movies = [Results]()
    var tags = ["En español", "Lanzadas en 2022"]
    var delegate: MovieCellProtocol?
    var idxSelected = 0
    
// MARK: LIFE CYCLE CELL FUNC -
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionHeight.constant = carouselCollection.contentSize.height
    }
    
// MARK: SETUP FUNC -
    func setupCellWithCarouselCollection(data: [Results],type: TypeCell) {
        cellType = type
        movies = data
        confingCarouselCollection()
    }
    
    func setupCellWithOtherCollection(data: [Results], type: TypeCell, tagIdx: Int) {
        cellType = type
        movies = data
        idxSelected = tagIdx
        if type == .tagCollection {
            configTagsCollection()
        }else{
            configVerticalCollection()
        }
        
    }
    
// MARK: FUNC -
    func confingCarouselCollection() {
        collectionHeight.constant = 200
        carouselCollection.register(UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        carouselCollection.delegate = self
        carouselCollection.dataSource = self
    }
    
    func configTagsCollection() {
        collectionHeight.constant = 40
        let layout = TagsLayout()
        carouselCollection.collectionViewLayout = layout
        carouselCollection.register(UINib(nibName: TagCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        carouselCollection.delegate = self
        carouselCollection.dataSource = self
        
    }
    
    func configVerticalCollection() {
        collectionHeight.constant = 200
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        carouselCollection.collectionViewLayout = layout
        carouselCollection.register(UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        carouselCollection.delegate = self
        carouselCollection.dataSource = self
    }
    
}

// MARK: EXTENSIONS -
extension CarouselTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = cellType == .tagCollection ? 2 : movies.count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch cellType {
        case .carouselMovie:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
            cell.setupCell(data: movies[indexPath.item])
            
            return cell
        case .tagCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as! TagCollectionViewCell
            cell.setupCell(lblText: tags[indexPath.item])
            if indexPath.item != idxSelected {
                cell.lblTagTitle.textColor = .white
                cell.tagView.backgroundColor = .clear
            }else{
                cell.lblTagTitle.textColor = .black
                cell.tagView.backgroundColor = .white
            }
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
            cell.setupCell(data: movies[indexPath.item])
            self.layoutSubviews()
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch cellType {
        case .carouselMovie, .verticalMovieCollection:
            delegate?.didSelectMovie(movieID: movies[indexPath.item].id ?? 0)
        case .tagCollection:
            delegate?.didSelectTag(idxTag: indexPath.item)
            
        case .none:
            break
        }
    }
}

extension CarouselTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize()
        switch cellType {
        case .tagCollection:
            size = CGSize(width: 40, height: 10)
            
        case .carouselMovie:
            size = CGSize(width: 138, height: 180)
            
        case .verticalMovieCollection:
            let widthCell = carouselCollection.bounds.width / 2
            size = CGSize(width: widthCell - 10 , height: widthCell + 49)
            
        case .none:
            break
        }
        
        return size
    }
}
