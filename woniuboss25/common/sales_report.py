class SalesReports:
    def __init__(self):
        from interfacetest.woniusales_test01.util.service import Service
        self.session = Service.get_session()

    # 查询当日明细
    def query_selldetailtoday(self, selldetailtoday_url, selldetailtoday_data):
        return self.session.post(selldetailtoday_url, selldetailtoday_data)

