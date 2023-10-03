//
//  OnboardingContainerViewController.swift
//  banK
//
//  Created by João Gabriel Lavareda Ayres Barreto on 11/01/23.
//

import Foundation

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {
    
    weak var delegate: OnboardingContainerViewControllerDelegate?

    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    
    let closeBtn = UIButton(type: .system)
    let nextBtn = UIButton(type: .system)
    let backBtn = UIButton(type: .system)
    let doneBtn = UIButton(type: .system)
    
    var currentVC: UIViewController {
        didSet {
            guard let index = pages.firstIndex(of: currentVC) else {return}
            nextBtn.isHidden = index == pages.count - 1
            backBtn.isHidden = index == 0
            doneBtn.isHidden = !(index == pages.count - 1)
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is awesome and everyone loves it! Join in now and become part of the future")
        let page2 = OnboardingViewController(heroImageName: "world", titleText: "Bankey is awesome and everyone loves it! Join in now and become part of the future")
        let page3 = OnboardingViewController(heroImageName: "thumbs", titleText: "Bankey is awesome and everyone loves it! Join in now and become part of the future")
 
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        
        
       
    }
    
    private func setup() {
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }
    
    private func style() {
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.setTitle("next", for: [])
        nextBtn.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setTitle("back", for: [])
        backBtn.addTarget(self, action: #selector(backTapped), for: .primaryActionTriggered)
        
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("done", for: [])
        doneBtn.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)
        
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.setTitle("close", for: [])
        closeBtn.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        
        
    }
    
    private func layout(){
        view.addSubview(closeBtn)
        view.addSubview(nextBtn)
        view.addSubview(backBtn)
        view.addSubview(doneBtn)
        
        NSLayoutConstraint.activate([
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextBtn.bottomAnchor, multiplier: 4)
        ])

        NSLayoutConstraint.activate([
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: backBtn.bottomAnchor, multiplier: 4)
        ])
        
        NSLayoutConstraint.activate([
            doneBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: doneBtn.bottomAnchor, multiplier: 4)
        ])
        
        
        NSLayoutConstraint.activate([
            closeBtn.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeBtn.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
            
        ])
    }
}



// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}

// Mark: Action

extension OnboardingContainerViewController {
    @objc func nextTapped(_ sender: UIButton){
        guard let nextVC = getNextViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([nextVC], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func backTapped(_ sender: UIButton){
        guard let previousVC = getPreviousViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([previousVC], direction: .reverse, animated: true, completion: nil)
    }
    
    
    @objc func closeTapped(_ sender: UIButton) {
        delegate?.didFinishOnboarding()
    }
    
    @objc func doneTapped(_ sender: UIButton) {
        delegate?.didFinishOnboarding()
    }

}
