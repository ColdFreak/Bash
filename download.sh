#!/bin/bash

# 其中songs文件里是一行一个youtube连接
# cat while, 用来读一行，处理一行
cat songs | \
while read LINK
do
	
# 下载网页，重命名，为了找文件名
	wget -O tmp.html "$LINK"
# 找到要下载的文件名
	RAWNAME=`sed  -n -e 's/<meta property="og:title" content="\(.*\)">/\1/p' tmp.html`
# 去掉前后的空格
	NAME=`echo "$RAWNAME" | sed 's/^ *\(.*\) *$/\1/g'`
	
# 确定放音乐的文夹没有下载这个文件
	if [ -e "/home/wzj/Music/${NAME}.mp3" ]
	then
		continue
	fi
	youtube-dl -o "/home/wzj/Music/${NAME}.mp3" "$LINK"
	rm tmp.html
done


