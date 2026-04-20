## Install docker container and show version
 docker run --rm -it amazon/aws-cli --version

 ## list s3 
 docker run --rm -it amazon/aws-cli s3 ls

 ## you need to connect with your credentials

docker run --rm -it -v ~/.aws:/root/.aws public.ecr.aws/aws-cli/aws-cli s3 ls

docker run --rm -it -v C:/Users/bhara/.aws:/root/.aws public.ecr.aws/aws-cli/aws-cli s3 ls

docker run --rm -v C:/Users/bhara/.aws:/root/.aws public.ecr.aws/aws-cli/aws-cli s3 ls

docker run --rm public.ecr.aws/aws-cli/aws-cli s3 ls

