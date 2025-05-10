package com.eyesyeager.mindspace.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eyesyeager.mindspace.exception.BizException;
import com.eyesyeager.mindspace.model.entity.Motto;
import com.eyesyeager.mindspace.model.vo.MottoDetailVO;
import com.eyesyeager.mindspace.model.vo.MottoListVO;

import java.util.List;

public interface IMottoService extends IService<Motto> {
    List<MottoListVO> getMottoList(Integer pageIndex);

    MottoDetailVO getMottoDetail(Integer id) throws BizException;
}
