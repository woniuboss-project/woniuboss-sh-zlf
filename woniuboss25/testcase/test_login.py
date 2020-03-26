import ssl

import requests, time
import unittest
from parameterized import parameterized

from common.login import Login
from util.utility import Utility

data_config_path = '../config/testdata.conf'

data_config_info = Utility.get_json(data_config_path)
login_info = Utility.get_excel_to_tuple(data_config_info[0])

class LoginTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.login = Login();

    @parameterized.expand(login_info)
    def test_login(self,url,method,test_data,resp_code,resp_content):

        login_resp =self.login.do_login(url, test_data)
        login_resp_content = login_resp.text
        self.assertEqual(login_resp_content,resp_content)


if __name__ == '__main__':
    unittest.main(verbosity=2)
    issubclass(ssl.SSLEOFError, Exception)