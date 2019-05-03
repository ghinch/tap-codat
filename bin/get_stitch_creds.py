#!/usr/bin/env python

import os
import json

client_secret = os.getenv('STITCH_CLIENT_SECRET')
client_id = os.getenv('STITCH_CLIENT_ID')

data = {
    "client_id": int(client_id),
    "token": client_secret
}

print(json.dumps(data))
