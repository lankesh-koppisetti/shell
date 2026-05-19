
LOG_FILE="/var/log/httpd/access_log"
BACKUP_DIR="/var/log/backup"

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Get file size in bytes
FILE_SIZE=$(stat -c%s "$LOG_FILE")

# 10 kb = 10240bytes
LIMIT=10240

if [ $FILE_SIZE -ge $LIMIT ]; then

    TIMESTAMP=$(date +%Y%m%d_%H%M%S)

    # Compress log file
    gzip -c $LOG_FILE > $BACKUP_DIR/app.log_$TIMESTAMP.gz

    echo "Log file compressed successfully"

    # Clear original log file
    > $LOG_FILE

fi
