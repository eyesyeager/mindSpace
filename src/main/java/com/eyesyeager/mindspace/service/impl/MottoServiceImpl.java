package com.eyesyeager.mindspace.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eyesyeager.mindspace.constants.StatusEnum;
import com.eyesyeager.mindspace.exception.BizException;
import com.eyesyeager.mindspace.mapper.MottoLabelMapper;
import com.eyesyeager.mindspace.mapper.MottoMapper;
import com.eyesyeager.mindspace.model.entity.Motto;
import com.eyesyeager.mindspace.model.entity.MottoLabel;
import com.eyesyeager.mindspace.model.vo.MottoDetailVO;
import com.eyesyeager.mindspace.model.vo.MottoListVO;
import com.eyesyeager.mindspace.service.IMottoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
@Service
public class MottoServiceImpl extends ServiceImpl<MottoMapper, Motto> implements IMottoService {

    private static final int MOTTO_LIST_SIZE = 10;

    private static final String TODAY_MOTTO = "今日推荐";

    @Resource
    private MottoLabelMapper mottoLabelMapper;

    @Override
    public List<MottoListVO> getMottoList(Integer pageIndex) {
        List<Motto> mottoList = baseMapper.getRandomMottoList(StatusEnum.NORMAL.getCode(), MOTTO_LIST_SIZE);
        List<Integer> idList = mottoList.stream().map(Motto::getId).toList();
        // 如果不是首页，则需排除当日随机列表
        if (pageIndex != 0) {
            mottoList = list(Wrappers.<Motto>lambdaQuery()
                    .eq(Motto::getStatus, StatusEnum.NORMAL.getCode())
                    .notIn(Motto::getId, idList)
                    .orderByDesc(Motto::getWeight, Motto::getCreateTime)
                    .last("limit " + (pageIndex - 1) * MOTTO_LIST_SIZE + " ," + MOTTO_LIST_SIZE)
            );
            idList = mottoList.stream().map(Motto::getId).toList();
        }
        if (CollectionUtils.isEmpty(mottoList)) {
            return new ArrayList<>();
        }
        // 获取格言标签
        List<MottoLabel> mottoLabelList = mottoLabelMapper.selectList(Wrappers.<MottoLabel>lambdaQuery().in(MottoLabel::getMottoId, idList));
        Map<Integer, List<MottoLabel>> mottoLabelListMap = mottoLabelList.stream().collect(Collectors.groupingBy(MottoLabel::getMottoId));
        // 组装结果
        return mottoList.stream().map(v -> {
            MottoListVO item = new MottoListVO();
            item.setId(v.getId());
            item.setTitle(v.getTitle());
            item.setSummary(v.getSummary());
            List<String> labelList = new ArrayList<>();
            if (pageIndex == 0) {
                labelList.add(TODAY_MOTTO);
            }
            List<MottoLabel> mottoLabels = mottoLabelListMap.get(v.getId());
            if (!CollectionUtils.isEmpty(mottoLabels)) {
                labelList.addAll(mottoLabels.stream().map(MottoLabel::getLabel).toList());
            }
            item.setLabels(labelList);
            return item;
        }).toList();
    }

    @Override
    public MottoDetailVO getMottoDetail(Integer id) throws BizException {
        Motto mottoEntity = getOne(Wrappers.<Motto>lambdaQuery()
                .eq(Motto::getId, id)
                .eq(Motto::getStatus, StatusEnum.NORMAL.getCode()));
        if (Objects.isNull(mottoEntity)) {
            throw new BizException("???");
        }
        MottoDetailVO result = new MottoDetailVO();
        BeanUtils.copyProperties(mottoEntity, result);
        return result;
    }
}
