#!/bin/bash

# 도커이미지 빌드
sudo docker build -t myapp .

# 컨테이너 이름 설정
CONTAINER_NAME="myfastapiapp"

# 동일한 이름의 컨테이너가 실행 중인지 확인
if sudo docker ps -a | grep -q $CONTAINER_NAME; then
    echo "기존 컨테이너 ($CONTAINER_NAME) 삭제 중..."
    sudo docker rm -f $CONTAINER_NAME
else
    echo "기존 컨테이너가 없음, 새 컨테이너 생성 진행"
fi

sudo iptables -I INPUT -p tcp --dport 8000 -j ACCEPT
# sudo service iptables save

# 새 컨테이너 실행
sudo docker run -d --name $CONTAINER_NAME -p 8000:8000 myapp
