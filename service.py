from flask import Flask, jsonify
from flask.views import View
from letmecrawl import letmecrawl

app = Flask(__name__)


def lmc():
    for proxy in letmecrawl():
        yield proxy


# TODO: not production ready at all
class LMCView(View):
    methods = ['POST', 'GET']

    def dispatch_request(self):
        try:
            proxy = next(letmecrawl())
            return jsonify({'proxy': str(proxy)}), 200
        except Exception as exp:
            return jsonify({'error': exp}), 502


def main():
    app.add_url_rule('/', view_func=LMCView.as_view('/'))
    app.run('0.0.0.0', 8000)


if __name__ == '__main__':
    main()
