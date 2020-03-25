from util.service import Service


class EtprsManage:
    def __init__(self):
        self.session = Service.get_session()

    # 查询企业
    def etprs_manage(self, test_url, test_data,upload_file):

        return self.session.post(url=test_url, data=test_data, files=upload_file)
    # 查询企业
    def query_etprs(self, test_url, test_data):
        return self.session.post(url=test_url, data=test_data)

