//
//  ViewJobViewController.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit
import SnapKit
import Hero
import Closures


class ViewJobViewController : UIViewController {
    
    var job:Job!
    var back:BackButton = BackButton(imageName: "Back")
    var scrollView:JobView!
    var heroIndex:Int = 0
    
    init(job:Job, heroIndex:Int) {
        super.init(nibName: nil, bundle: nil)
        self.job = job
        self.heroIndex = heroIndex
        self.modalPresentationStyle = .fullScreen
        self.hero.isEnabled = true        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        becomeReactive()
        handlePan()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}


extension ViewJobViewController {
    
    
    func handlePan() {
//        self.scrollView.addPanGesture { (sender) in
//            self.view.frame.origin.x = sender.translation(in: self.view).x
//            sender.setTranslation(.zero, in: self.view)
//        }
    }
}


extension ViewJobViewController {
    
    func becomeReactive() {
        back.button.onTap {
            self.hero.dismissViewController()
            print("test!")
        }
    }
}

extension ViewJobViewController {
    
    func setHeroID(index:Int) {
                                      
//        scrollView.imageView.hero.modifiers = [.source(heroID: "imageView" + String(index)), .durationMatchLongest]
        
//        scrollView.jobTitle.hero.id = "title" + String(index)
//        scrollView.company.hero.id = "company" + String(index)
//        scrollView.location.hero.id = "location" + String(index)
//        scrollView.imageView?.hero.id = "imageView" + String(index)
//        
//        scrollView.desc.hero.modifiers = [.scale(0.0), .translate(
//                                            CGPoint(
//                                                x: UIScreen.main.bounds.midX,
//                                                y: UIScreen.main.bounds.midY
//                                            ))]
    }
}


extension ViewJobViewController {
    
    func setupUI() {
        
        self.removeNavBarLine()
        
        // Back button
        self.navigationItem.leftBarButtonItem = back
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        // Navbar
//        title = self.job.company
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.removeNavBarLine()
        navigationController?.navigationBar.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = .systemBackground
        view.backgroundColor = .systemBackground
        
        // Scrollview
        scrollView = JobView(job: self.job, width: self.view.frame.width)
        setHeroID(index: heroIndex)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
