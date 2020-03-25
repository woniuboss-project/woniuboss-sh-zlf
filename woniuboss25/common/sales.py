
import requests
class Sales:

	def __init__(self):
		from interfacetest.woniusales_test01.util.service import Service
		self.session = Service.get_session()

	# 商品扫码
	def scan_barcode(self,scan_barcode_url,scan_barcode_data):
		return self.session.post(scan_barcode_url,scan_barcode_data)
	# 查询会员信息
	def query_customer(self,query_customer_url,query_customer_data):
		return self.session.post(query_customer_url,query_customer_data)

	def sell_confirm(self,sell_confirm_url,sell_confirm_data):
		return self.session.post(sell_confirm_url,sell_confirm_data)
