[ $# -eq 0 ] && { echo "Usage: $0 [step] [ipaddress]"; exit 1; }

echo "Compiling..."
GOARCH=386 GOOS=linux go build $1.go
echo "Copying..."
scp $1 root@$2:/home/root/$1
echo "Running..."
ssh -t root@$2 ./$1
