//
//  PaginationView+CollectionView.swift
//  Gif Onboarding
//
//  Created by AJM Softwares on 19/03/21.
//

import UIKit
extension PaginationView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages  = paginationDataSource.count
        return paginationDataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = paginationCollectionview.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                                   for: IndexPath(item: 0, section: 0)) as? PaginationCollectionViewCell {
            let images = paginationDataSource[indexPath.item].animationImages
            let duration = (Float(images.count)/20.0)
            cell.pageImageview.animationImages = images
            cell.pageImageview.animationDuration = TimeInterval(duration < 1.0 ? 1.0 : duration)
            cell.pageImageview.startAnimating()
            cell.pageTitle.text = paginationDataSource[indexPath.item].title
            cell.isUserInteractionEnabled = false
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //ScrollView delegate method
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var currentPage = 0
        let pageWidth = scrollView.frame.width
        currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
        if currentPage == (pageControl.numberOfPages - 1), btnContinue.isHidden {
            btnContinue.alpha = 0.0
            btnContinue.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.btnContinue.alpha = 1.0
            }
        }
    }
}
