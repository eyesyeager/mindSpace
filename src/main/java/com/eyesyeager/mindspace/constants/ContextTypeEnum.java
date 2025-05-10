package com.eyesyeager.mindspace.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ContextTypeEnum {

    UPDATE("update"),

    INIT("init"),

    CONFIG("config"),
    ;

    private final String type;
}
