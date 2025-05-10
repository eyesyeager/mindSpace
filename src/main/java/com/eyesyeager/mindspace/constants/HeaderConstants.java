package com.eyesyeager.mindspace.constants;

import java.util.Arrays;
import java.util.List;

public class HeaderConstants {

    public static final List<String> HEADERS = Arrays.asList(
            HeaderConstants.DEVICE_ID,
            HeaderConstants.CURRENT_TIME,
            HeaderConstants.TOKEN
    );

    public static final String DEVICE_ID = "device-id";

    public static final String CURRENT_TIME = "current-time";

    public static final String TOKEN = "token";
}
