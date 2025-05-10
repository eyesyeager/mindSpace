package com.eyesyeager.mindspace;

import com.eyesyeager.mindspace.service.IMottoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
public class ModelTest {

    @Value("${auth.tencent.secret-id}")
    private String secretId;

    @Value("${auth.tencent.secret-key}")
    private String secretKey;

    @Resource
    private IMottoService mottoService;
}
