package com.eyesyeager.mindspace.controller;

import com.eyesyeager.mindspace.model.dto.TraceAddDTO;
import com.eyesyeager.mindspace.service.ITraceService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/trace")
public class TraceController {
    @Resource
    private ITraceService traceService;

    @PostMapping("addTrace")
    public void addTrace(@RequestBody TraceAddDTO traceAddDTO) {
        traceService.addTrace(traceAddDTO);
    }
}
