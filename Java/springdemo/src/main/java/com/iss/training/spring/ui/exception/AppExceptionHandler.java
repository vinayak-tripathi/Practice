package com.iss.training.spring.ui.exception;

import java.util.Date;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.iss.training.spring.ui.model.response.ErrorMessage;


@ControllerAdvice
public class AppExceptionHandler extends ResponseEntityExceptionHandler{
	 @ResponseStatus(HttpStatus.BAD_REQUEST)
	@ExceptionHandler(value = {Exception.class})
	public ResponseEntity<Object> handleAnyException(Exception ex, WebRequest request){
		
		String errorMessageDesc = ex.getLocalizedMessage();
		
		if (errorMessageDesc==null) errorMessageDesc = ex.toString();
		ErrorMessage errorMessage = new ErrorMessage(new Date(), ex.getLocalizedMessage());
		return new ResponseEntity<>(
				errorMessage, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ExceptionHandler(value = {NullPointerException.class, UserException.class})
	public ResponseEntity<Object> handleSpecificException(Exception ex, WebRequest request){
		
		String errorMessageDesc = ex.getLocalizedMessage();
		
		if (errorMessageDesc==null) errorMessageDesc = ex.toString();
		ErrorMessage errorMessage = new ErrorMessage(new Date(), ex.getLocalizedMessage());
		return new ResponseEntity<>(
				errorMessage, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
