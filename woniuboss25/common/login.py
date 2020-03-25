import requests
class Login:
    def __init__(self):
        self.session = requests.session()

    def do_login(self,login_url,login_data):
        return  self.session.post(login_url,login_data)
