/sbin/start-master.sh

bin/spark-class org.apache.spark.deploy.worker.Worker spark://localhost.localdomain:7077 -i 127.0.0.1  -c 1 -m 512M
