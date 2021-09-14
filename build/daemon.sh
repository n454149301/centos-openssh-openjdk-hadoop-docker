#! /bin/bash

while true
do
	sleep 5
	echo "hadoop daemon check once"

	ansible-playbook -b -v --scp-extra-args='-P10022' --ssh-extra-args='-p10022' /root/daemon.yml
	check_res=${?}
	if [ $check_res -ne 0 ]; then 
		exit 1
	fi

	/root/hadoop/sbin/start-dfs.sh
	/root/hadoop/sbin/start-yarn.sh
	/root/hadoop/bin/mapred --daemon start historyserver
	yes | /root/hadoop/bin/hdfs haadmin -transitionToActive nn1 --forcemanual
	/root/hadoop/bin/hdfs --daemon start httpfs

	echo "hadoop daemon sleep 1m"
	sleep 60
done
