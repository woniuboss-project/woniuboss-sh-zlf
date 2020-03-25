class GoodsStore:
    def __init__(self):
        from interfacetest.woniusales_test01.util.service import Service
        self.session = Service.get_session()

    # 商品入库
    def goods_store(self, url, data):
        return self.session.post(url, data)
