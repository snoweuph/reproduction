FROM fedora:41

RUN dnf install -y \
  git \
  make \
  wget \
  tar \
  zstd \
  gawk \
  gpg \
  which \
  wine \
  llvm \
  clang \
  lld \
  mingw64-gcc-c++ \
  cmake \
  meson

RUN curl \
  --proto '=https' \
  --tlsv1.2 \
  -sSf https://sh.rustup.rs \
  | sh -s -- -y

ENV PATH="/root/.cargo/bin:$PATH"

RUN cd / \
  && git clone https://github.com/holyblackcat/quasi-msys2 \
  && echo MINGW64 > /quasi-msys2/msystem.txt

RUN ln -nfs "/quasi-msys2/root/mingw64" /mingw64

RUN cd /quasi-msys2 \
  && make install \
    mingw-w64-x86_64-libadwaita \
    mingw-w64-x86_64-gettext

RUN sh -c 'source /quasi-msys2/env/all.src && rustup target add $CARGO_BUILD_TARGET'

WORKDIR /app
COPY build.sh /app/build.sh
CMD ["/app/build.sh"]
