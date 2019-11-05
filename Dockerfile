FROM python:3.7-slim

RUN set -x \
    && ffmpegURL='https://johnvansickle.com/ffmpeg/releases' \
	&& buildDeps='wget unzip dirmngr' \
    && runDeps='ca-certificates wget xz-utils gosu' \
    && appArch=$(dpkg --print-architecture) \
    # install dependencies
	&& apt-get update && apt-get install -y --no-install-recommends $buildDeps $runDeps \
    # setup gosu
	&& gosu nobody true \
    # install ffmpeg
    && mkdir -p /tmp/ffmpeg \
    && wget $ffmpegURL"/ffmpeg-release-"$appArch"-static.tar.xz" -O /tmp/ffmpeg/ffmpeg.tar.xz \
    && tar -xf /tmp/ffmpeg/ffmpeg.tar.xz -C /tmp/ffmpeg/ --strip-components 1 \
    && cp /tmp/ffmpeg/ffmpeg /tmp/ffmpeg/ffprobe /tmp/ffmpeg/qt-faststart /usr/bin \
    && rm -rf /tmp/ffmpeg/ \
    # clean
    && apt-get purge -y --auto-remove $buildDeps \
	&& rm -fr /var/lib/apt/lists/*

COPY ./ytdl_ui /app/ytdl_ui

WORKDIR /app

RUN set -x \
    # install deps
    && pip install --no-cache-dir -r /app/ytdl_ui/requirements.txt \
    # Link to default config
    && ln -s /app/ytdl_ui/config/default.json /etc/ytdl_ui.json

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["python", "-m", "ytdl_ui"]