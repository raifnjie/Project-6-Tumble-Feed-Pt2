//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Raif Njie on 7/22/25.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    var post: Post!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView.text = post.caption.trimHTMLTags()
        
        if let photo = post.photos.first {
            let url = photo.originalSize.url
            ImagePipeline.shared.loadImage(with: url) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.imageView.image = response.image
                case .failure(let error):
                    print("Image load failed: \(error)")
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
