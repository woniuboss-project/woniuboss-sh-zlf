import requests, json

from interfacetest.woniusales_test01.common.customer import Customer
from interfacetest.woniusales_test01.common.sales import Sales
from interfacetest.woniusales_test01.util.utility import Utility
import unittest
from parameterized import  parameterized
base_conf_path = '../config/base.conf'
data_config_path = '../config/testdata.conf'


data_config_info = Utility.get_json(data_config_path)

scan_barcode_info = Utility.get_excel_to_tuple(data_config_info[11])

query_customer_info = Utility.get_excel_to_tuple(data_config_info[5])

class SalesTest(unittest.TestCase):


    # 商品扫码
    @parameterized.expand(scan_barcode_info)
    def test_scan_barcode(self,url,method,test_data,resp_code,resp_content):
        resp = Sales().scan_barcode(url, test_data)
        self.assertEqual(resp.text, resp_content)


    # 会员信息查询
    @parameterized.expand(query_customer_info)
    def test_query_customer(self,url,method,test_data,resp_code,resp_content):
        resp = Sales().query_customer(url, test_data)
        self.assertEqual(resp.text, resp_content)






if __name__ == '__main__':
    unittest.main(verbosity=2)
