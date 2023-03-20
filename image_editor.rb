#!/usr/bin/ruby

require_relative "lib/graphical_editor_tech_test"

class ImageEditor
  def run
    before_start
    start
    after_run
  end

  private

  def before_start
    puts "Image Editor Simulator"
    GraphicalEditorTechTest::Command.print_usage
  end

  def start
    loop do
      print ">"
      input = $stdin.gets.chomp
      break if input == "X"

      GraphicalEditorTechTest::Command.parse(input)
    end
  end

  def after_run
    puts "Exit"
  end
end

ImageEditor.new.run
