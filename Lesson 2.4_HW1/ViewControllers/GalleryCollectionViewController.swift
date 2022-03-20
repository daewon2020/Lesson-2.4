//
//  GalleryCollectionViewController.swift
//  Lesson 2.4_HW1
//
//  Created by Kostya on 19.03.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class GalleryCollectionViewController: UICollectionViewController {
    
    var user: User!

    private let imagesInLine: CGFloat = 2
    private let offset: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPaths = collectionView.indexPathsForSelectedItems {
            guard let galleryDetailViewController = segue.destination as? GalleryDetailViewController else { return }
            
            galleryDetailViewController.imageFullSize = String(user.gallery[indexPaths[0].row])
            collectionView.deselectItem(at: indexPaths[0], animated: false)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        user.gallery.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "dataCell",
            for: indexPath
        ) as! GalleryCollectionViewCell
        
        if let image = UIImage(named: String(user.gallery[indexPath.item])) {
            cell.galleryImageView.image = image
        } else {
            cell.galleryImageView.image = UIImage(systemName: "photo")
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
}

extension GalleryCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let imageWidth = collectionView.frame.width / imagesInLine
        let imageHeight = imageWidth
        let spacing = offset * (imagesInLine + 1) / imagesInLine
        return CGSize(width: imageWidth - spacing, height: imageHeight - spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset)
    }
}
