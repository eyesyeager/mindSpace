package com.eyesyeager.mindspace.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eyesyeager.mindspace.model.dto.TraceAddDTO;
import com.eyesyeager.mindspace.model.entity.Trace;

public interface ITraceService extends IService<Trace> {
    void addTrace(TraceAddDTO traceAddDTO);
}
