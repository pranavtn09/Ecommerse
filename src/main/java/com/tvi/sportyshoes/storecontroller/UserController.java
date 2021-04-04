package com.tvi.sportyshoes.storecontroller;

import java.net.http.HttpResponse;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tvi.sportyshoes.dao.UserRepo;
import com.tvi.sportyshoes.model.Users;

@RestController
public class UserController {
	
	@Autowired
	UserRepo ur;
	

	@RequestMapping("/userlist")
	@ResponseBody
	public ModelAndView userList() {
		System.out.println("Users list is reached");
		ModelAndView mv= new ModelAndView("userlist.jsp");	
		List<String> user= ur.findAllByUsername();
		System.out.println("Users list is"+user.toString());
		mv.addObject("users", user);
		return mv;
	}
	
	
	@RequestMapping("/login")
	@ResponseBody
	public ModelAndView login() {
		
		ModelAndView mv= new ModelAndView("login.jsp");
		return mv;
	}
	
	//https://www.baeldung.com/spring_redirect_after_login
	@RequestMapping("/userviewpage")//https://www.devglan.com/spring-security/spring-boot-security-redirect-after-login
	@ResponseBody
	public ModelAndView userViewPage() {
		
		ModelAndView mv= new ModelAndView("userViewPage.jsp");
		return mv;
	}
	
	/*
	 * @RequestMapping(value ="/check_login", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public ModelAndView check_Login(@RequestParam
	 * Map<String,String> requestParams, HttpServletResponse res) { ModelAndView mv=
	 * new ModelAndView(); String username=requestParams.get("username"); String
	 * pwd=requestParams.get("password");
	 * System.out.println("login check reached"+username+" username length"
	 * +username.length()); //String role="USER"; Users u=
	 * ur.findByUsernameLogin(username); if(u.getPassword().equals(pwd)) {
	 * //role=u.getRole(); //mv.addObject("role", role); mv.addObject("username",
	 * username); System.out.println( " and"+ username); Cookie ck= new
	 * Cookie("username", username); res.addCookie(ck);
	 * mv.setViewName("productlist.jsp"); } else { mv.addObject("message",
	 * "Wrong Credential"); mv.setViewName("login.jsp"); }
	 * 
	 * return mv; }
	 */

}
