# Dockerfile
FROM ubuntu:22.04

# به‌روزرسانی و نصب ابزارها
RUN apt-get update && apt-get install -y curl wget

# نصب Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# ایجاد اسکریپت برای دانلود مدل
RUN echo '#!/bin/bash\n\
ollama serve & \n\
sleep 10 \n\
ollama pull phi3:mini \n\
echo "مدل phi3:mini با موفقیت دانلود شد" \n\
wait' > /start.sh

# اجرای اسکریپت
CMD ["bash", "/start.sh"]
