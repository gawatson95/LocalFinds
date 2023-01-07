//
//  DetailViewController.swift
//  LocalFinds
//
//  Created by Grant Watson on 12/31/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var poi: String?
    var placeDetails: PlaceDetail!
    let padding: CGFloat = 20
    let sectionSpacing: CGFloat = 40
    let summaryView = InfoView()
    let hoursView = InfoView()
    let contactView = InfoView()
    let popularityView = InfoView()
    let photosView = InfoView()
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = placeDetails.name
        //title = "BOK Center"
        
        view.backgroundColor = .white
        
        configureSummaryView()
        configureHoursView()
        configureContactView()
        configurePopularityView()
        configurePhotosView()
    
        print(placeDetails.photos)
    }
    
    private func configureSummaryView() {
        view.addSubview(summaryView)
        
        summaryView.infoTitle.text = "Description:"
        summaryView.infoBody.text = placeDetails.description
        summaryView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            summaryView.topAnchor.constraint(equalTo: view.topAnchor),
            summaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            summaryView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureHoursView() {
        view.addSubview(hoursView)
        
        hoursView.infoTitle.text = "Hours:"
        hoursView.infoBody.text = placeDetails.hours.display
        hoursView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hoursView.topAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: sectionSpacing),
            hoursView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hoursView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hoursView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureContactView() {
        view.addSubview(contactView)
        
        contactView.infoTitle.text = "Contact:"
        contactView.infoBody.text = """
                                    \(placeDetails.location.address), \(placeDetails.location.dma), \(placeDetails.location.region), \(placeDetails.location.postcode)
                                    \(placeDetails.website)
                                    \(placeDetails.tel)
                                    """
        contactView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contactView.topAnchor.constraint(equalTo: hoursView.bottomAnchor, constant: sectionSpacing),
            contactView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configurePopularityView() {
        view.addSubview(popularityView)
        
        popularityView.infoTitle.text = "Popularity:"
        popularityView.infoBody.text = "\(placeDetails.rating) / 10"
        popularityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popularityView.topAnchor.constraint(equalTo: contactView.bottomAnchor, constant: sectionSpacing),
            popularityView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popularityView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popularityView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configurePhotosView() {
        view.addSubview(photosView)
        
        photosView.infoTitle.text = "Photos:"
        photosView.infoBody.text = placeDetails.photos.first?.photoPrefix
        photosView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photosView.topAnchor.constraint(equalTo: popularityView.bottomAnchor, constant: sectionSpacing),
            photosView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosView.heightAnchor.constraint(equalToConstant: 175)
        ])
    }
}
