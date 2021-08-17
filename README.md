# tunsocks
OCI Image for [russdill/tunsocks](https://github.com/russdill/tunsocks)

## Usage
This image reads following environment variables:
| env           | required | description                          |
|---------------|----------|--------------------------------------|
| USER          | *        | VPN username                         |
| PASS          | *        | VPN password                         |
| URL           | *        | VPN url                              |
| OC_ARGS       |          | Additional arguments for openconnect |
| TUNSOCKS_ARGS |          | Additional arguments for tunsocks    |

To use this image, simply set those envs.
