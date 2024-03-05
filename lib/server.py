from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    # the logic is gonna to fetch data from the database or perform any backend operation
    data = {"message": "Hello from Python backend!"}
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)