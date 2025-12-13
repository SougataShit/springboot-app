package com.example.learning.sonai;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SonaiControlller {
    
    @GetMapping("/")
    public String hello(){
        return "Hello";
    }
}
