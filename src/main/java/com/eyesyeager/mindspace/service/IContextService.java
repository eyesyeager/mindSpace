package com.eyesyeager.mindspace.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eyesyeager.mindspace.model.entity.Context;
import com.eyesyeager.mindspace.model.vo.ContextListVO;

import java.util.List;

public interface IContextService extends IService<Context> {
    String getContext(String code);

    List<ContextListVO> getContextListByType(String type);
}
