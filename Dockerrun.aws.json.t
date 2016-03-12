{
  "AWSEBDockerrunVersion": 2,
  "containerDefinitions": [
    {
      "name": "proxy",
      "image": "awsloft16/photogram-proxy:v_BUILD_NUMBER",
      "essential": true,
      "memory": 256,
      "portMappings": [
        {
          "hostPort": 80,
          "containerPort": 80
        }
      ],
      "links": [
        "web:dvo305demo_web_1"
      ]
    },
    {
      "name": "web",
      "image": "awsloft16/photogram-web:v_BUILD_NUMBER",
      "essential": true,
      "memory": 512,
      "portMappings": [
        {
          "hostPort": 3000,
          "containerPort": 3000
        }
      ],
      "environment" : [
        {
          "name": "SECRET_KEY_BASE",
          "value": "eeb58e7c5a1f01d5f7ac66cda0a935dd42f994ccd599d848f90f0c8f264ffc89e3102a01c0dda815f1834de4e937d180ef6004efa55258df2d6be4a2e5a2c21f"
        },
        {
          "name": "RAILS_ENV",
          "value": "production"

        },
        {
          "name": "RDS_PASSWORD",
          "value": "photopwd"
        },
        {
          "name": "RDS_HOSTNAME",
          "value": "ebdb.copob5mk4xyd.us-east-1.rds.amazonaws.com"
        },
        {
          "name": "RDS_PORT",
          "value": "5432"
        },
        {
          "name": "RDS_USERNAME",
          "value": "photouser"
        },
        {
          "name": "RDS_DB_NAME",
          "value": "ebdb"
        }
      ]
    }
  ]
}
