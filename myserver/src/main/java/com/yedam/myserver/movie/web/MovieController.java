package com.yedam.myserver.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.movie.mapper.MovieMapper;
import com.yedam.myserver.movie.vo.MovieVO;

@CrossOrigin(origins = {"*"}, maxAge = 3600) //해당 포트로만 접속허용.
@RestController //responsebody , controller 둘다 갖고있다. 마우스 올려보면.
public class MovieController {

	@Autowired MovieMapper mapper;
	
	@GetMapping("/movies")
	public List<MovieVO> movieselect() {
		return mapper.find();
	}


	@PostMapping("/movies") //파라미터 queryString, jsonString(@requestbody 입력시 jsontype 받음.)
	public MovieVO movieInsert(@RequestBody MovieVO vo) {
		 mapper.persist(vo);
		
		 return vo;
	}

	@PutMapping("/movies")
	public MovieVO movieUpdate(@RequestBody MovieVO vo) {
		 mapper.merge(vo);
		 return vo;
	}	
		
}