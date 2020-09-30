GO = go

# decide to include debugging symbols or not here:
GO_FLAGS = -ldflags "-s -w"
# GO_FLAGS =

RM = /bin/rm -fv

BINARY_LINUX_AMD64 = gomf
BINARY_LINUX_I386 = gomf_i386
BINARY_WINDOWS_AMD64 = gomf.exe
BINARY_WINDOWS_I386 = gomf_i386.exe

BINARIES_ALL = $(BINARY_LINUX_AMD64) $(BINARY_LINUX_I386) $(BINARY_WINDOWS_AMD64) $(BINARY_WINDOWS_I386)

linux: linux64

windows: windows64

all: all_linux all_windows

all_linux: linux32 linux64

all_windows: windows64 windows32

linux64:
	GOOS=linux GOARCH=amd64 $(GO) build $(GO_FLAGS) -o $(BINARY_LINUX_AMD64)

linux32:
	GOOS=linux GOARCH=386 $(GO) build $(GO_FLAGS) -o $(BINARY_LINUX_I386)

windows64:
	GOOS=windows GOARCH=amd64 $(GO) build $(GO_FLAGS) -o $(BINARY_WINDOWS_AMD64)

windows32:
	GOOS=windows GOARCH=386 $(GO) build $(GO_FLAGS) -o $(BINARY_WINDOWS_I386)

test:
	$(GO) test -v

fmt:
	find . -type f -name \*.go -exec $(GO) fmt -x {} +

clean:
	$(RM) $(BINARIES_ALL)
