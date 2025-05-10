package com.eyesyeager.mindspace.model.dto;

import lombok.Data;

@Data
public class TraceAddDTO {
    private String key;

    private String content;

    private String deviceId;

    private String os;

    private String model;
}
