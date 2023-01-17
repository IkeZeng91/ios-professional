//
//  AppDelegate.swift
//  Bankey
//
//  Created by Xuankai Zeng on 9/1/2023.
//

import UIKit

let appColor: UIColor = .systemTeal

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingContainerController.delegate = self
        dummyViewController.logoutDelegate = self
        
        window?.rootViewController = mainViewController
        
        mainViewController.selectedIndex = 1
        return true
    }
    
}

extension AppDelegate: LoginViewControllerDelegate, OnboardingContainerViewControllerDelegate,LogoutDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
    }
    
    func didLogin() {
        if LocalState.hasOnboarded{setRootViewController(dummyViewController)}
        else{
            setRootViewController(onboardingContainerController)
        }
    }
    
    func didLogout() {
        setRootViewController(loginViewController)
    }
    
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.9, options: .transitionCrossDissolve,animations: nil,completion: nil)
    }
}

