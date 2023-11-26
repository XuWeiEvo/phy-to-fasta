#!/usr/bin/perl

use strict;
use warnings;

# 提示用户输入Phylip文件名
print "请输入Phylip文件名：";
my $input_file = <STDIN>;
chomp $input_file;

# 提示用户输入输出Fasta文件名
print "请输入输出Fasta文件名：";
my $output_file = <STDIN>;
chomp $output_file;

# 打开输入文件
open(my $input_fh, '<', $input_file) or die "无法打开文件 '$input_file'：$!";

# 读取Phylip文件的第一行（包含序列数和长度）
my $header = <$input_fh>;
chomp $header;
my ($num_sequences, $sequence_length) = split(/\s+/, $header);

# 打开输出文件
open(my $output_fh, '>', $output_file) or die "无法创建文件 '$output_file'：$!";

# 逐行读取Phylip文件并将其转换为Fasta格式写入输出文件
while (my $line = <$input_fh>) {
    chomp $line;
    my ($sequence_name, $sequence) = split(/\s+/, $line);
    print $output_fh ">$sequence_name\n$sequence\n";
}

# 关闭文件句柄
close($input_fh);
close($output_fh);

print "转换完成！Fasta文件已保存为 '$output_file'。\n";