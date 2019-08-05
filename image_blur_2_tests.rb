=begin
  
Testing for week 3 coding challeneg "Image Blur: part 2"

Tests for the method "blur" for class Image

by Andrew Carlisle
  
=end

# Image class is located in image_blur.rb
require Dir.pwd + '/image_blur'
# Needed for testing
require "test/unit"


class TestCreateImage < Test::Unit::TestCase
  def setup
    # Image objects for testing
    @image_1 = Image.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ])
    @image_2 = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    @image_3 = Image.new([
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1]
    ])
    @image_4 = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ])
    @image_5 = Image.new([
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 1, 0]
    ])
    @image_6 = Image.new([
      [1, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 1]
    ])
    @image_7 = Image.new([
      [1, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1]
    ])
    @image_8 = Image.new([
      [0, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 0, 1, 0],
      [0, 0, 1, 0]
    ])
    @image_9 = Image.new([
      [1, 0],
      [0, 0]
    ])
    @image_10 = Image.new([
      [0, 0, 0, 0, 1, 0, 0, 0],
      [0, 1, 0, 0, 1, 0, 0, 0],
      [0, 0, 0, 0, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 1, 0],
      [0, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 1, 0, 0, 0]
    ])
    @image_11 = Image.new([
      [1, 0, 0, 0, 1, 0, 0, 0]
    ])
    @image_12 = Image.new([
      [1],
      [0],
      [0],
      [0],
      [0],
      [1],
      [0],
      [1]
    ])
    @image_13 = Image.new([
      [1]
    ])
    @image_14 = Image.new([
      [0]
    ])

    # Arrays used to confim output
    @image_1_array = [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ]
    @image_transformed_1 = [
      [0, 1, 0, 0],
      [1, 1, 1, 1],
      [0, 1, 1, 1],
      [0, 0, 0, 1]
    ]
    @image_transformed_2 = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]
    @image_transformed_3 = [
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1]
    ]
    @image_transformed_4 = [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0]
    ]
    @image_transformed_5 = [
      [1, 1, 1, 0],
      [0, 1, 0, 0],
      [0, 0, 1, 0],
      [0, 1, 1, 1]
    ]
    @image_transformed_6 = [
      [1, 1, 1, 1],
      [1, 0, 0, 1],
      [1, 0, 0, 1],
      [1, 1, 1, 1]
    ]
    @image_transformed_7 = [
      [1, 1, 0, 0],
      [1, 1, 0, 0],
      [1, 1, 1, 1],
      [0, 1, 1, 1]
    ]
    @image_transformed_8 = [
      [1, 1, 0, 0],
      [1, 1, 1, 0],
      [1, 1, 1, 1],
      [1, 1, 1, 1]
    ]
    @image_transformed_9 = [
      [1, 1],
      [1, 0]
    ]
    @image_transformed_10 = [
      [0, 1, 0, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 1, 1, 0, 0],
      [0, 1, 0, 1, 1, 1, 1, 0],
      [0, 1, 0, 0, 1, 1, 1, 1],
      [1, 1, 1, 0, 1, 0, 1, 0],
      [0, 1, 0, 1, 1, 1, 0, 0]
    ]
    @image_transformed_11 = [
      [1, 1, 0, 1, 1, 1, 0, 0]
    ]
    @image_transformed_12 = [
      [1],
      [1],
      [0],
      [0],
      [1],
      [1],
      [1],
      [1]
    ]
    @image_transformed_13 = [
      [1]
    ]
    @image_transformed_14 = [
      [0]
    ]
  end


  # A small test to make sure the reader is working as intended
  def test_reader
    assert_equal( @image_1_array, @image_1.image_array )
  end

  # Tests for the transform method
  def test_blur
    assert_equal( @image_1.blur.image_array, @image_transformed_1 )
  end
  
 
end