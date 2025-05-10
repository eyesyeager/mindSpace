package com.eyesyeager.mindspace.result;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 状态码类
 *
 * @author eyesYeager
 */
@Getter
@AllArgsConstructor
public enum ResultCode {
	SUCCESS(200, "success"),

	FAILURE(400, "fail"),

	// 1000 - 2000: 程序异常

	// 2001 - 3000: 业务异常
	;

	private final Integer code;

	private final String message;
}