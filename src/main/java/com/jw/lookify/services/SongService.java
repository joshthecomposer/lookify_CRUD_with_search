package com.jw.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.jw.lookify.models.Song;
import com.jw.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository repo;
	
	public SongService(SongRepository repo) {
		this.repo = repo;
	}
	
	public List<Song> findAll(){
		return repo.findAll();
	}
	
	public Song findById(Long id) {
		Optional<Song> o = repo.findById(id);
		if (o.isPresent()) {
			return o.get();
		} else {
			return null;
		}
	}
	
	public Song save(Song s) {
		return repo.save(s);
	}
	
	public void deleteById(Long id) {
		repo.deleteById(id);
	}
	
	public List<Song> top10() {
		return repo.findTop10();
	}
	
	public List<Song> search(String input) {
		
		
		return repo.searchTerm(input);
	}
}
