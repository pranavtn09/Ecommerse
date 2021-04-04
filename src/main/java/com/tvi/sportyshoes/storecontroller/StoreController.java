package com.tvi.sportyshoes.storecontroller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.DocumentException;
import com.tvi.sportyshoes.dao.StoreRepo;
import com.tvi.sportyshoes.dao.UserRepo;
import com.tvi.sportyshoes.model.Shoes;
import com.tvi.sportyshoes.services.StorePDFExporter;
import com.tvi.sportyshoes.services.StoreService;


@RestController
public class StoreController {

	@Autowired
	StoreRepo sr;
	@Autowired
	UserRepo ur;
	
	@Autowired
	private StoreService ss;
	
	@RequestMapping("/")
	@ResponseBody
	public ModelAndView index() {
		ModelAndView mv= new ModelAndView("login.jsp");
		return mv;
	}
	
	@RequestMapping("/store")
	@ResponseBody
	public ModelAndView store() {
		ModelAndView mv= new ModelAndView("store.jsp");
		return mv;
	}
	
	
	@RequestMapping("/brandslist")
	@ResponseBody
	public ModelAndView brandList() {
		ModelAndView mv= new ModelAndView("brandslist.jsp");	
		List<String> shoes= sr.findByBrand();
		System.out.println("brands list is"+shoes.toArray().length);
		mv.addObject("shoe", shoes);
		return mv;
	}
	
	

	
	/* --------------product lits with brand mapping-------*/
	
	
	
	
	@RequestMapping("/productlist")
	@ResponseBody
	public ModelAndView showList() {
		List<Shoes> shoelist=sr.findAll();
		ModelAndView mv= new ModelAndView("productlist.jsp");
		mv.addObject("shoelist",shoelist);
		System.out.println(sr.findAll().toString());
		return mv;
		
	}
	
	@RequestMapping("/productlist/{brand}")
	@ResponseBody
	public ModelAndView showList(@PathVariable("brand") String brand) {
		List<Shoes> shoelist=sr.findByBrandSorted(brand);
		ModelAndView mv= new ModelAndView();
		
	
		mv.setViewName("productlist.jsp");
		mv.addObject("shoelist",shoelist);
		for (Shoes shoes : shoelist) {
			System.out.println(shoes.getShoename());
		}
		System.out.println(shoelist);
		return mv;
		
	}
	/* --------------product list with brand mapping-------*/
	
	/*---------------Update mapping----------------*/
	
	
	//-------------------------update controllers--------------
		//update controllers started
		@RequestMapping("/updateshoe/{id}")
		@ResponseBody 
		public ModelAndView updateItem(@PathVariable("id") int id) {
			System.out.print("id is :"+id);
			System.out.println("update item reached");
			ModelAndView mv= new ModelAndView("updateshoe.jsp");
			  List<Shoes> shoetoupdate_list= sr.findById(id);
			  for(Shoes sh:shoetoupdate_list) { 
			  Shoes shoetoupdate = new Shoes();
			  shoetoupdate.setId(id); shoetoupdate.setBrand(sh.getBrand());
			  shoetoupdate.setShoename(sh.getShoename());
			  shoetoupdate.setSize(sh.getSize()); 
			  mv.addObject("shoetoupdate",shoetoupdate);
			  } 
			  
			 	
			return mv;
		}
		
		@RequestMapping("/update_shoe/{id}")
		@ResponseBody
		public void updateShoe(@PathVariable("id") int id, Shoes shoe, HttpServletResponse response) throws IOException {
			System.out.println("update shoe reached");
			List<Shoes> shoetoupdate= sr.findById(id);
			for(Shoes sh: shoetoupdate) {
				sh.setBrand(shoe.getBrand());
				sh.setShoename(shoe.getShoename());
				sh.setSize(shoe.getSize());
				sr.save(sh);
				
				
			
			}
		
			response.sendRedirect("/productlist");
			
		}
		
	
	/*---------------------Update Mapping-------------------------*/
		
		/*--------------Delete Mapping-----------------------------*/
		
		@RequestMapping("/deleteitem/{id}")
		@ResponseBody
		public void deleteShoe(@PathVariable("id") int id, HttpServletResponse response) throws IOException {
			System.out.println("delete shoe reached");
			sr.deleteById(id);
			System.out.println("shoe deleted");
		
		
			response.sendRedirect("/productlist");
			
		}
		
		
		/*--------------Delete Mapping------------------------------*/
		

		/*--------------Add Mapping------------------------------*/
		@RequestMapping("/addshoe")
		@ResponseBody
		public ModelAndView addShoe() {
			ModelAndView mv=new ModelAndView("addshoe.jsp");
			return mv;
		}
		
		@RequestMapping("/saveitem")
		@ResponseBody
		public void saveItem(Shoes shoe,HttpServletResponse response) throws IOException {
			ModelAndView mv= new ModelAndView("productlist.jsp");
			int id=(int)(Math.random()*1000);
			System.out.println("id is"+id);
			shoe.setId(id);
			System.out.println("shoe is being saved..."+shoe.getId()+" and "+shoe.getBrand()+" and "+ shoe.getShoename());
			sr.save(shoe);
			response.sendRedirect("/productlist");		}
		
		/*--------------Add Mapping------------------------------*/
		
		/*--------------Export to PDF------------------------------*/

		@RequestMapping("/exporttoPDF")
		public void exportToPdf(HttpServletResponse response) throws DocumentException, IOException {
			response.setContentType("application/pdf");
			DateFormat dateformatter= new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
			String currentDateTime=dateformatter.format(new Date());
			
			String headkey="Content-Disposition";
			String headvalue="attachment;filename=shoes_"+currentDateTime+".pdf";
			response.setHeader(headkey, headvalue);
			List<Shoes> shoelist= ss.listAll();
			
			StorePDFExporter spf= new StorePDFExporter(shoelist);
			spf.export(response);
		}
		
		/*--------------Export to PDF------------------------------*/

		
		
		
		
}
