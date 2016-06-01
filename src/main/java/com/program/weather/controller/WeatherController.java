/**
 * 
 */
package com.program.weather.controller;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.program.weather.constant.Constant;

/**
 * @author yamani.nair
 *
 */
@Controller
public class WeatherController {
	
	private static final Logger LOGGER = Logger.getLogger(WeatherController.class);
	
	@RequestMapping("/currentWeather")
	public ModelAndView printMessage(
			@RequestParam(value=Constant.CURRENTWEATHER_API_PARAM1, 
						  required=false,
						  defaultValue=Constant.CURRENTWEATHER_API_PARAM1_DEFAULT) String name){
		LOGGER.debug("[WeatherController] currentWeather api");
		ModelAndView mv = new ModelAndView("weather");
		mv.addObject("message",Constant.MESSAGE);
		mv.addObject("name",name);
		return mv;
	}
}
