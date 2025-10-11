# 베이스 이미지
FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# requirements.txt 복사
COPY requirements.txt requirements.txt

# 기본 패키지 먼저 설치 (TensorFlow 제외)
RUN pip install --default-timeout=100 --no-cache-dir flask flask-cors mysql-connector-python pillow matplotlib numpy

# TensorFlow는 따로 설치 (시간 오래 걸림)
RUN pip install --default-timeout=200 --no-cache-dir tensorflow

# 전체 프로젝트 복사
COPY . .

# 업로드 폴더 확인
RUN mkdir -p uploads

# 포트 설정
EXPOSE 5000

# 앱 실행 명령
CMD ["python", "photoDBinsert.py"]
