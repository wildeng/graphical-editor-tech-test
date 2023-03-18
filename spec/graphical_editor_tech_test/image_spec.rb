# # frozen_string_literal: true

require "spec_helper"

RSpec.describe GraphicalEditorTechTest::Image do
  context "when initialize" do
    it "raise an error if invalid data" do
      expect { GraphicalEditorTechTest::Image.new(0, 251) }.to raise_error(
        GraphicalEditorTechTest::InvalidData
      )
      expect { GraphicalEditorTechTest::Image.new(0, 250) }.to raise_error(
        GraphicalEditorTechTest::InvalidData
      )
      expect { GraphicalEditorTechTest::Image.new(251, -1) }.to raise_error(
        GraphicalEditorTechTest::InvalidData
      )
      expect { GraphicalEditorTechTest::Image.new(250, 0) }.to raise_error(
        GraphicalEditorTechTest::InvalidData
      )
    end

    it "creates a new object with valid data" do
      image = GraphicalEditorTechTest::Image.new(250, 250)
      expect(image.width).to eq(250)
      expect(image.height).to eq(250)
      image = GraphicalEditorTechTest::Image.new(1, 250)
      expect(image.width).to eq(1)
      expect(image.height).to eq(250)
      image = GraphicalEditorTechTest::Image.new(250, 1)
      expect(image.width).to eq(250)
      expect(image.height).to eq(1)
    end

    it "creates a blank image" do
      image = GraphicalEditorTechTest::Image.new(10, 20)
      expect(image.blank_image).to be_a Matrix
    end
  end
end
