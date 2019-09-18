#!/usr/bin/env bash
#
# Generate mesos-config_my-jira-tickets.json to deploy assets for My Jira tickets on Mesos
# cat mesos-config_my-jira-tickets.json | xclip -selection c

assets=$(ls -1 | grep -Ev '.zip$')
zip assets.zip ${assets} # /!\ filename should not have space

cat << 'EOF' > mesos-config_my-jira-tickets.json
{
  "id": "/incubator/my-jira-tickets",
  "cmd": "python -m SimpleHTTPServer $PORT0 --bind 0.0.0.0",
  "cpus": 1,
  "mem": 256,
  "disk": 100,
  "networkBandwidth": 50,
  "gpus": 0,
  "instances": 1,
  "labels": {
    "MESOS_TERM_DEBUG_GRANTED_TO": "g.legoux"
  },
  "portDefinitions": [
    {
      "labels": {
        "ctags": "http"
      },
      "protocol": "tcp"
    }
  ],
  "fetch": [
    {
      "uri": "http://flynns.criteois.lan:8000/assets.zip",
      "extract": true,
      "executable": false,
      "cache": false
    }
  ],
  "user": "incubator"
}
EOF

