package com.eyesyeager.mindspace.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eyesyeager.mindspace.model.entity.Noise;
import com.eyesyeager.mindspace.model.vo.NoiseListVO;

import java.util.List;

public interface INoiseService extends IService<Noise> {
    List<NoiseListVO> getNoiseList();

    String getNoiseAudio(Integer id);
}
