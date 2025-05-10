package com.eyesyeager.mindspace.service.impl;

import com.aliyuncs.utils.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eyesyeager.mindspace.mapper.NoiseMapper;
import com.eyesyeager.mindspace.model.entity.Noise;
import com.eyesyeager.mindspace.model.vo.NoiseListVO;
import com.eyesyeager.mindspace.service.INoiseService;
import io.github.eyesyeager.eyesStorageStarter.service.EyesOssStorage;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

@Service
public class NoiseServiceImpl extends ServiceImpl<NoiseMapper, Noise> implements INoiseService {

    @Value("${file.path.noise-pic}")
    private String noisePicPath;

    @Value("${file.expire.noise-pic}")
    private Long noisePicExpire;

    @Value("${file.path.noise-audio}")
    private String noiseAudioPath;

    @Value("${file.expire.noise-audio}")
    private Long noiseAudioExpire;

    @Resource
    private EyesOssStorage ossStorage;

    @Override
    public List<NoiseListVO> getNoiseList() {
        List<Noise> noiseList = list(Wrappers.<Noise>lambdaQuery().orderByDesc(Noise::getWeight, Noise::getId));
        return noiseList.stream().map(v -> {
            NoiseListVO noiseListVO = new NoiseListVO();
            noiseListVO.setId(v.getId());
            noiseListVO.setName(v.getName());
            try {
                if (!StringUtils.isEmpty(v.getPicObjectName())) {
                    String signedUrl = ossStorage.getSignedUrl(v.getPicObjectName(), noisePicPath, noisePicExpire);
                    noiseListVO.setPicUrl(signedUrl);
                }
            } catch (Exception e) {
                log.error(String.format("noise pic %s sign error", v.getId()), e);
            }
            return noiseListVO;
        }).toList();
    }

    @Override
    public String getNoiseAudio(Integer id) {
        Noise noise = getOne(Wrappers.<Noise>lambdaQuery().eq(Noise::getId, id));
        if (Objects.isNull(noise)) {
            return null;
        }
        try {
            if (!StringUtils.isEmpty(noise.getAudioObjectName())) {
                return ossStorage.getSignedUrl(noise.getAudioObjectName(), noiseAudioPath, noiseAudioExpire);
            }
        } catch (Exception e) {
            log.error(String.format("noise audio %s sign error", id), e);
        }
        return null;
    }
}
