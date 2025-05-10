package com.eyesyeager.mindspace.config;

import com.eyesyeager.mindspace.constants.HeaderConstants;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Value("${auth.expire}")
    private Long expireTime;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        // 获取鉴权相关信息
//        request.getHeaderNames();
//        String deviceId = request.getHeader(HeaderConstants.DEVICE_ID);
//        String currentTime = request.getHeader(HeaderConstants.CURRENT_TIME);
//        String token = request.getHeader(HeaderConstants.TOKEN);
//        if (!StringUtils.hasLength(deviceId) || !StringUtils.hasLength(currentTime) || !StringUtils.hasLength(token)) {
//            return false;
//        }
//        // 验证 token
//        String validToken = DigestUtils.md5DigestAsHex((deviceId + currentTime).getBytes());
//        if (!validToken.equals(token)) {
//            return false;
//        }
//        // 验证有效期
//        return Long.parseLong(currentTime) <= System.currentTimeMillis() / 1000 + expireTime;
        return true;
    }
}
