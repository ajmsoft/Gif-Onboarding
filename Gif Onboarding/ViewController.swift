//
//  ViewController.swift
//  Gif Onboarding
//
//  Created by AJM Softwares on 19/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var onboardingView: PaginationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initializeOnboardning()
    }
    
    func initializeOnboardning() {
        onboardingView = PaginationView(topView: self.view)
        loadImagesInBackground()
    }

    func loadImagesInBackground() {
        DispatchQueue.global(qos: .userInitiated).async {
            var view1 = PaginationPage()
            view1.title = "Welcome!"
            view1.animationImages =  view1.getAnimation1Image()
            
            var view2 = PaginationPage()
            view2.title = "Show your app features here"
            view2.animationImages = view1.getAnimation1Image()
            
            var view3 = PaginationPage()
            view3.title = "Describe amazing things about your app"
            view3.animationImages = view1.getAnimation1Image()
            
            DispatchQueue.main.async {
                self.showOnboarding(dataSource: [view1,view2,view3])
            }
        }
    }
    
    func showOnboarding(dataSource:[PaginationPage]) {
        self.onboardingView?.paginationDataSource = dataSource
        self.onboardingView?.reloadAllComponent()
        self.onboardingView?.actionBlock = {
            // Do something on completion
        }
    }
}

