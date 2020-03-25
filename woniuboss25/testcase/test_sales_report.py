from interfacetest.woniusales_test01.common.sales_report import SalesReports
from interfacetest.woniusales_test01.util.utility import Utility
import unittest
from parameterized import parameterized
data_config_path = '../config/testdata.conf'

data_config_info = Utility.get_json(data_config_path)
result_info = Utility.get_excel_to_tuple(data_config_info[7])
class SaleReportTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.sale_report = SalesReports()


    @parameterized.expand(result_info)
    def test_sale_report_selldetailtoday(self,url,method,data,resp_code,resp_content):
        resp = self.sale_report.query_selldetailtoday(url, data)
        self.assertEqual(resp.text, resp_content)

if __name__ == '__main__':
    unittest.main(verbosity=2)
