#!/bin/bash
# 用在线金山词霸和正则表达式写的一个命令行字典
# ./d memory 则是查memory的读音和意思
wget -q http://www.iciba.com/$1 
cat $1 | col -b | sed 's/[ \t]*//g' > tmp
sed -n 's/<strong>\[<\/strong><stronglang="EN-US"xml:lang="EN-US">\(.*\)<\/strong><strong>\]<\/strong>/\1/p' tmp
# 第七行的第二个sed的意思是找到<label>这一行之后，进而继续匹配
# 然后这次匹配是用s# # # 的形式， 把<label> 和</label>都删掉
sed -nr '/<spanclass="label_list"/,/<\/span>/p' tmp | sed -nr '/<label>/{s#<[/]?label>##g;p}'
rm $1 tmp
