HOST="34.255.178.43"
USER="ec2-user"
KEY="Senesero.pem"

ssh -i $KEY $USER@$HOST \
    "sudo yum install docker -y && sudo service docker start \
    && sudo docker run -d -p 80:8888 senesero/labcloud"