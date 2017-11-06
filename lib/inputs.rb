require 'colorize'
require "inputs/version"

module Inputs
  def self.yn(question)
    begin
      output question + " [y/n]"
      input = _input_evaluator.call
      input = input.chomp
    end until %w(y n).include?(input.chomp)

    case input
    when 'y'
      true
    when 'n'
      false
    end
  end

  # Outputs a question and returns an input string. If no string is typed it returns empty string ("")
  def self.name(question)
    output question
    name = _input_evaluator.call
    name = name.chomp
    output name.green
    name
  end

  # Outputs a question and returns an input string. If no string is typed it returns nil
  def self.name!(question)
    output question
    name = _input_evaluator.call
    name = name.chomp
    if name != ''
      output name.green
      name
    end
  end

  # Multiline input, exit via CTRL+D
  def self.text(question)
    output question
    txt = _multi_line_input_evaluator.call
    output txt.green
    txt
  end

  def self.names(question)
    output question + " (Comma separated)"
    names = _input_evaluator.call
    names = names.chomp.split(',').map(&:strip)
    output names.join(' & ').green
    names
  end

  def self.pick(options, question: "Please choose:", option_output_eval: ->(key, option) { "  Press #{key} for \"#{option}\"" })
    option_map = options
      .map(&:to_s)
      .uniq
      .map
      .with_index { |x, i| [i+1, x] }
      .to_h

    begin
      output question

      option_map.each do |key, option|
        output option_output_eval.call(key, option)
      end
      input = _input_evaluator.call
      input = input.chomp.to_i
    end until option_map.keys.include?(input)

    option_map.fetch(input)
  end

  def self.output(txt)
    puts txt.green
  end

  def self._input_evaluator=(evaluator)
    @_input_evaluator = evaluator
  end

  def self._input_evaluator
    @_input_evaluator ||= ->{ STDIN.gets }
  end

  def self._multi_line_input_evaluator=(evaluator)
    @_multi_line_input_evaluator = evaluator
  end

  def self._multi_line_input_evaluator
    @_multi_line_input_evaluator ||= ->(){ txt = ''; STDIN.each_line {|l| txt = txt + l }; txt }
  end
end
