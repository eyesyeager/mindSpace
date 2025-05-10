package com.eyesyeager.mindspace.model.vo;

import lombok.Data;

import java.util.List;

@Data
public class MottoListVO {
    private Integer id;

    private String title;

    private String summary;

    private List<String> labels;
}
