from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return "<h1>Hello, World!</h1>" # return HTML
@app.route('/describe')
def get_description():
    return """
    <h1>
        Flask API
    </h1>
    <p>
        This app supports the endpoint listed below. You can change the data being sent to the API by updating the URI.
        </p>
        <p>The four request methods we will use are GET, POST, PUT, and DELETE. GET requests can be used in a browser. The other methods can be used via CURL or another API platform, such as Postman or Thunder Client in VS Code.
    <p>
    <ul>
        <li><a href='http://127.0.0.1:5000/describe'>GET This Page</a></li>
        <li><a href='http://127.0.0.1:5000/username/1'>GET a username from ID</a></li>
        <li><a href='http://127.0.0.1:5000/users/'>GET all user info</a></li>
    </ul>
    <p>The endpoints below can be accessed over CURL using the correct request method.</p>
    </ul>
        <li>curl -X POST 'http://127.0.0.1:5000/new_user/Georgina/' # POST a new user</a></li>
        <li>curl -X PUT 'http://127.0.0.1:5000/update_username/1/Hazel/' # PUT updates</li>
        <li>curl -X DELETE 'http://127.0.0.1:5000/delete_user/1/' # DELETE a user by ID</a></li>
    <ul>
    """
users_database = {
    1: "Alice",
    2: "Rachel",
    3: "Joe"
}

@app.route("/username/<int:id>/", methods=['GET']) # notice the id is captured from the URI
def get_username(id):
    if id in users_database:
        return {"username": users_database[id]}
    else:
        return {"error":"User not found."}

@app.route("/users/", methods=['GET'])
def get_users():
    return users_database
# add a new record
@app.route("/new_user/", methods=['POST'])
def new_user():
    """
    curl -X POST -H "Content-Type: application/json" -d '{"username": "Georgina"}' http://127.0.0.1:5000/new_user/
    """
    data = request.get_json()
    username = data.get('username')

    if username in users_database.values():
        return jsonify({"error": "That username already exists. Please use a different one."})
    else:
        new_id = len(users_database) + 1
        users_database[new_id] = username
        return jsonify({
            "new_user_report": {
                "ID": new_id,
                "username": username
            }
        })

app.run()