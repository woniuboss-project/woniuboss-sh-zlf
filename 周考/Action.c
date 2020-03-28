Action()
{
	web_url("open_home",
		"URL=https://snailpet.com/index",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"Mode=HTML",
		LAST);
	
	//登录接口的检查点
	web_reg_save_param_json(
		"ParamName=login_resp",
		"QueryString=$..message",
		SEARCH_FILTERS,
		LAST);

	//登录的接口请求
	web_custom_request("login_request",
		"URL=https://snailpet.com/v2/Passport/login",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={\"phone\": \"13685293653\",\"password\": \"yc2cxx\",\"shop_id\": null}",
		LAST);
	//添加断言
	lr_convert_string_encoding(lr_eval_string("{login_resp}"),"utf-8",NULL,"loginresp");
	lr_output_message(lr_eval_string("{loginresp}"));

	
	return 0;
}
