# Dockerfile
FROM ubuntu:22.04

# به‌روزرسانی و نصب ابزارها
RUN apt-get update && apt-get install -y curl

# نصب Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# دانلود مدل Llama 3.1 8B
RUN ollama pull llama3:8b

# پورت اصلی Ollama
EXPOSE 11434

# اجرای سرویس Ollama
CMD ["ollama", "serve"]
