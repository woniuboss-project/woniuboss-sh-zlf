
import unittest
from parameterized import parameterized

from common.report import QueryReports
from util.utility import Utility

data_config_path = '../config/testdata.conf'

data_config_info = Utility.get_json(data_config_path)
result_info = Utility.get_excel_to_tuple(data_config_info[1])
class QueryReportTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.query_report = QueryReports()


    @parameterized.expand(result_info)
    def test_sale_report_selldetailtoday(self,url,method,data,resp_code,resp_content):
        resp = self.query_report.query_report(url, data)
        print('resp.status_code',resp.status_code)
        if(int(resp.status_code) == int(resp_code)):
            rst="query_success"
        else:
            rst="error"

        self.assertEqual(rst, resp_content)

if __name__ == '__main__':
    unittest.main(verbosity=2)
