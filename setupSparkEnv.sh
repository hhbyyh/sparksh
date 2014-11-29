mkdir install
cd install

echo "Downloading JDK"

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz" -O jdk-8u25-linux-x64.tar.gz > /dev/null

tar zxvf jdk-8u25-linux-x64.tar.gz > /dev/null

mv jdk1.8.0_25 /usr/share/ -f

echo "Setting up env. variable JAVA_HOME..."

cat > /etc/profile.d/java-home.sh << "EOF"
export JAVA_HOME="/usr/share/jdk1.8.0_25"
export PATH="$JAVA_HOME/bin:$PATH"
EOF
chmod 777 /etc/profile.d/java-home.sh
source /etc/profile.d/java-home.sh

echo "Downloading scala..."

wget -c http://www.scala-lang.org/files/archive/scala-2.10.4.tgz > /dev/null
tar zxvf scala-2.10.4.tgz -C /usr/share/ > /dev/null

echo "export SCALA_HOME=/usr/share/scala-2.10.4" > /etc/profile.d/scala.sh
echo "export PATH=\$SCALA_HOME/bin:\$PATH" >> /etc/profile.d/scala.sh

chmod 777 /etc/profile.d/scala.sh
. /etc/profile.d/scala.sh

echo "Downloading spark and source code..."

mkdir /home/admin/spark
cd /home/admin/spark

wget http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0-bin-hadoop1.tgz > /dev/null
tar zxvf spark-1.1.0-bin-hadoop1.tgz

cd ..
mkdir workspace 
cd workspace
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0.tgz > /dev/null
tar zxvf spark-1.1.0.tgz > /dev/null

echo "Downloading idea intellij..."
cd ..
mkdir programs
cd programs
wget http://download.jetbrains.com/idea/ideaIC-14.0.1.tar.gz > /dev/null
tar zxvf ideaIC-14.0.1.tar.gz

echo "install git..."
yum install -y git > /dev/null

wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.13.0/sbt.rpm
yum localinstall -y sbt.rpm 
