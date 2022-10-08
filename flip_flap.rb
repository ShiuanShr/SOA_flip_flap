# frozen_string_literal: true

require_relative 'tsv_buddy'
require_relative 'yaml_buddy'

# Converts tabular data between storage formats
class FlipFlap
  # Do NOT create an initialize method
  include TsvBuddy # Get the method in this module # Class 用include 從module繼承method
  include YamlBuddy # Get the method in this module
  attr_reader :data

  def self.input_formats
    method_names = instance_methods.map(&:to_s) # what's f?
    outputs = method_names.select { |method| method.match(/^take_/) } # 根據block的條件去篩選陣列裡面的元素到一個新的陣列
    outputs ? outputs.map { |method| method[5..] } : [] # content從第6欄位開始
  end
end
