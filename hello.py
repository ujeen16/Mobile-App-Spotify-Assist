import addsong
from flask import Flask
from flask import request

app = Flask(__name__)


# http://127.0.0.1:5000/doARequest?username=abc	  the value of the parameter username
@app.route('/doARequest', methods=['POST', 'GET'])
# @app.run(debug=True, host = '0.0.0.0', port=int(os.environ.get('PORT', 8080)))
def myRequest():
    if request.method == "GET":
        x = {
            "username": request.args.get("username")
        }
        y = list(x.values())[0]
        addsong.main(y)
        return y
    return "no parameters"
