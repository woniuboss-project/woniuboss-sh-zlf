import json
import unittest
from parameterized import parameterized

from common.enterprise_manage import EtprsManage
from util.utility import Utility

data_config_path = '../config/testdata.conf'

data_config_info = Utility.get_json(data_config_path)
result_info = Utility.get_excel_to_tuple(data_config_info[2])
print('result_info',result_info)

class BatchManageTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.enterprise_manage = EtprsManage()


    # @parameterized.expand(result_info)
    # def test_batch_manage(self,url,method,data,resp_code,resp_content):
    #     resp = self.batch_manage.batch_manage(url, data,filePath)
    #     if len(resp.json()) > 0:
    #         actual = 'import success'
    #     self.assertEqual(actual, resp_content)

    @parameterized.expand(result_info)
    def test_query_batch(self, url, method, data, resp_code, resp_content):
        resp = self.enterprise_manage.query_etprs(url, data)
        resp_list=json.loads(resp.text).get('list')
        print('resp====',len(resp_list))
        if len(resp_list)>0:
            actual = 'query_success'
        self.assertEqual(actual, resp_content)

if __name__ == '__main__':
    unittest.main(verbosity=2)