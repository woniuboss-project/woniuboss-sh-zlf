ActionWoniuShop()
{


	//登录
	lr_start_transaction("login");
	web_reg_save_param("ResponseBody", "LB=", "RB=", "Search=Body", LAST);
	web_save_header(REQUEST,"reqheader");
	web_reg_save_param_json(
		"ParamName=error",
		"QueryString=$.error",
		SEARCH_FILTERS,
		LAST);
	web_custom_request("web_custom_request",
	                   "URL=https://snailpet.com/v2/Passport/login",
	                   "Method=POST",
	                   "Mode=HTML",
	                   "Referer=https://snailpet.com/index",
	                   "Body={\"phone\":\"17710414056\",\"password\":\"woniu123\",\"shop_id\":null}",
	                   LAST);
	lr_output_message("body:%s",lr_eval_string("{ResponseBody}"));
	lr_output_message("header %s", lr_eval_string("{reqheader}"));
	
	if(atoi(lr_eval_string("{error}"))>0){
		lr_output_message("login success");
		lr_end_transaction("login", LR_PASS);
	}else{
		lr_output_message("login fail");
		lr_end_transaction("login", LR_FAIL);
	}





	//	添加支出
	lr_start_transaction("addSpending");

	web_reg_save_param("ResponseBody", "LB=", "RB=", "Search=Body", LAST);
	web_reg_save_param_json(
		"ParamName=error",
		"QueryString=$.error",
		SEARCH_FILTERS,
		LAST);
	web_save_header(REQUEST,"reqheader");
	web_add_header("token",
	               "20b8204416d85ac43be8c20f5d236492");
	web_add_header("Signature",
	               "9df77210a5b40d37e865d5b11da23050");
	web_submit_data("add request",
	                "Action=https://snailpet.com/v2/Shop/addSpending",
	                "Method=POST",
	                "TargetFrame=",
	                "Referer=",
	                ITEMDATA,
	                "Name=actionTime", "Value=1585238400", ENDITEM,
	                "Name=type", "Value=1", ENDITEM,
	                "Name=mark", "Value=", ENDITEM,
	                "Name=amount", "Value=666", ENDITEM,
	                "Name=shopId", "Value=17535", ENDITEM,
	                "Name=shop_id", "Value=17535", ENDITEM,
	                LAST);

	if(atoi(lr_eval_string("{error}"))>0){
		lr_output_message("action success");
		lr_end_transaction("addSpending", LR_PASS);


	}else{
		lr_output_message("action fail");
		lr_end_transaction("addSpending", LR_FAIL);

	}


	//	删除支出
	lr_start_transaction("delSpending");
	web_reg_save_param("ResponseBody", "LB=", "RB=", "Search=Body", LAST);
	web_reg_save_param_json(
		"ParamName=error",
		"QueryString=$.error",
		SEARCH_FILTERS,
		LAST);
	web_submit_data("login request",
	                "Action=https://snailpet.com/v2/Shop/delSpending",
	                "Method=POST",
	                "TargetFrame=",
	                "Referer=",
	                ITEMDATA,
	                "Name=spendingId", "Value=282793", ENDITEM,
	                "Name=shopId", "Value=17535", ENDITEM,
	                "Name=shop_id", "Value=17535", ENDITEM,
	                LAST);
	if(atoi(lr_eval_string("{error}"))>0){
		lr_output_message("action success");
		lr_end_transaction("delSpending", LR_PASS);

	}else{
		lr_output_message("action fail");
		lr_end_transaction("delSpending", LR_FAIL);

	}



	//添加盘点
	lr_start_transaction("product");

	web_reg_save_param_json(
		"ParamName=error",
		"QueryString=$.error",
		SEARCH_FILTERS,
		LAST);
	web_submit_data("login request",
	                "Action=https://snailpet.com/v2/repurchase_product/update_repurchase_product",
	                "Method=POST",
	                "TargetFrame=",
	                "Referer=",
	                ITEMDATA,
	                "Name=shop_id", "Value=17535", ENDITEM,
	                "Name=product_id_list", "Value=[]", ENDITEM,
	                LAST);
	if(atoi(lr_eval_string("{error}"))>0){
		lr_output_message("action success");
		lr_end_transaction("product", LR_PASS);


	}else{
		lr_output_message("action fail");
		lr_end_transaction("product", LR_FAIL);

	}
	
	//变更规则
	lr_start_transaction("sort");
	web_reg_save_param_json(
		"ParamName=error",
		"QueryString=$.error",
		SEARCH_FILTERS,
		LAST);
	web_submit_data("login request",
	                "Action=https://snailpet.com/v2/shop/set/upgrade/sort",
	                "Method=POST",
	                "TargetFrame=",
	                "Referer=",
	                ITEMDATA,
	                "Name=shop_id", "Value=17535", ENDITEM,
	                "Name=upgrade_type", "Value=3", ENDITEM,
	                "Name=level_list", "Value=[]", ENDITEM,
	                LAST);
	if(atoi(lr_eval_string("{error}"))>0){
		lr_output_message("action success");
		lr_end_transaction("", LR_PASS);

	}else{
		lr_output_message("action fail");
		lr_end_transaction("sort", LR_FAIL);

	}
	return 0;

}
