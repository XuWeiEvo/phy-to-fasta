#!/usr/bin/perl

use strict;
use warnings;

# ��ʾ�û�����Phylip�ļ���
print "������Phylip�ļ�����";
my $input_file = <STDIN>;
chomp $input_file;

# ��ʾ�û��������Fasta�ļ���
print "���������Fasta�ļ�����";
my $output_file = <STDIN>;
chomp $output_file;

# �������ļ�
open(my $input_fh, '<', $input_file) or die "�޷����ļ� '$input_file'��$!";

# ��ȡPhylip�ļ��ĵ�һ�У������������ͳ��ȣ�
my $header = <$input_fh>;
chomp $header;
my ($num_sequences, $sequence_length) = split(/\s+/, $header);

# ������ļ�
open(my $output_fh, '>', $output_file) or die "�޷������ļ� '$output_file'��$!";

# ���ж�ȡPhylip�ļ�������ת��ΪFasta��ʽд������ļ�
while (my $line = <$input_fh>) {
    chomp $line;
    my ($sequence_name, $sequence) = split(/\s+/, $line);
    print $output_fh ">$sequence_name\n$sequence\n";
}

# �ر��ļ����
close($input_fh);
close($output_fh);

print "ת����ɣ�Fasta�ļ��ѱ���Ϊ '$output_file'��\n";