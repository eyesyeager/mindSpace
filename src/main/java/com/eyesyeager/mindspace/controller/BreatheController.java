package com.eyesyeager.mindspace.controller;

import com.eyesyeager.mindspace.exception.BizException;
import com.eyesyeager.mindspace.model.vo.BreatheListVO;
import com.eyesyeager.mindspace.result.Result;
import com.eyesyeager.mindspace.result.ResultCode;
import com.eyesyeager.mindspace.service.IBreatheService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/breathe")
public class BreatheController {

    @Resource
    private IBreatheService breatheService;

    @GetMapping("getBreatheList")
    public Result<List<BreatheListVO>> getBreatheList() {
        return Result.success(breatheService.getBreatheList());
    }

    @GetMapping("getBreatheDetail")
    public Result<String> getBreatheDetail(String id) throws BizException {
        return Result.success(ResultCode.SUCCESS.getMessage(), breatheService.getBreatheDetail(id));
    }
}
