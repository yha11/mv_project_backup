package com.ezen.sb.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.sb.mapper.MovieMapper;
import com.ezen.sb.model.MovieVO;

@Service
public class MovieService {
	@Autowired
	private MovieMapper movieMapper;
	
	public List<MovieVO> getMoviesFromCGV() throws IOException{
		List<MovieVO> array = new ArrayList<>();
		Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
		Elements es = doc.select("ol");
		for (Element e : es.select("li")) {
			MovieVO vo = new MovieVO();
			vo.setRank(e.select(".rank").text());
			vo.setImage(e.select("img").attr("src"));
			vo.setTitle(e.select(".title").text());
			vo.setPercent(e.select(".percent span").text());
			vo.setLink(e.select(".box-image a").attr("href"));
			vo.setTicketing(e.select(".link-reservation").attr("href"));
			if (!e.select(".rank").text().equals("")) {
				array.add(vo);
			}
		}
		return array;
	}
	public List<MovieVO> selectBoards() throws IOException{
		if(movieMapper.countMovie()==0) {
			List<MovieVO> movieList = getMoviesFromCGV();
			for(MovieVO movie : movieList) {
				insertMovie(movie);
			}
		}
		return movieMapper.selectLists(null);
	}
	
	public List<MovieVO> selectBoards(MovieVO movieModel){
		return movieMapper.selectLists(movieModel);
	}
	
	public MovieVO selectMovieVO(String rank) {
		return movieMapper.selectRead(rank);
	}
	
	public int insertMovie(MovieVO movieModel) {
		return movieMapper.insertMovie(movieModel);
	}
	
	public int deleteMovie(MovieVO movieModel) {
		return movieMapper.deleteMovie(movieModel);
	}
	
}
