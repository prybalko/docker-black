# Docker image for `black`
Alpine-based version of Python Black for reproducible usage in CI

[![Build Status](https://github.com/prybalko/docker-black/workflows/Publish%20Docker/badge.svg)](https://travis-ci.com/prybalko/docker-black)
[![Tag](https://img.shields.io/github/tag/prybalko/docker-black.svg)](https://github.com/prybalko/docker-black/releases)
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)


Tiny Alpine-based multistage-build dockerized version of [Black](https://github.com/python/black)<sup>[1]</sup>.

<sup>[1] Official project: https://github.com/python/black</sup>


## Docker mounts

The working directory inside the Docker container is **`/data/`** and should be mounted locally to
the root of your project.


## Usage

```bash
# Linux, Mac, Windows (Powershell)
docker run --rm -v $(pwd):/data prybalko/black main.py

# Windows (cmd)
docker run --rm -v %cd%:/data prybalko/black main.py
```

## License

**[MIT License](LICENSE)**

Copyright (c) 2019 [prybalko](https://github.com/prybalko)
