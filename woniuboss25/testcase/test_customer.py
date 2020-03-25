import requests

from interfacetest.woniusales_test01.common.customer import Customer
from interfacetest.woniusales_test01.util.utility import Utility
import unittest
from parameterized import parameterized

base_conf_path = '../config/base.conf'
data_config_info = Utility.get_json('../config/testdata.conf')

add_customer_info = Utility.get_excel_to_tuple(data_config_info[1])
query_customer_info = Utility.get_excel_to_tuple(data_config_info[2])
edit_customer_info = Utility.get_excel_to_tuple(data_config_info[3])
class CustomerTest(unittest.TestCase):

	@classmethod
	def setUpClass(cls):
		cls.customer = Customer()

	# 添加会员
	@parameterized.expand(add_customer_info)
	def test_add_customer(self,url,method,test_data,resp_code,resp_content):
		print(url)
		add_customer_resp = self.customer.add_customer(url,test_data)
		self.assertEqual(add_customer_resp.text,resp_content)



	# 会员查询  查询1条 查询0条 查询所有 查询部分
	@parameterized.expand(query_customer_info)
	def test_query_customer(self,url,method,test_data,resp_code,resp_content):
		query_customer_content = self.customer.query_customer(url, test_data)
		sql_all = 'select count(customerid) from customer'
		all_customer_number = Utility.query_one('../config/base.conf', sql_all)[0]
		phone = test_data['customerphone']
		sql_part = 'select count(customerid) from customer where customerphone like "%s"' % (phone)
		part_cusomer_number = Utility.query_one('../config/base.conf', sql_part)[0]
		if len(query_customer_content) == 0:
			actual = 'query zero'
		elif len(query_customer_content) == 1:
			actual = 'query one'
		elif len(query_customer_content) == all_customer_number:
			actual = 'query all'
		elif len(query_customer_content) == part_cusomer_number :
			actual = 'query part'
		else:
			actual = 'query error'
		self.assertEqual(actual, resp_content)

	@parameterized.expand(edit_customer_info)
	def test_edit_customer(self,url,method,test_data,resp_code,resp_content):
		add_customer_resp = self.customer.add_customer(url,test_data)
		self.assertEqual(add_customer_resp.text,resp_content)



if __name__ == '__main__':
	unittest.main(verbosity=2)
