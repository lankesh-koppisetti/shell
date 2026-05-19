Important commands
-----
Check  file size
--
ls -lh filename(path)

generate dummy logs
---
for i in {1..500}; do
echo "Test log $i" >> /var/log/httpd/access_log
done

file size in bytes
---
stat -c%s filename

disk size
---
du -sh filename

watch live logs
---
watch ls -lh /var/log/httpd/access_log   ---2 seconds
tail -f /var/log/httpd/access_log   ---immediate logs
