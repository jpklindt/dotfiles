# Rclone sync setup

- Based on (https://stacker.news/items/576670)[Rclone drive sync]

## info

```bash
systemctl --user status rclone.service rclone.timer rclone.path
# Combined logs.
journalctl --user -xeu rclone.service rclone.timer rclone.path
```
