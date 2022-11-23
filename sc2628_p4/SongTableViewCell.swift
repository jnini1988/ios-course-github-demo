//
//  SongTableViewCell.swift
//  sc2628_p4
//
//  Created by Jenny Chen on 10/22/22.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    let songImageView = UIImageView()
    let songLabel = UILabel();
    let artistLabel = UILabel();
    let playlistLabel = UILabel();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songImageView)
        
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.textColor = .black
        songLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contentView.addSubview(songLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.textColor = .systemTeal
        artistLabel.attributedText = NSAttributedString(string: "Text", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        artistLabel.font = UIFont.italicSystemFont(ofSize: 15)
        contentView.addSubview(artistLabel)
        
        playlistLabel.translatesAutoresizingMaskIntoConstraints = false
        playlistLabel.textColor = .systemGreen
        playlistLabel.font = UIFont.italicSystemFont(ofSize: 15)
        contentView.addSubview(playlistLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(song: Song){
        songImageView.image = UIImage(named: song.songPicName)
        songLabel.text = song.songName
        artistLabel.text = song.artist
        playlistLabel.text = song.playlist
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            songImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            songImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            songImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            songImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            songLabel.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor,constant: 5),
            songLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor,constant: 5),
            artistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            playlistLabel.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor,constant: 15),
            playlistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 10)
        ])
        
    }
    
    // Configure the view for the selected state
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SongTableViewCell: ChangeSongDelegate{
    func changeSong(name: String, artist: String, playlist: String) {
        songLabel.text = name
        artistLabel.text = artist
        playlistLabel.text = playlist
    }
}

