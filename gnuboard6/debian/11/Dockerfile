# Debian 이미지를 사용
FROM debian:11

# 환경 설정 및 패키지 설치
RUN apt-get update && \
    apt-get install -y python3.9 python3-pip git

# GitHub에서 소스 코드 클론
RUN git clone https://github.com/gnuboard/g6.git /app

# 작업 디렉토리 설정
WORKDIR /app

# 필요한 Python 패키지 설치
# FastAPI와 Uvicorn을 포함한 requirements.txt 파일이 /app 안에 있어야 합니다.
# 해당 파일이 없다면, 이 명령어 전에 COPY 명령어를 사용하여 requirements.txt를 추가해야 합니다.
RUN python3.9 -m pip install --no-cache-dir -r requirements.txt

# FastAPI 애플리케이션 실행
CMD ["python3.9", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
