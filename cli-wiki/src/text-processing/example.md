# Practical Examples
## 1. Find and Delete Logs Older Than 7 Days
```bash
find /var/log -name "*.log" -mtime +7 | xargs rm
```


## 2. Extract IP Addresses from a Log File
```bash
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' access.log
```


## 3. Replace "http" with "https" in HTML Files
```bash
sed -i 's/http:/https:/g' *.html
```


## 4. Get a List of Usernames from /etc/passwd
```bash
awk -F: '{print $1}' /etc/passwd
```


## 5. Filter and Count Errors in Log
```bash
grep "ERROR" server.log | wc -l
```


## 6. Count Lines of Code in All `.py` Files
```bash
find . -name "*.py" | xargs wc -l
```


## 7. Remove Empty Lines from a File
```bash
sed '/^$/d' file.txt
```


## 8. Show All Lines Not Containing a Word
```bash
grep -v "DEBUG" log.txt
```


## 9. Print Lines Where a Field Value Meets a Condition
```bash
awk '$2 > 50 {print $1, $2}' scores.txt
```


## 10. Edit Multiple Files and Replace a Word
```bash
grep -rl "localhost" . | xargs sed -i 's/localhost/127.0.0.1/g'
```

---

> These tools combined are powerful for automation, quick filtering, and processing large volumes of text directly in the shell. Ideal for scripting and DevOps workflows.


