import cherrypy
import os
import threading


class HelloWorld(object):
    @cherrypy.expose
    def index(self):
        return "Hello world! (PID: %d)" % os.getpid()

    @cherrypy.expose
    def reload(self):
        threading.Thread(target=cherrypy.engine.exit).start()
        return "EXITING (PID: %d)" % os.getpid()


if __name__ == '__main__':
    cherrypy.quickstart(HelloWorld(), config='server.conf')

