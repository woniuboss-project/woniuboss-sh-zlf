from interfacetest.woniusales_test01.util.service import Service


class StoreQuery(object):
    def __init__(self):
        self.session = Service.get_session()

    def query_store(self, url, data):
        query_store_result = []
        page_num = 1
        while 1:
            if 'query/stored' not in str(url):
                result = self.session.post(url, {'page': str(page_num)})

            else:
                result = self.session.post(url, {'goodsserial': data['goodsserial'],
                                                 'goodsname': '',
                                                 'barcode': '',
                                                 'goodstype': '',
                                                 'earlystoretime': '',
                                                 'laststoretime':'',
                                                 'page': str(page_num)})
            result_json = result.json()
            if len(result_json) == 0:
                break
            else:
                for r in result_json:
                    query_store_result.append(r)
                page_num += 1
        return query_store_result
