#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'flip_flap' # 讀取flip_flap檔案

usage = 'Usage:  tsv_to_yml [TSV_file] [YML_file]\n'
raise ArgumentError, usage if ARGV.count.zero?

tsv_filename = ARGV[0]
yml_filename = ARGV[1]

tsv = File.read(tsv_filename)
print tsv
# 規律是 head1\thead2\t...head6\t\...
flipper = FlipFlap.new
# Flipper 為FlipFlap Class的實例，具備self.input_formats method，以及從module *_buddy.rb module模組中取得的各兩種method

flipper.take_tsv(tsv) # return @data of take_tsv

File.write(yml_filename, flipper.to_yaml)
