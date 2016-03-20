require 'colorize'
require "inputs/version"

module Inputs
  def self.yn(question)
    begin
      output question + " [y/n]"
      input = gets
      input = input.chomp
    end until %(y n).include?(input.chomp)

    case input
    when 'y'
      true
    when 'n'
      false
    end
  end

  def self.name(question)
    output question
    name = gets
    name = name.chomp
    output name.green
    name
  end

  def self.names(question)
    output question + " (Comma separated)"
    name = gets
    name = name.chomp.split(',').map(&:strip)
    output name.join(' & ').green
    name
  end

  def self.output(txt)
    puts txt.green
  end
end
