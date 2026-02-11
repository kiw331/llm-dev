
```
# 프로젝트 폴더 생성 및 이동
mkdir torch-ubuntu && cd torch-ubuntu

# uv 프로젝트 초기화
uv init

# 파이썬 3.12 버전 고정
uv python pin 3.12



# 타임아웃 10분 설정
export UV_HTTP_TIMEOUT=600

# 설치 및 동기화
uv sync


uv run python -c "import torch; import sys; print(f'Python: {sys.version.split()[0]}'); print(f'PyTorch: {torch.__version__}'); print(f'GPU Available: {torch.cuda.is_available()}'); print(f'Device Name: {torch.cuda.get_device_name(0) if torch.cuda.is_available() else \"None\"}')"


```
