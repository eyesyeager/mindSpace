package com.eyesyeager.mindspace.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ContextCodeEnum {

    APP_VERSION("app_version"),

    UPDATE_URL("update_url"),

    INIT_CONTEXT_VERSION("init_context_version"),
    ;

    private final String code;
}
