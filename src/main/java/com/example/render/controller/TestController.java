package com.example.render.controller;

import com.example.render.entity.Test;
import com.example.render.service.TestService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/test")
public class TestController {

    private final TestService testService;

    public TestController(TestService testService) {
        this.testService = testService;
    }

    @PostMapping
    public Test createTest(@RequestParam String name) {
        return testService.saveTest(name);
    }

    @GetMapping
    public List<Test> getAllTests() {
        return testService.getAllTests();
    }
}