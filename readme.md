echo 'export PATH=/usr/local/cuda-12.8/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc

```
export PATH=/usr/local/cuda-12.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH
```

```
# 1. 기존에 잘못 받아진 파일이 있다면 삭제
rm -f cuda-keyring_1.1-1_all.deb

# 2. Ubuntu 24.04용 키링 다운로드
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb

# 3. 키링 설치
sudo dpkg -i cuda-keyring_1.1-1_all.deb

# 4. 패키지 리스트 업데이트 (이 과정에서 엔비디아 서버를 인식하게 됩니다)
sudo apt update

```


```
mkdir -p ~/git_package/dev-test/
cd ~/git_package/dev-test/

# uv로 가상환경 생성
uv venv --python 3.12

# 가상환경 활성화
source .venv/bin/activate


# 1. 현재 폴더를 uv 프로젝트로 초기화 (pyproject.toml 생성)
uv init

# 2. 사용할 파이썬 버전 고정 (3.12 권장)
uv python pin 3.12


# PyTorch 전용 인덱스 추가
uv add --index https://download.pytorch.org/whl/cu124 torch torchvision torchaudio



uv add torch torchvision torchaudio --index https://download.pytorch.org/whl/cu124


uv add transformers accelerate bitsandbytes

uv add flash-attn --no-build-isolation

# uv.lock 내용을 바탕으로 표준 requirements.txt 생성
uv export --format requirements-txt > requirements.txt



```


```python


# 터미널에 'uv run python' 입력 후 실행
import torch
print(f"인식된 GPU 개수: {torch.cuda.device_count()}")
for i in range(torch.cuda.device_count()):
    print(f"GPU {i}: {torch.cuda.get_device_name(i)} ({torch.cuda.get_device_properties(i).total_memory / 1024**3:.2f} GB)")


```


```
-- ssh_monitor.conf
-- SSH 서버 상태 및 GPU/CPU 정보를 바탕화면에 표시하는 위젯 설정

conky.config = {
    alignment = 'top_right',
    background = true,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = 'white',
    double_buffer = true,
    font = 'DejaVu Sans Mono:size=10',
    gap_x = 60,
    gap_y = 60,
    minimum_width = 300,
    own_window = true,
    own_window_type = 'desktop',
    own_window_transparent = true,
    update_interval = 2.0,
}

conky.text = [[
${color orange}SYSTEM ${hr 2}
${color white}Hostname: $nodename
${color white}Uptime: $uptime
${color white}SSH Service: ${if_match "${exec systemctl is-active ssh}" == "active"}${color green}RUNNING${else}${color red}STOPPED${endif}

${color orange}GPU BLACKWELL ${hr 2}
${color white}GPU 1: ${exec nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i 0}% | ${exec nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits -i 0}°C
${color white}GPU 2: ${exec nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i 1}% | ${exec nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits -i 1}°C
]]

```

