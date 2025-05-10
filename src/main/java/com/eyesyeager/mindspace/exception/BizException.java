package com.eyesyeager.mindspace.exception;

import com.eyesyeager.mindspace.result.ResultCode;
import lombok.Getter;
import lombok.ToString;

/**
 * 业务异常类
 *
 * @author eyes
 */
@ToString
@Getter
public class BizException extends Exception {
	protected Integer errorCode;

	protected String errorMsg;

	public BizException() {
		this.errorCode = ResultCode.FAILURE.getCode();
		this.errorMsg = ResultCode.FAILURE.getMessage();
	}

	public BizException(String errorMsg) {
		this.errorCode = ResultCode.FAILURE.getCode();
		this.errorMsg = errorMsg;
	}

	public BizException(Integer errorCode, String errorMsg) {
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}

	public BizException(ResultCode resultCode) {
		this.errorCode = resultCode.getCode();
		this.errorMsg = resultCode.getMessage();
	}

	public BizException(Exception e) {
		super(e);
	}

	public BizException(String errorMsg, Exception e) {
		super(errorMsg, e);
	}
}
