# CentOS 이미지 사용
FROM quay.io/centos/centos:stream9

# Clean yum cache, update the system and install essential packages
RUN yum -y install git
#    yum -y clean all && \
#    yum -y makecache && \
#    yum -y update && \
#    yum -y install yum-utils && \

# Install IUS repository for more recent versions of some software like Git
#RUN yum -y install https://repo.ius.io/ius-release-el7.rpm

# Install Python from EPEL repository
# RUN yum -y install epel-release
RUN yum -y install python3.12 python3.12-pip python3.12-devel
    
# git을 사용하여 GitHub에서 소스 코드 클론
RUN git clone https://github.com/gnuboard/g6.git /app

# 작업 디렉토리 설정
WORKDIR /app

# 필요한 Python 패키지 설치
# FastAPI와 Uvicorn을 포함한 requirements.txt 파일이 /app 안에 있어야 합니다.
# 해당 파일이 없다면, 이 명령어 전에 COPY 명령어를 사용하여 requirements.txt를 추가해야 합니다.
RUN pip3.12 install --no-cache-dir -r requirements.txt

# 방화벽 설정
# FastAPI 애플리케이션 실행
# CMD [ \
#     "iptables", "-I", "INPUT", "-p", "tcp", "--dport", "8000", "-j", "ACCEPT" && \
#     "service", "iptables", "save" && \
#     "python3.12", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" \
#     ]
CMD ["python3.12", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
