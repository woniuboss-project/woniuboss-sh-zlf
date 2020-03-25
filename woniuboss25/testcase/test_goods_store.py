import requests, time
import unittest
from parameterized import parameterized

from interfacetest.woniusales_test01.common.goods_store import GoodsStore
from interfacetest.woniusales_test01.util.utility import Utility

data_config_path = '../config/testdata.conf'

data_config_info = Utility.get_json(data_config_path)
info = Utility.get_excel_to_tuple(data_config_info[10])


class GoodsStoreTest(unittest.TestCase):

    @parameterized.expand(info)
    def test_goods_store(self, url, method, test_data, resp_code, resp_content):
        resp = GoodsStore().goods_store(url, test_data)
        if len(resp.json())  > 0:
            actual = 'store_success'

        self.assertEqual(actual, resp_content)


if __name__ == '__main__':
    unittest.main(verbosity=2)
