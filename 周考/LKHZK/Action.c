Action()
{
	web_url("open_page",
		"URL=https://snailpet.com",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"Mode=HTTP",
		LAST);
	
	web_reg_save_param_json(
		"ParamName=login_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	lr_start_transaction("login_request");
	
	web_custom_request("login_request",
		"URL=https://snailpet.com/v2/Passport/login",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={json_login}",
		LAST);

	lr_output_message(lr_eval_string("{login_resp}"));
	//添加断言
	if(atoi(lr_eval_string("{login_resp}"))==0){
		lr_output_message("login-pass");
		lr_end_transaction("login_request", LR_PASS);

	}else{
		lr_output_message("login-fail");
		lr_end_transaction("login_request", LR_FAIL);

	}
	
	
	 //新增会员
	web_reg_save_param_json(
		"ParamName=custom_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	 
lr_start_transaction("customer_request");
	web_custom_request("customer_request",
		"URL=https://snailpet.com/v2/Members/add",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={customer_json}",
		LAST);
	lr_output_message(lr_eval_string("{add_customer_resp}"));
	if(atoi(lr_eval_string("{custom_resp}"))==0){
		lr_output_message("add-customer-pass");
		lr_end_transaction("customer_request", LR_PASS);
	}else{
		lr_output_message("add-customer-fail");
		lr_end_transaction("customer_request", LR_FAIL);
	}
	
	//删除会员
	web_reg_save_param_json(
		"ParamName=del_customer_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	lr_start_transaction("del_customer_request");
	web_custom_request("del_customer_request",
		"URL=https://snailpet.com/v2/Members/del",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={del_customer}",
		LAST);
	lr_output_message(lr_eval_string("{del_customer_resp}"));
	if(atoi(lr_eval_string("{del_customer_resp}"))==0){
		lr_output_message("del-customer-pass");
		lr_end_transaction("del_customer_request", LR_PASS);
	}else{
		lr_output_message("del-customer-fail");
		lr_end_transaction("del_customer_request", LR_FAIL);
	}
	
	//库存盘点_新建盘点
	web_reg_save_param_json(
		"ParamName=save_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	
	lr_start_transaction("save_request");

	web_custom_request("save_request",
		"URL=https://snailpet.com/v2/shop/stocktaking/save",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={save_json}",
		LAST);
	lr_output_message(lr_eval_string("{save_resp}"));
	if(atoi(lr_eval_string("{save_resp}"))==0){
		lr_output_message("save-pass");
		lr_end_transaction("save_request", LR_PASS);
	}else{
		lr_output_message("save-fail");
		lr_end_transaction("save_request", LR_FAIL);
	}
	
	//支出_记一笔
	web_reg_save_param_json(
		"ParamName=addspending_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	
	lr_start_transaction("addspending_request");
	web_custom_request("addspending_request",
		"URL=https://snailpet.com/v2/Shop/addSpending",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={addspending_json}",
		LAST);
	lr_output_message(lr_eval_string("{addspending_resp}"));
	if(atoi(lr_eval_string("{addspending_resp}"))==0){
		lr_output_message("save-pass");
		lr_end_transaction("addspending_request", LR_PASS);
	}else{
		lr_output_message("save-fail");
		lr_end_transaction("addspending_request", LR_FAIL);
	}
	//添加会员卡
	web_reg_save_param_json(
		"ParamName=setmemberLevel_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);	
	
	lr_start_transaction("setmemberLevel_request");

	web_custom_request("setmemberLevel_request",
		"URL=https://snailpet.com/v2/Shop/setMemberLevel",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={setmemberLevel}",
		LAST);
	lr_output_message(lr_eval_string("{setmemberLevel_resp}"));
	if(atoi(lr_eval_string("{setmemberLevel_resp}"))==0){
		lr_output_message("setmemberLevel-pass");
		lr_end_transaction("setmemberLevel_request", LR_PASS);
	}else{
		lr_output_message("setmemberLevel-fail");
		lr_end_transaction("setmemberLevel_request", LR_FAIL);
	}
	
	return 0;
}


	
