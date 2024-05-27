//
//  ViewController.swift
//  ScrollView
//
//  Created by Bruno Silva on 26/05/24.
//

import UIKit

class ViewController: UIViewController {

    let contentView = ContentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.adjustContentSizeForDevice(viewHeight: view.frame.height)
    }

    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
