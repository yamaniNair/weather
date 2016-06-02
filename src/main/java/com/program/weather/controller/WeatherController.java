/**
 * 
 */
package com.program.weather.controller;

import java.io.IOException;
import java.util.Properties;

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

	@RequestMapping(value = "/currentWeather")
	public ModelAndView getCurrentWeather(@RequestParam(value="city", required=false, 
			defaultValue=Constant.OPENWEATHERMAP_CITY_DEFAULT) String city){
		LOGGER.debug("[WeatherController] currentWeather api : " + city);
		ModelAndView mv = new ModelAndView("weather");
		mv.addObject("city",city);
		return mv;
	}
}
