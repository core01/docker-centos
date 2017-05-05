FROM centos:latest

MAINTAINER Roman Sadoyan <ra@sadoyan.ru>

ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;


RUN \
 	yum update -y && \
 	yum install -y epel-release net-tools && rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
	yum-config-manager --enable remi,remi-php70 && yum -y upgrade && \
	yum -y --nogpgcheck  install git wget tar bzip2 unzip zip ssh yum-utils php php-gd php-intl php-tidy php-pdo \
   php-cli php-xml php-mysql php-mbstring php-bcmath php-pecl-imagick php-pecl-zip php-fpm php-mcrypt \
	php-mysql php-mysqlnd nginx nginx vim wget bash-completion composer && \
	yum upgrade -y && systemctl enable php-fpm nginx

RUN useradd -u 1000 core01

USER core01

CMD ["/bin/bash"]
