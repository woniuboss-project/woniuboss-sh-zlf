import requests
import json
def post_parajson(request_url, parm):
    data = json.dumps(parm).encode("utf-8")
    head = {"Content-Type": "application/json; charset=UTF-8", 'Connection': 'close'}
    r = requests.post(request_url, data=data, headers=head)
    responsedata = r.text
    print('响应报文: ', responsedata)
    print("get the status: ", r.status_code)
    # 返回请求响应报文
    return responsedata

if __name__ == '__main__':
    dct={"name":"L","age":23}
    post_parajson("https://jsonplaceholder.typicode.com/posts",dct)