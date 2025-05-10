package com.eyesyeager.mindspace.controller;

import com.eyesyeager.mindspace.model.vo.NoiseListVO;
import com.eyesyeager.mindspace.result.Result;
import com.eyesyeager.mindspace.result.ResultCode;
import com.eyesyeager.mindspace.service.INoiseService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/noise")
public class NoiseController {

    @Resource
    private INoiseService noiseService;

    @GetMapping("getNoiseList")
    public Result<List<NoiseListVO>> getNoiseList() {
        return Result.success(noiseService.getNoiseList());
    }

    @GetMapping("getNoiseAudio")
    public Result<String> getNoiseAudio(Integer id) {
        return Result.success(ResultCode.SUCCESS.getMessage(), noiseService.getNoiseAudio(id));
    }
}
