class BatchManage:
    def __init__(self):
        from interfacetest.woniusales_test01.util.service import Service
        self.session = Service.get_session()

    # 上传商品文件
    def batch_manage(self, test_url, test_data,upload_file):

        return self.session.post(url=test_url, data=test_data, files=upload_file)
    # 按批次查询商品
    def query_batch(self, test_url, test_data):
        return self.session.post(url=test_url, data=test_data)

