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
