require 'colorize'
require "inputs/version"

module Inputs
  def self.yn(question)
    begin
      output question + " [y/n]"
      input = _input_evaluator.call
      input = input.chomp
    end until %w(y n).include?(input.chomp
    input == 'y'
  end

  def self.text(question)
    output question
    _input_evaluator.call.chomp
  end

  def self.multiple_text(question)
    output question + " (Comma separated)"
    texts = _input_evaluator.call
    texts = texts.chomp.split(',').map(&:strip)
    output "Okay, got #{texts.count} items."
    texts
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
end
