##  install local stack 

install docker for windows
docker --version
docker ps
docker run -d -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack

## Test
 aws s3 ls --endpoint-url http://localhost:4566

 ## create some aws mock s3 bucket
 aws s3 mb s3://amazon.com --endpoint-url http://localhost:4566

 ## set and environmet variable just for S3
export AWS_ENDPOINT_URL_S3=http://localhost:4566
