//
//  ViewController.swift
//  sc2628_p4
//
//  Created by Jenny Chen on 10/22/22.
//

import UIKit

class ViewController: UIViewController {
    var songs: [Song] = []
    let songTableView = UITableView()
    let reuseIdentifier = "songReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Playlist"
        view.backgroundColor = .white

        //initialize song list
        let song1 = Song(songPicName: "Your Existence", songName: "Your Existence", artist: "Wonstein", playlist: "")
        let song2 = Song(songPicName: "POP!", songName: "POP!", artist: "Nayeon", playlist: "")
        let song3 = Song(songPicName: "Psycho", songName: "Psycho", artist: "Red Velvet", playlist: "")
        let song4 = Song(songPicName: "Timing", songName: "Timing", artist: "Dept", playlist: "")
        let song5 = Song(songPicName: "Life Is Still Going On", songName: "Life Is Still Going On", artist: "NCT Dream", playlist: "")
        let song6 = Song(songPicName: "Polaroid Love", songName: "Polaroid Love", artist: "ENHYPEN", playlist: "")
        let song7 = Song(songPicName: "Talk that Talk", songName: "Talk that Talk", artist: "Twice", playlist: "")
        let song8 = Song(songPicName: "Forever 1", songName: "Forever 1", artist: "Girl's Generation", playlist: "")
        let song9 = Song(songPicName: "DARARI", songName: "DARARI", artist: "TREASURE", playlist: "")
        let song10 = Song(songPicName: "Feel My Rhythm", songName: "Feel My Rhythm", artist: "Red Velvet", playlist: "")
        songs = [song1,song2,song3,song4,song5,song6,song7,song8,song9,song10]

        //initialize TableView
        songTableView.translatesAutoresizingMaskIntoConstraints  = false
        songTableView.backgroundColor = .green
        songTableView.dataSource = self
        songTableView.delegate = self
        songTableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(songTableView)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            songTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            songTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            songTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            songTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])

    }
}

//Conform to UITableViewDelegate & UITableViewDataSource
extension ViewController: UITableViewDataSource{
    //return length of list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    //get appropiate song from the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = songTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SongTableViewCell{
            cell.configure(song: songs[indexPath.row])
            return cell
        }
        else{
            return UITableViewCell();
        }
    }
}

extension ViewController: UITableViewDelegate{
    //if cell is selected, display details for that cell 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = songTableView.cellForRow(at: indexPath) as! SongTableViewCell
        present(DetailViewController(song: songs[indexPath.row], delegate: cell), animated: true)
    }
}


