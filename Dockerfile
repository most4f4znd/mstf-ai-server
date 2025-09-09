# Dockerfile
FROM ubuntu:22.04

# به‌روزرسانی و نصب ابزارها
RUN apt-get update && apt-get install -y curl wget

# نصب Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# ایجاد اسکریپت برای دانلود مدل هنگام اجرا
RUN echo '#!/bin/bash\n\
ollama serve & \
sleep 10 \
&& ollama pull llama3:8b \
&& echo "مدل llama3:8b با موفقیت دانلود شد" \
&& wait' > /start.sh

# اجرا کردن اسکریپت
CMD ["bash", "/start.sh"]
