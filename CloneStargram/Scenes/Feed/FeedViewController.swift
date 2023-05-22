//
//  FeedViewController.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import SnapKit
import UIKit

/**
 메인 피드에 대한 정보를 설정하는 view컨트롤러
 */
class FeedViewController: UIViewController {
    
    // 테이블뷰 선언
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none // 컬렉션뷰처럼 활용하기 위해 none으로 설정
        tableView.dataSource = self // 셀 데이터 설정 추가
        
        // identifier 등록
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        
        return tableView
    }()

    // 이미지를(사진을) 선택할 수 있는 controller 생성
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary // 아이폰의 이미지를 가져올 수 있도록 해준다.
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        return imagePickerController
    }()
    
    // MARK: - 가장 먼저 실행되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }
    


}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell
        cell?.selectionStyle = .none
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
}

// UIImagePickerControllerDelegate는 UINavigationControllerDelegate랑 같이 채택해줘야 한다.
extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectImage: UIImage?
        
        // 키값이 editedImage이면 selectImage = editedImage고 originImage면 selectImage = originImage이다.
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImage = editedImage
        } else if let originImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImage = originImage
        }
        
        // 이미지를 선택하면 창이 꺼지고 업로드를 위한 뷰 컨트롤러로 연결시켜준다.
        picker.dismiss(animated: true) { [weak self] in // 클로저 형태에서 꼭 weak self로 매모리 순환참조를 방지하자
            let uploadViewController = UploadViewController()
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
        }
    }
}

// MARK: - 메소드만 모을 확장 선언
private extension FeedViewController {
    
    // 네비게이션 바 설정 메소드
    func setupNavigationBar() {
        navigationItem.title = "CloneStargram"
        
        // 업로드 버튼 설정
        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: #selector(didTapUploadButton)
        )
        
        navigationItem.rightBarButtonItem = uploadButton
    }
    
    @objc func didTapUploadButton() {
        //imagePicker를 present 해줘야함
        present(imagePickerController, animated: true)
    }
    
    // 테이블 뷰 세팅 메서드
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
