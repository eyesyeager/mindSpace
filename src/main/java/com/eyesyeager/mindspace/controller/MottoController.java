package com.eyesyeager.mindspace.controller;

import com.eyesyeager.mindspace.exception.BizException;
import com.eyesyeager.mindspace.model.vo.MottoDetailVO;
import com.eyesyeager.mindspace.model.vo.MottoListVO;
import com.eyesyeager.mindspace.result.Result;
import com.eyesyeager.mindspace.service.IMottoService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/motto")
public class MottoController {

    @Resource
    private IMottoService mottoService;

    @GetMapping("/getMottoList")
    public Result<List<MottoListVO>> getMottoList(Integer pageIndex) {
        return Result.success(mottoService.getMottoList(pageIndex));
    }

    @GetMapping("/getMottoDetail")
    public Result<MottoDetailVO> getMottoDetail(Integer id) throws BizException {
        return Result.success(mottoService.getMottoDetail(id));
    }
}
