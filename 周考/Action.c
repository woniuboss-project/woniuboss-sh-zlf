Action()
{
	web_url("open_home",
		"URL=https://snailpet.com/index",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"Mode=HTML",
		LAST);
	
	//��¼�ӿڵļ���
	web_reg_save_param_json(
		"ParamName=login_resp",
		"QueryString=$..message",
		SEARCH_FILTERS,
		LAST);

	//��¼�Ľӿ�����
	web_custom_request("login_request",
		"URL=https://snailpet.com/v2/Passport/login",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={\"phone\": \"13685293653\",\"password\": \"yc2cxx\",\"shop_id\": null}",
		LAST);
	//��Ӷ���
	lr_convert_string_encoding(lr_eval_string("{login_resp}"),"utf-8",NULL,"loginresp");
	lr_output_message(lr_eval_string("{loginresp}"));

	
	return 0;
}
