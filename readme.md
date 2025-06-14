## GEX In-Terminal Gaia Explorer

GEX is a real time in-terminal explorer for Cosmos SDK blockchains. See the [Check out your Cosmos SDK blockchain in a terminal-based block explorer](https://blog.cosmos.network/gaia-explorer-in-terminal-f37a4ea52e3c) blog post to learn more about GEX.

The GEX explorer displays blocks, transactions, validator, network status, and more information. Use the GEX block explorer to see the status of peers, connection, version, and other useful information to have a quick peek into your own node. GEX works with Starport.

## Install GEX

The GEX installation requires Go. If you don't already have Go installed, see https://golang.org/dl. Download the binary release that is suitable for your system and follow the installation instructions.

To install the GEX binary:

```sh
go install github.com/cosmos/gex@latest
```

## Deployment & Usage with Docker

You can run GEX in a Docker container using the provided `Dockerfile` and `docker-compose.yml`.

### 1. Build and Run with Docker Compose

```sh
docker-compose up --build
```

This will build the Docker image and start the GEX explorer, connecting by default to the remote RPC service at `https://devnet-rpc.aiw3.io:443` with SSL enabled.

- The terminal UI will appear in your shell.
- Press `q` or `esc` to quit the explorer.

### 2. Customizing the RPC Endpoint

To connect to a different node, edit the `command` section in `docker-compose.yml`:

```yaml
command: ["/app/gex", "-h", "your-node-host", "-p", "your-node-port", "-s"]
```
- Remove the `-s` flag if you do not want to use SSL.

### 3. Run with Docker Only (Optional)

You can also build and run the container manually:

```sh
docker build -t cosmos-gex .
docker run -it --rm -e TERM=xterm-256color cosmos-gex /app/gex -h devnet-rpc.aiw3.io -p 443 -s
docker exec -it gex /app/gex -h devnet-rpc.aiw3.io -p 443 -s
```

## Run GEX

To launch a GEX explorer in your terminal window, type:

```sh
gex
```

and hit enter.

## Optional Host

Configure an optional host, instead of using the default RPC host `localhost`

```sh
gex -h 192.168.0.1
```

## Optional Port

Configure an optional port, instead of using the default RPC port `26657`

```sh
gex -p 27657
```

## Optional Secure Transport
Configure connection to use SSL for HTTP and websockets requests
```sh
gex -s
```

## Print help
```sh
gex --help
Usage of gex:
  -h string
               host to connect (default "localhost")
  -p int
               port to connect (default 26657)
  -s boolean   
               use SSL for connection
```

## Preview

![Terminal Screenshot](./screenshot.png "Screenshot Application")

## Run In Development

To manually run GEX, clone the `github.com/cosmos/gex` repository and then cd into the `gex` directory. Then to run GEX manually, type this command in a terminal window:

`go run main.go`

## Contribute

See [CONTRIBUTING.md](./CONTRIBUTING.md) to learn about how to contribute and how the code is structured.

Thanks for contributing!
