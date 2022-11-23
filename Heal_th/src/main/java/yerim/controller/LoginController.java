package yerim.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import yerim.service.face.LoginService;

@Controller
public class LoginController {
 @Autowired LoginService loginService;
 private final Logger logger = LoggerFactory.getLogger(this.getClass());


}
