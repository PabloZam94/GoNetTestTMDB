//
//  HomeViewController.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
// MARK: PROTOCOL PROPERTIES -
    var presenter: HomePresenterProtocol?
    
// MARK: @IBOUTLETS -
    
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var mainTableView: UITableView!
    
// MARK: PROPERTIES -
    var headerTitles = ["Próximos estrenos", "Tendencia", "Recomendaciones para ti"]
    var allData = [[Results]]()
    var tagSelectedID = 0
    
// MARK: LIFE CYCLE VIEW FUNC -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.requestMovies(url: Endpoints.BaseURL + Endpoints.topRated + Endpoints.apiKey + "&language=en-US&page=1", mediaType: .topRated)
        setTableViewConfig()

    }
    
// MARK: FUNCS -
    private func setTableViewConfig() {
        mainTableView.register(UINib(nibName: CarouselTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CarouselTableViewCell.identifier)
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        if let textlabel = header.textLabel {
            textlabel.textColor = .white
            textlabel.font = UIFont.boldSystemFont(ofSize: 20)//ThemeManager.MediumFont(16)
            textlabel.adjustsFontSizeToFitWidth = true
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
                return headerTitles[section]
            }

            return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = section == 2 ? 2 : 1
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.identifier, for: indexPath) as! CarouselTableViewCell
        
        switch indexPath.section {
        case 2:
            let typeCell = indexPath.row == 0 ? TypeCell.tagCollection : TypeCell.verticalMovieCollection
            if allData.count != 0 {
                cell.setupCellWithOtherCollection(data: allData[indexPath.section], type: typeCell, tagIdx: tagSelectedID)
                cell.delegate = self
            }
            
            break
            
        default:
            if allData.count != 0 {
                cell.setupCellWithCarouselCollection(data: allData[indexPath.section], type: .carouselMovie)
                cell.delegate = self
            }
            
        }
        
        cell.layoutIfNeeded()
        cell.selectionStyle = .none
        return cell
    }
    
}

extension HomeViewController: HomeViewProtocol {
    func successGetMovies(data: MoviesGenericResponse, medidaType: MediaType) {
        guard let resultsArray = data.results else { return }
        switch medidaType {
        case .topRated:
            allData.append(resultsArray)
            presenter?.requestMovies(url: Endpoints.BaseURL + Endpoints.upcoming + Endpoints.apiKey + "&language=en-US&page=1", mediaType: .upComing)
        case .upComing:
            allData.append(resultsArray)
            presenter?.requestMovies(url: Endpoints.BaseURL + Endpoints.trending + Endpoints.apiKey, mediaType: .trending)
            
        case .trending:
            var mutableArray = [Results]()
            for i in 0...5 {
                mutableArray.append(resultsArray[i])
            }
            allData.append(mutableArray)
            mainTableView.reloadData()
            
        }
    }
    
    func failGetMovies(mediaType: MediaType) {
        print("error", mediaType)
    }
    
}

extension HomeViewController: MovieCellProtocol {
    func didSelectTag(idxTag: Int) {
        tagSelectedID = idxTag
        DispatchQueue.main.async {
                
            let idxPath = IndexPath(row: 0, section: 2)
            let selectedCell = self.mainTableView.cellForRow(at: idxPath) as? CarouselTableViewCell
            selectedCell?.idxSelected = idxTag
            selectedCell?.carouselCollection.reloadData()
            
            let idxCell = IndexPath(row: 1, section: 2)
            let verticalCollecitonCell = self.mainTableView.cellForRow(at: idxCell) as? CarouselTableViewCell
            var sendArray = [Results]()
            
            if idxTag == 0 {
                let mutabelArr = self.allData[2]
                let limitArray = mutabelArr[0...5]
                limitArray.forEach { item in
                    sendArray.append(item)
                }
            }else{
                let mutabelArr = self.allData[1]
                let limitArray = mutabelArr[7...11]
                limitArray.forEach { item in
                    sendArray.append(item)
                }
            }
            verticalCollecitonCell?.movies = sendArray
            verticalCollecitonCell?.carouselCollection.reloadData()
        }
    }
    
    func didSelectMovie(movieID: Int) {
        presenter?.instanceHomeView(vc: self, movieID: movieID)
    }
}
