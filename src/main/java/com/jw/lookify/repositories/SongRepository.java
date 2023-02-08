package com.jw.lookify.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jw.lookify.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long> {
	List<Song> findAll();
	
	
	@Query(value = "SELECT * FROM songs ORDER BY rating DESC LIMIT 5;", nativeQuery = true)
	List<Song> findTop10();
	
	@Query(value= "SELECT s FROM Song s WHERE s.artist LIKE %?1%")
	List<Song> searchTerm(String input);
}
