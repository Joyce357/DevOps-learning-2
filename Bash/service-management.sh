#!/bin/bash

# Check if correct number of arguments are passed


if [ $# -ne 3 ]; then
   echo "Usage: $0 <environment> <action> <service-name> needed"
   echo "Example: bash $0 dev start nginx"
exit 1
fi

# Positional parameters
ENVIRONMENT=$1
ACTION=$2
SERVICE=$3

echo "Environment: $ENVIRONMENT"
echo "Action: $ACTION"
echo "Service: $SERVICE"
echo "----------------------------------"

# Execute task based on action
case $ACTION in
    start)
        echo "Starting $SERVICE in $ENVIRONMENT environment..."
        sudo systemctl start $SERVICE
        ;;
    stop)
        echo "Stopping $SERVICE in $ENVIRONMENT environment..."
        sudo systemctl stop $SERVICE
        ;;
    restart)
        echo "Restarting $SERVICE in $ENVIRONMENT environment..."
        sudo systemctl restart $SERVICE
        ;;
    *)
        echo "Invalid action. Use start | stop | restart"
        exit 1
        ;;
esac

echo "Task completed successfully!"
