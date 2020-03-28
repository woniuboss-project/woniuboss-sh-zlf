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
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	lr_start_transaction("login_request");
	lr_think_time(10);
	//登录的接口请求
	web_custom_request("login_request",
		"URL=https://snailpet.com/v2/Passport/login",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={login_json}",
		LAST);
	//lr_convert_string_encoding(lr_eval_string("{login_resp}"),"utf-8",NULL,"loginresp");
	lr_output_message(lr_eval_string("{login_resp}"));
	//添加断言
	if(atoi(lr_eval_string("{login_resp}"))==0){
		lr_output_message("login-pass");
		lr_end_transaction("login_request", LR_PASS);

	}else{
		lr_output_message("login-fail");
		lr_end_transaction("login_request", LR_FAIL);

	}
	
	//会员增加接口的检查点
	web_reg_save_param_json(
		"ParamName=add_customer_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	lr_think_time(10);
	lr_start_transaction("add_customer_request");
	//新增会员接口请求
	web_custom_request("add_customer_request",
		"URL=https://snailpet.com/v2/Members/add",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={add_customer_json}",
		LAST);
	//lr_convert_string_encoding(lr_eval_string("{add_customer_resp}"),"utf-8",NULL,"addresp");
	lr_output_message(lr_eval_string("{add_customer_resp}"));
	//添加断言
	if(atoi(lr_eval_string("{add_customer_resp}"))==0){
		lr_output_message("add-pass");
		lr_end_transaction("add_customer_request", LR_PASS);
	}else{
		lr_output_message("add-fail");
		lr_end_transaction("add_customer_request", LR_FAIL);
	}
	
	//商品增加接口检查点
	web_reg_save_param_json(
		"ParamName=add_product_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	lr_think_time(10);
	
	lr_start_transaction("add_product");
	//新增商品接口请求
	web_submit_data("add_product",
		"Action=https://snailpet.com/v2/Product/add",
		"Method=POST",
		"TargetFrame=",
		"Referer=",
		ITEMDATA,
		"Name=shopId", "Value=17567", ENDITEM,
		"Name=productId", "Value=0", ENDITEM,
		"Name=barCode", "Value=11111", ENDITEM,
		"Name=isServer", "Value=0", ENDITEM,
		"Name=name", "Value=1111", ENDITEM,
		"Name=specifications", "Value=1111", ENDITEM,
		"Name=categoryId", "Value=843351", ENDITEM,
		"Name=inPrice", "Value=23", ENDITEM,
		"Name=outPrice", "Value=44", ENDITEM,
		"Name=percentage", "Value=0", ENDITEM,
		"Name=notice_stocks", "Value=1", ENDITEM,
		"Name=weight", "Value=111", ENDITEM,
		"Name=logo_images", "Value=", ENDITEM,
		"Name=detail_images", "Value=", ENDITEM,
		"Name=production_time", "Value=", ENDITEM,
		"Name=brand_name", "Value=", ENDITEM,
		"Name=add_brand_category_id", "Value=1", ENDITEM,
		"Name=version", "Value=1", ENDITEM,
		"Name=shop_id", "Value=17567", ENDITEM,
		LAST);
	lr_output_message(lr_eval_string("{add_product_resp}"));
	//添加断言
	if(atoi(lr_eval_string("{add_product_resp}"))==0){
		lr_output_message("add-pass");
		lr_end_transaction("add_product", LR_PASS);
	}else{
		lr_output_message("add-fail");
		lr_end_transaction("add_product", LR_FAIL);
	}
	
	//查询销售页面接口检查点
	web_reg_save_param_json(
		"ParamName=query_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	lr_start_transaction("query_sales");
	//查询销售页面接口请求
	web_custom_request("query_sales",
		"URL=https://snailpet.com/v2/analysis_es/action",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={query_json}",
		LAST);
	lr_output_message(lr_eval_string("{query_resp}"));
	//添加断言
		if(atoi(lr_eval_string("{query_resp}"))==0){
		lr_output_message("query-pass");
		lr_end_transaction("query_sales", LR_PASS);
	}else{
		lr_output_message("query-fail");
		lr_end_transaction("query_sales", LR_FAIL);
	}
	
	//新建盘点接口请求
	web_reg_save_param_json(
		"ParamName=stocktaking_resp",
		"QueryString=$..error",
		SEARCH_FILTERS,
		LAST);
	lr_start_transaction("new_stocktaking");
	//新建盘点接口请求
	web_custom_request("new_stocktaking",
		"URL=https://snailpet.com/v2/shop/stocktaking/save",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={stock_json}",
		LAST);
	lr_output_message(lr_eval_string("{stocktaking_resp}"));
	//添加断言
	if(atoi(lr_eval_string("{stocktaking_resp}"))==0){
		lr_output_message("newstock-pass");
		lr_end_transaction("new_stocktaking", LR_PASS);
	}else{
		lr_output_message("newstock-fail");
		lr_end_transaction("new_stocktaking", LR_FAIL);
	}

	return 0;
}
