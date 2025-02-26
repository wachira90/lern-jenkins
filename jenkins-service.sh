#!/bin/bash
SERVICE_NAME="jenkins"
# PID_FILE="/var/run/$SERVICE_NAME.pid"
# LOG_FILE="/var/log/$SERVICE_NAME.log"
PID_FILE="/tmp/$SERVICE_NAME.pid"
LOG_FILE="/tmp/$SERVICE_NAME.log"
JENKINS_WAR="/home/ubuntu/jenkins.war"
JAVA_CMD="java -jar"
start_service() {
    if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
        echo "$SERVICE_NAME is already running (PID: $(cat $PID_FILE))"
        exit 1
    fi
    echo "Starting $SERVICE_NAME..."
    nohup $JAVA_CMD "$JENKINS_WAR" >> "$LOG_FILE" 2>&1 &
    PID=$!
    echo $PID > "$PID_FILE"
    echo "$SERVICE_NAME started (PID: $PID)"
}
stop_service() {
    if [ ! -f "$PID_FILE" ]; then
        echo "$SERVICE_NAME is not running (PID file not found)"
        exit 1
    fi
    PID=$(cat "$PID_FILE")
    if kill -0 "$PID" 2>/dev/null; then
        echo "Stopping $SERVICE_NAME (PID: $PID)..."
        kill "$PID"
        rm -f "$PID_FILE"
        echo "$SERVICE_NAME stopped"
    else
        echo "$SERVICE_NAME is not running (stale PID file)"
        rm -f "$PID_FILE"
    fi
}
status_service() {
    if [ -f "$PID_FILE" ] && kill -0 $(cat "$PID_FILE") 2>/dev/null; then
        echo "$SERVICE_NAME is running (PID: $(cat $PID_FILE))"
    else
        echo "$SERVICE_NAME is not running"
    fi
}
case "$1" in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    status)
        status_service
        ;;
    restart)
        stop_service
        start_service
        ;;
    *)
        echo "Usage: $0 {start|stop|status|restart}"
        exit 1
        ;;
esac
exit 0
