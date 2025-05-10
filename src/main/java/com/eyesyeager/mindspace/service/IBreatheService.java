package com.eyesyeager.mindspace.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eyesyeager.mindspace.exception.BizException;
import com.eyesyeager.mindspace.model.entity.Breathe;
import com.eyesyeager.mindspace.model.vo.BreatheListVO;

import java.util.List;

public interface IBreatheService extends IService<Breathe> {
    List<BreatheListVO> getBreatheList();

    String getBreatheDetail(String id) throws BizException;
}
