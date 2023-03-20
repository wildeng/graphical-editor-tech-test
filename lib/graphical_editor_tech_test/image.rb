# frozen_string_literal: true
require 'matrix'

module GraphicalEditorTechTest
  # Class that creates an image
  class Image
    attr_reader :width, :height, :image_content

    def initialize(width, height)
      raise GraphicalEditorTechTest::InvalidData unless valid_data?(width, height)

      @width = width
      @height = height

      blank_image
    end

    def valid_data?(width, height)
      width.between?(1, 250) && height.between?(1, 250)
    end

    def blank_image
      @image_content = Matrix.build(@height, @width) { "O" }
    end

    def clear
      blank_image
    end

    def change_pixel(row, col, colour)
      @image_content[row, col] = colour
    end

    def vertical_segment(col, row1, row2, colour)
      raise GraphicalEditorTechTest::InvalidData if row1 >= row2

      @image_content.each_with_index do |_x, r, c|
        change_pixel(r, c, colour) if r.between?(row1, row2) && c == col
      end
    end

    def horizontal_segment(col1, col2, row, colour)
      raise GraphicalEditorTechTest::InvalidData if col1 >= col2

      @image_content.each_with_index do |_x, r, c|
        change_pixel(r, c, colour) if c.between?(col1, col2) && r == row
      end
    end

    def valid_point?(row, col)
      row.between?(1, @height) && col.between?(1, @width)
    end

    # implementing the flood fill algorithm
    def paint_region(row, col, target_colour, colour)
      return unless @image_content[row, col]
      return if @image_content[row, col] != target_colour
      return if @image_content[row, col] == colour

      change_pixel(row, col, colour)
      paint_region(row + 1, col, target_colour, colour)
      paint_region(row - 1, col, target_colour, colour)
      paint_region(row, col + 1, target_colour, colour)
      paint_region(row, col - 1, target_colour, colour)
    end

    def show
      @image_content.each_slice(@image_content.column_size) { |r| p r.join("") }
    end
  end
end
