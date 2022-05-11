package com.yedam.myserver.movie.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.myserver.movie.vo.MovieVO;

public interface MovieMapper {
	public List<MovieVO> find();
	public List<Map> findByName(MovieVO vo);
	public MovieVO findById(MovieVO vo);
	public void persist(MovieVO vo);
	public void merge(MovieVO vo);
	public void remove(MovieVO vo);
} 