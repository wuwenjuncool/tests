set -x

ip_arr=("192.168.202.104" "192.168.202.107" "192.168.202.110" "192.168.202.113" "192.168.202.116" "192.168.202.119")
thread_num=("16" "32" "64" "128" "256" "512" "1024")
test_log_path="."

for ip in ${ip_arr[@]}; do
        for threads in ${thread_num[@]}; do
                read_transactions_per_seconds=$(cat $test_log_path/${ip}"_"${threads}"_read.log"|grep "read/write requests:"|awk '{ print $4 }'|tr -cd "[0-9][.]")
                echo "${ip} $threads:read_transactions_per_seconds ${read_transactions_per_seconds}">> ${ip}_test_result.log
        done
        echo -e "\n">>${ip}_test_result.log
done


for ip in ${ip_arr[@]}; do
        for threads in ${thread_num[@]}; do
                write_transactions_per_seconds=$(cat $test_log_path/${ip}"_"${threads}"_write.log"|grep "read/write requests:"|awk '{ print $4 }'|tr -cd "[0-9][.]")
                echo "$ip $threads :write_transactions_per_seconds $write_transactions_per_seconds">> ${ip}_test_result.log
        done
        echo -e "\n" >>${ip}_test_result.log
done


for ip in ${ip_arr[@]}; do
        for threads in ${thread_num[@]}; do
                read_transactions_per_seconds=$(cat $test_log_path/${ip}"_"${threads}"_read.log"|grep "read/write requests:"|awk '{ print $4 }'|tr -cd "[0-9][.]")
                echo "${ip} $threads:read_requests_per_seconds ${read_transactions_per_seconds}">> ${ip}_test_result.log
        done
        echo -e "\n">>${ip}_test_result.log
done


for ip in ${ip_arr[@]}; do
        for threads in ${thread_num[@]}; do
                read_transactions_per_seconds=$(cat $test_log_path/${ip}"_"${threads}"_read.log"|grep "read/write requests:"|awk '{ print $4 }'|tr -cd "[0-9][.]")
                echo "${ip} $threads:write_requests_per_seconds ${read_transactions_per_seconds}">> ${ip}_test_result.log
        done
        echo -e "\n">>${ip}_${ip}_test_result.log
done

