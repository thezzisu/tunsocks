# tunsocks
OCI Image for [russdill/tunsocks](https://github.com/russdill/tunsocks)

## Usage
This image reads following environment variables:
| env           | required | description                          |
|---------------|----------|--------------------------------------|
| USER          | \*       | VPN username                         |
| PASS          | \*       | VPN password                         |
| URL           | \*       | VPN url                              |
| OC_ARGS       |          | Additional arguments for openconnect |
| TUNSOCKS_ARGS |          | Additional arguments for tunsocks    |

To use this image, simply set those envs.

## Examples

### PKU VPN
Content of pku.env:
```
USER=Your student ID
PASS=Your password
URL=vpn.pku.edu.cn
OC_ARGS=--protocol=pulse
TUNSOCKS_ARGS=-D 0.0.0.0:1080 -H 0.0.0.0:8080
```
Command:
```sh
podman run --name tunsocks --env-file=pku.env -p 11080:1080 -p 18080:8080 ghcr.io/thezzisu/tunsocks:latest
```
Access local port 11080 for socks5 proxy and 18080 for http.