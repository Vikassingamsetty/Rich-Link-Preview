//
//  ViewController.swift
//  RichLinkPreview
//
//
import LinkPresentation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GetPreview()
    }

    func GetPreview() {
        guard let url = URL(string: "https://www.youtube.com/watch?v=yL2xVs6uI0s") else {
            return
        }
        let preview = LPLinkView()
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: url) { [weak self] metaData, error in
            guard let data = metaData, error == nil else{
                return
            }
            DispatchQueue.main.async {
                preview.metadata = data
                self?.view.addSubview(preview)
                preview.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                preview.center = self?.view.center ?? .zero
            }
        }
    }

}

