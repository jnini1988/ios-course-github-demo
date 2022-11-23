//
//  DetailViewController.swift
//  sc2628_p4
//
//  Created by Jenny Chen on 10/22/22.
//

import UIKit

class DetailViewController: UIViewController {
    let picImageView = UIImageView()
    let nameTextField = UITextField()
    let artistTextField = UITextField()
    let playlistTextField = UITextField()
    let editButton = UIButton()
    let backButton = UIButton()
    
    let song: Song
    weak var delegate: ChangeSongDelegate?
    
    //delegate of DetailViewController is UITableViewCell
    init(song: Song, delegate: ChangeSongDelegate) {
        self.song = song
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        picImageView.image = UIImage(named:song.songPicName)
        picImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picImageView)
        
        nameTextField.text = song.songName
        nameTextField.font = .systemFont(ofSize: 20)
        nameTextField.backgroundColor = .systemGray3
        nameTextField.layer.cornerRadius = 5
        nameTextField.clipsToBounds = true
        nameTextField.textAlignment = .center
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        artistTextField.text = song.artist
        artistTextField.font = .systemFont(ofSize: 20)
        artistTextField.backgroundColor = .systemGray3
        artistTextField.layer.cornerRadius = 5
        artistTextField.clipsToBounds = true
        artistTextField.textAlignment = .center
        artistTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(artistTextField)
        
        playlistTextField.text = song.playlist
        playlistTextField.font = .systemFont(ofSize: 20)
        playlistTextField.backgroundColor = .systemGray3
        playlistTextField.layer.cornerRadius = 5
        playlistTextField.clipsToBounds = true
        playlistTextField.textAlignment = .center
        playlistTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playlistTextField)

        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.systemGreen, for: .normal)
        editButton.addTarget(self, action: #selector(changeSongCell), for: .touchUpInside) //click on button activates delegate
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.systemGreen, for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)

        setupConstraints()
    }

    @objc func changeSongCell() {
        delegate?.changeSong(name: nameTextField.text!,artist: artistTextField.text!, playlist: playlistTextField.text!)
        song.songName = nameTextField.text!
        song.artist = artistTextField.text!
        song.playlist = playlistTextField.text!
        dismiss(animated: true)
    }
    
    @objc func back() {
        dismiss(animated: true)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            picImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            picImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            picImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: 10),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            artistTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            artistTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            artistTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            playlistTextField.topAnchor.constraint(equalTo: artistTextField.bottomAnchor, constant: 10),
            playlistTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playlistTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: editButton.bottomAnchor, constant: -30),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol ChangeSongDelegate: UITableViewCell{
    func changeSong(name: String, artist:String, playlist:String)
}

