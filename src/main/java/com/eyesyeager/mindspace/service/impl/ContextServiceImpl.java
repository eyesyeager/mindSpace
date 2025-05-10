package com.eyesyeager.mindspace.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eyesyeager.mindspace.mapper.ContextMapper;
import com.eyesyeager.mindspace.model.entity.Context;
import com.eyesyeager.mindspace.model.vo.ContextListVO;
import com.eyesyeager.mindspace.service.IContextService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContextServiceImpl extends ServiceImpl<ContextMapper, Context> implements IContextService {
    @Override
    public String getContext(String code) {
        Context context = getOne(Wrappers.<Context>lambdaQuery().eq(Context::getCode, code));
        return context.getValue();
    }

    @Override
    public List<ContextListVO> getContextListByType(String type) {
        List<Context> list = list(Wrappers.<Context>lambdaQuery().eq(Context::getType, type));
        return list.stream().map(v -> {
            ContextListVO contextListVO = new ContextListVO();
            BeanUtils.copyProperties(v, contextListVO);
            return contextListVO;
        }).toList();
    }
}
