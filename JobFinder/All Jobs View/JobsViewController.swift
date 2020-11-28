//
//  JobsViewController.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa


class JobsViewController : UIViewController {
 
    private var tableView:JobTableView!
    private var data: BehaviorRelay<[Job]> = BehaviorRelay(value: [])
    private var disposeBag:DisposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        title = "Latest Jobs"
        view.backgroundColor = .systemBackground
        hero.isEnabled = true
        hero.modalAnimationType = .none
        navigationController?.hero.modalAnimationType = .none
        navigationController?.hero.isEnabled = true        
        setupUI()
        becomeReactive()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.refreshData()
                        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}


extension JobsViewController {
    
    func refreshData() {
        self.data.accept([
            
            Job(title: "Software Engineer, University Grad",
                company: "Google",
                imageURL: "https://logo.clearbit.com/google.com",
                location: "Menlo Park",
                date: "5h ago",
                description: "Live life at Google."
            ),
            
            Job(title: "Software Engineer, Internship",
                company: "Apple",
                imageURL: "https://logo.clearbit.com/apple.com",
                location: "Menlo Park",
                date: "1d ago",
                description: "Live life at Apple."
            ),
            
            Job(title: "Software Engineer, Internship",
                company: "Facebook",
                imageURL: "https://logo.clearbit.com/facebook.com",
                location: "Menlo Park",
                date: "2d ago",
                description: "Live life at Facebook."
            ),
            
            Job(title: "iOS Engineer, New Grad",
                company: "Robinhood",
                imageURL: "https://logo.clearbit.com/robinhood.com",
                location: "Menlo Park",
                date: "3d ago",
                description: "Live life at Robinhood."
            ),
            
//            Job(title: "iOS Engineer, New Grad",
//                company: "Snapchat",
//                imageURL: "https://logo.clearbit.com/snap.com",
//                location: "Santa Monica",
//                date: "1w ago",
//                description: "Live life at Snap Inc."
//            ),
//
//            Job(title: "Software Engineer, New Grad",
//                company: "Spotify",
//                imageURL: "https://logo.clearbit.com/spotify.com",
//                location: "San Francisco",
//                date: "1w ago",
//                description: "Live life at Spotify."
//            ),
            
//            Job(title: "Software Engineer, New Grad",
//                company: "Lyft",
//                imageURL: "https://logo.clearbit.com/lyft.com",
//                location: "San Francisco",
//                date: "1w ago",
//                description: "Live life at Lyft."
//            ),
//
//            Job(title: "Software Engineer, New Grad",
//                company: "Uber",
//                imageURL: "https://logo.clearbit.com/uber.com",
//                location: "San Francisco",
//                date: "1w ago",
//                description: "Live life at Uber."
//            ),
        ])
    }
}


extension JobsViewController {
    
    func becomeReactive() {
        data.bind(to: tableView.rx.items(cellIdentifier: tableView.identifier)) { row, model, cell in
            if let cell = cell as? JobCell {
                cell.acceptJob(job: model)
                cell.updateHeroID(index: row)
            }
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { path in
            self.tableView.deselectRow(at: path, animated: true)
            let vc = ViewJobViewController(job: self.data.value[path.row], heroIndex: path.row)
            let nav = PanNavigationController(vc: vc)
            nav.setHeroId(index: path.row)
            self.present(nav, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
}


extension JobsViewController {
    
    func setupUI() {
        self.removeNavBarLine()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        tableView = JobTableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
