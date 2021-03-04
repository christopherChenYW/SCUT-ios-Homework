//
//  PageVC.swift
//  China-LanMark
//
//  Created by 月文 陈  on 2020/11/10.
//

import SwiftUI

struct PageVC: UIViewControllerRepresentable {
    
    let pages=featurelandmarks.map{UIHostingController(rootView: Image($0.imageName).resizable())}
    
    func makeCoordinator() -> Cordinator {
        return Cordinator(pages: pages)
    }
    
    func makeUIViewController(context: Context) -> some UIPageViewController {
        let pageVC=UIPageViewController(
            transitionStyle:.scroll,
            navigationOrientation: .horizontal)
        pageVC.dataSource=context.coordinator
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.setViewControllers([pages[1]], direction: .forward, animated: true)
    }
}

class Cordinator:NSObject, UIPageViewControllerDataSource{
    let pages:[UIViewController]
    init(pages:[UIViewController]) {
        self.pages=pages
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex=pages.firstIndex(of: viewController)
        return currentIndex==0 ? self.pages.last : self.pages[currentIndex!-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex=pages.firstIndex(of: viewController)
        return currentIndex==pages.count-1 ? self.pages.first : self.pages[currentIndex!+1]
    }
    
    
}
struct PageVC_Previews: PreviewProvider {
    static var previews: some View {
        PageVC()
    }
}
