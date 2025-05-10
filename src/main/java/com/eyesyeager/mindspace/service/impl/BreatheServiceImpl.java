package com.eyesyeager.mindspace.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eyesyeager.mindspace.constants.StatusEnum;
import com.eyesyeager.mindspace.exception.BizException;
import com.eyesyeager.mindspace.mapper.BreatheMapper;
import com.eyesyeager.mindspace.model.entity.Breathe;
import com.eyesyeager.mindspace.model.vo.BreatheListVO;
import com.eyesyeager.mindspace.service.IBreatheService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class BreatheServiceImpl extends ServiceImpl<BreatheMapper, Breathe> implements IBreatheService {
    @Override
    public List<BreatheListVO> getBreatheList() {
        return list(Wrappers.<Breathe>lambdaQuery().eq(Breathe::getStatus, StatusEnum.NORMAL.getCode()))
                .stream()
                .map(v -> {
                    BreatheListVO breatheListVO = new BreatheListVO();
                    BeanUtils.copyProperties(v, breatheListVO);
                    return breatheListVO;
                }).toList();
    }

    @Override
    public String getBreatheDetail(String id) throws BizException {
        Breathe entity = getOne(Wrappers.<Breathe>lambdaQuery()
                .eq(Breathe::getStatus, StatusEnum.NORMAL.getCode())
                .eq(Breathe::getId, id));
        if (Objects.isNull(entity)) {
            throw new BizException("???");
        }
        return entity.getContent();
    }
}
