#!/usr/bin/ruby

class ImageEditor
  def run
    before_start
    start
    after_run
  end

  private

  def before_start
    puts "Image Editor Simulator"
    print_usage
  end

  def start
    loop do
      print ">"
      input = $stdin.gets.chomp
      break if input == "X"

      evaluate_command(input)
    end
  end

  def after_run
    puts "Exit"
  end

  def evaluate_command(input)
    print_usage if input == "?"
  end

  def print_usage
    usage.each { |_, val| puts val }
  end

  def usage
    {
      'I' => 'I M N       - Creates a new M x N image with all pixels coloured white (O).',
      'C' => 'C           - Clears the table, setting all pixels to white (O).',
      'L' => 'L X Y C     - Colours the pixel (X,Y) with colour C.',
      'V' => 'V X Y1 Y2 C - Draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).',
      'H' => 'H X1 X2 Y C - Draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).',
      'F' => %(F X Y C    - Fills the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R.
               Any other pixel which is the same colour as (X,Y) and
               shares a common side with any pixel in R also belongs to this region.),
      'S' => 'S           - Shows the contents of the current image',
      'X' => 'X           - Terminates the session',
      '?' => '?           - Shows the command list'
    }
  end
end

ImageEditor.new.run
