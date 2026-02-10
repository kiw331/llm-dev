# 1. 베이스 이미지 (파이썬 3.9 설치된 리눅스)
FROM python:3.9-slim

# 2. 컨테이너 안의 작업 디렉토리 설정
WORKDIR /app

# 3. 필요한 파일들을 컨테이너로 복사
COPY . /app

# 4. 라이브러리 설치
RUN pip install --no-cache-dir -r requirements.txt

# 5. 외부로 노출할 포트
EXPOSE 5000

# 6. 실행 명령
CMD ["python", "app.py"]