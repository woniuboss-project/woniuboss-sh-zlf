# -*- coding: utf-8 -*-#

import requests

from util.utility import Utility


class Service:

	@classmethod
	def get_session(cls):
		base_info = Utility.get_json('../config/base.conf')
		login_url = "%s://%s:%s/%s/" %(base_info['PROTOCOL'],base_info['HOSTNAME'],base_info['PORT'],base_info['AURL'])
		login_data = {"username":base_info["USERNAME"],"password":base_info["PASSWORD"],"verifycode":base_info["VERIFYCODE"]}
		session = requests.session()
		session.post(login_url,login_data)
		return session

if __name__ == '__main__':
    Service.get_session()