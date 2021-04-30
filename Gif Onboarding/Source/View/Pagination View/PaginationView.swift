
//  Created by AJM Softwares on 19/03/21.
//

import UIKit

class PaginationView: UIView {
    //MARK:- Outlets
    var contentView:UIView?
    @IBOutlet weak var paginationCollectionview: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnContinue: UIButton!
    
    //MARK:- Variables
    var paginationDataSource : [PaginationPage] = []
    let cellIdentifier = "PaginationCellIdentifier"
    var actionBlock : (() -> Void)?
    
    //MARK:- Initilisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    init(topView:UIView) {
        super.init(frame: topView.frame)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        topView.addSubview(self)
        addConstraint(attribute: .top, topView: topView)
        addConstraint(attribute: .bottom, topView: topView)
        addConstraint(attribute: .leading, topView: topView)
        addConstraint(attribute: .trailing, topView: topView)
        self.defaultSettings()
        self.backgroundColor = UIColor.white
        self.alpha = 0.0
        UIView.animate(withDuration: 1.0) {
            self.alpha = 1.0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    //MARK:- Custom Methods
    func addConstraint(attribute: NSLayoutConstraint.Attribute, topView: UIView) {
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: topView,
                                                  attribute: attribute, multiplier: 1.0, constant: 0.0)
        topView.addConstraint(constraint)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PaginationView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func defaultSettings() {
        paginationCollectionview.delegate = self
        paginationCollectionview.dataSource = self
        paginationCollectionview.register(UINib(nibName: "PaginationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    func reloadAllComponent() {
        if paginationDataSource.isEmpty {
            activityIndicator.startAnimating()
            DispatchQueue.main.async {
                self.contentView?.alpha = 0.0
                self.paginationCollectionview.reloadData()
                UIView.animate(withDuration: 0.7) {
                    self.contentView?.alpha = 1.0
                }
                self.activityIndicator.stopAnimating()
            }
        } else {
            paginationCollectionview.reloadData()
        }
    }

    @IBAction func skipButtonPressed(_ sender: Any) {
        self.alpha = 1.0
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0.0
        }, completion: { _ in
            if let handler = self.actionBlock {
                handler()
            }
            self.removeFromSuperview()
        })
        
    }
}





