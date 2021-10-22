import socketio
sio = socketio.Client()
sio.connect("http://192.168.15.5:3000")

@sio.on("server_information")
def on_message(data) :
    print("I reived : " + str(data))
