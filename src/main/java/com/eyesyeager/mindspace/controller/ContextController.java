package com.eyesyeager.mindspace.controller;

import com.eyesyeager.mindspace.constants.ContextCodeEnum;
import com.eyesyeager.mindspace.constants.ContextTypeEnum;
import com.eyesyeager.mindspace.model.vo.CheckUpdateVO;
import com.eyesyeager.mindspace.model.vo.ContextListVO;
import com.eyesyeager.mindspace.result.Result;
import com.eyesyeager.mindspace.service.IContextService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/context")
public class ContextController {
    @Resource
    private IContextService contextService;

    @GetMapping("/checkUpdate")
    public Result<CheckUpdateVO> checkUpdate() {
        List<ContextListVO> contextListVOList = contextService.getContextListByType(ContextTypeEnum.UPDATE.getType());
        CheckUpdateVO checkUpdateVO = new CheckUpdateVO();
        for (ContextListVO contextListVO : contextListVOList) {
            if (ContextCodeEnum.APP_VERSION.getCode().equals(contextListVO.getCode())) {
                checkUpdateVO.setVersion(contextListVO.getValue());
            } else if (ContextCodeEnum.UPDATE_URL.getCode().equals(contextListVO.getCode())) {
                checkUpdateVO.setUpdateUrl(contextListVO.getValue());
            }
        }
        return Result.success(checkUpdateVO);
    }

    @GetMapping("/checkInitContext")
    public Result<Boolean> checkInitContext(String version) {
        String content = contextService.getContext(ContextCodeEnum.INIT_CONTEXT_VERSION.getCode());
        return Result.success(version.equals(content));
    }

    @GetMapping("/getInitContextList")
    public Result<List<ContextListVO>> getInitContextList() {
        return Result.success(contextService.getContextListByType(ContextTypeEnum.INIT.getType()));
    }
}
