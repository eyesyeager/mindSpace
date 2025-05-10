package com.eyesyeager.mindspace.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eyesyeager.mindspace.mapper.TraceMapper;
import com.eyesyeager.mindspace.model.dto.TraceAddDTO;
import com.eyesyeager.mindspace.model.entity.Trace;
import com.eyesyeager.mindspace.service.ITraceService;
import com.eyesyeager.mindspace.utils.IpUtils;
import com.eyesyeager.mindspace.utils.WebUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Service
public class TraceServiceImpl extends ServiceImpl<TraceMapper, Trace> implements ITraceService {
    @Override
    public void addTrace(TraceAddDTO traceAddDTO) {
        Trace trace = new Trace();
        BeanUtils.copyProperties(traceAddDTO, trace);
        // 获取ip
        String ip = null;
        HttpServletRequest httpServletRequest = WebUtils.getRequest();
        if (Objects.nonNull(httpServletRequest)) {
            ip = IpUtils.getIpAddr(httpServletRequest);
        }
        trace.setIp(ip);
        // 插入数据库
        if (!save(trace)) {
            log.error("insert trace failed, trace: " + trace);
        }
    }
}
