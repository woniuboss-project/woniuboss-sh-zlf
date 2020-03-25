from util.service import Service


class QueryReports:
    def __init__(self):

        self.session = Service.get_session()

    def query_report(self, selldetailtoday_url, selldetailtoday_data):
        return self.session.post(selldetailtoday_url, selldetailtoday_data)

