package com.ezen.sb.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.sb.model.MovieDAO;
import com.ezen.sb.model.MovieVO;
import com.ezen.sb.model.MuserDAO;
import com.ezen.sb.model.MuserVO;
import com.ezen.sb.model.NaverAPI;

@Controller
public class MovieController {
	MovieDAO dao;
	MuserDAO mdao;

	@RequestMapping("/movie")
	public String moviejsp() {
		return "views/movie";
	}

	@ResponseBody  
	@RequestMapping("movie.json") 
	public ArrayList<MovieVO> movie() throws Exception { 
		ArrayList<MovieVO> array = new ArrayList<MovieVO>();
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

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public void insert(MovieVO vo) throws Exception {
		dao.insert(vo);
	}

	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public List<MovieVO> list() throws Exception {
		return dao.list();
	}

	@ResponseBody
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public void delete(String rank) throws Exception {
		dao.delete(rank);
	}

	@ResponseBody
	@RequestMapping("list.json")
	public List<MuserVO> mlist(String mrank) throws Exception {
		return mdao.list(mrank);
	}

	@ResponseBody
	@RequestMapping(value = "minsert", method = RequestMethod.POST)
	public void minsert(MuserVO vo) throws Exception {
		mdao.insert(vo);
	}

	@ResponseBody
	@RequestMapping("nmovie.json")
	public String movieList(String keyword, String start) throws Exception {
		String text = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/movie.json?"; 
		apiURL += "query=" + text;
		apiURL += "&start=" + start;
		apiURL += "$display=5";
		return NaverAPI.search(apiURL);
	}

	@ResponseBody
	@RequestMapping(value = "mdelete", method = RequestMethod.POST)
	public void mdelete(String mrank) throws Exception {
		mdao.delete(mrank);
	}
}
