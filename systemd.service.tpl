[Unit]
RefuseManualStart=true
 
[Service]
Restart=always
WorkingDirectory={{dir}}
ExecStart={{dir}}/.venv/bin/python {{dir}}/server.py

