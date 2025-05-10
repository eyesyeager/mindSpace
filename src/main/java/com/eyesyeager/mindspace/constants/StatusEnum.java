package com.eyesyeager.mindspace.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StatusEnum {

    NORMAL(0),

    FREEZING(1),
    ;

    private final int code;
}
