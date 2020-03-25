from interfacetest.woniusales_test01.common.batch_manage import BatchManage
from interfacetest.woniusales_test01.common.sales_report import SalesReports
from interfacetest.woniusales_test01.util.utility import Utility
import unittest
from parameterized import parameterized
data_config_path = '../config/testdata.conf'

data_config_info = Utility.get_json(data_config_path)
result_info = Utility.get_excel_to_tuple(data_config_info[8])

filePath = {'batchfile': ('batcn_upload.xls', open(file='../testdata/batcn_manage.xls', mode='rb'))}

class BatchManageTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.batch_manage = BatchManage()


    @parameterized.expand(result_info)
    def test_batch_manage(self,url,method,data,resp_code,resp_content):
        resp = self.batch_manage.batch_manage(url, data,filePath)
        if len(resp.json()) > 0:
            actual = 'import success'
        self.assertEqual(actual, resp_content)

    @parameterized.expand(result_info)
    def query_batch(self, url, method, data, resp_code, resp_content):
        resp = self.batch_manage.query_batch(url, data, filePath)
        sql = "SELECT COUNT(*) FROM goods WHERE batchname={}".format(data['batchname'])
        sql_result = Utility.query_one('../config/base.conf', sql)
        if len(resp.json()) == sql_result:
            actual = 'query_success'
        self.assertEqual(actual, resp_content)

if __name__ == '__main__':
    unittest.main(verbosity=2)