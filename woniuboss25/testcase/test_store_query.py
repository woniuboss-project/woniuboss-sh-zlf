import requests

from interfacetest.woniusales_test01.common.customer import Customer
from interfacetest.woniusales_test01.common.store_query import StoreQuery
from interfacetest.woniusales_test01.util.utility import Utility
import unittest
from parameterized import parameterized

base_conf_path = '../config/base.conf'
data_config_info = Utility.get_json('../config/testdata.conf')
query_info = Utility.get_excel_to_tuple(data_config_info[9])
class StoreQueryTest(unittest.TestCase):

	@classmethod
	def setUpClass(cls):
		cls.store_query = StoreQuery()

	@parameterized.expand(query_info)
	def test_query_store(self,url,method,test_data,resp_code,resp_content):
		print('url', url)
		query_store_count = len(self.store_query.query_store(url, test_data))


		# 查询0库存
		sql_zero = 'SELECT COUNT(*) FROM storesum WHERE  remained = 0'
		zero_count = Utility.query_one('../config/base.conf', sql_zero)[0]

		# 查询未入库
		sql_no_store = 'SELECT COUNT(*) FROM goods WHERE barcode="0"'
		nostore_count = Utility.query_one('../config/base.conf', sql_no_store)[0]

		# 根据货号查询库存
		sql_condition_store = 'SELECT COUNT(*) FROM storesum WHERE goodsserial="M4T2047C"'
		condition_store_count = Utility.query_one('../config/base.conf', sql_condition_store)[0]



		if query_store_count == zero_count:
			actual = 'query_success'
		elif query_store_count == nostore_count:
			actual = 'query_success'
		elif query_store_count == condition_store_count:
			actual = 'query_success'
		else:
			actual = 'query error'
		self.assertEqual(actual, resp_content)




if __name__ == '__main__':
	unittest.main(verbosity=2)
