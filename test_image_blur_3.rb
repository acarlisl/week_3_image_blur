=begin
  
Testing for week 3 coding challeneg "Image Blur: part 3"

Tests for the method "blur(distance)" for class Image

by Andrew Carlisle
  
=end

# Image class is located in image_blur.rb
require Dir.pwd + '/image_blur'
# Needed for testing
require "test/unit"


class TestCreateImage < Test::Unit::TestCase

  def setup
    # Image objects for testing
    @image_1_0 = Image.new([
      [0]
    ])
    @image_1_1 = Image.new([
      [1]
    ])
    @image_2_0 = Image.new([
      [0, 0],
      [0, 0]
    ])
    @image_2_1 = Image.new([
      [1, 1],
      [1, 1]
    ])
    @image_2 = Image.new([
      [1, 0],
      [0, 0]
    ])
    @image_5_0 = Image.new([
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ])
    @image_5_1 = Image.new([
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1]
    ])
    @image_5 = Image.new([
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ])
    @image_5_a = Image.new([
      [0, 0, 0, 0, 0],
      [1, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0]
    ])
    @image_12x9_0 = Image.new([
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0]
    ])
    @image_12x9_1 = Image.new([
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1]
    ])
    @image_12x9_a = Image.new([
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1]
    ])
    @image_2x7_a = Image.new([
      [1, 0, 0, 0, 1, 0, 1],
      [0, 0, 0, 1, 0, 0, 0]
    ])
    @image_13x1_a = Image.new([
      [0],
      [0],
      [0],
      [1],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [0],
      [1],
      [0],
    ])

    # Blurred image arrays
    @image_1_0_blurred = [
      [0]
    ]
    @image_1_1_blurred = [
      [1]
    ]
    @image_2_0_blurred = [
      [0, 0],
      [0, 0]
    ]
    @image_2_1_blurred = [
      [1, 1],
      [1, 1]
    ]
    @image_2_blurred_1 = [
      [1, 1],
      [1, 0]
    ]
    @image_2_blurred_2 = [
      [1, 1],
      [1, 1]
    ]
    @image_5_0_blurred = [
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0]
    ]
    @image_5_1_blurred = [
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1]
    ]
    @image_5_blurred_1 = [
      [0, 0, 0, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0]
    ]
    @image_5_blurred_2 = [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 1, 0, 0]
    ]
    @image_5_blurred_3 = [
      [0, 1, 1, 1, 0],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [0, 1, 1, 1, 0]
    ]
    @image_5_a_blurred_1 = [
      [1, 0, 0, 0, 0],
      [1, 1, 0, 0, 0],
      [1, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
      [0, 0, 1, 0, 0]
    ]
    @image_5_a_blurred_2 = [
      [1, 1, 0, 0, 0],
      [1, 1, 1, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 1, 1, 1, 0]
    ]
    @image_5_a_blurred_3 = [
      [1, 1, 1, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1]
    ]
    @image_5_a_blurred_4 = [
      [1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1]
    ]
    @image_12x9_a_blurred_1 = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1],
      [0, 0, 0, 0, 0, 0, 0, 1, 1]
    ]
    @image_12x9_a_blurred_2 = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1],
      [0, 0, 0, 0, 0, 0, 0, 1, 1],
      [0, 0, 0, 0, 0, 0, 1, 1, 1]
    ]
    @image_12x9_a_blurred_3 = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1],
      [0, 0, 0, 0, 0, 0, 0, 1, 1],
      [0, 0, 0, 0, 0, 0, 1, 1, 1],
      [0, 0, 0, 0, 0, 1, 1, 1, 1]
    ]
    @image_12x9_a_blurred_4 = [
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1, 1, 1, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 1],
      [0, 0, 0, 1, 0, 0, 0, 1, 1],
      [0, 0, 0, 0, 0, 0, 1, 1, 1],
      [0, 0, 0, 0, 0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1, 1, 1, 1, 1]
    ]
    @image_12x9_a_blurred_5 = [
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1, 1, 1, 0, 1],
      [0, 1, 1, 1, 1, 1, 0, 1, 1],
      [0, 0, 1, 1, 1, 0, 1, 1, 1],
      [0, 0, 0, 1, 0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1, 1, 1, 1, 1],
      [0, 0, 0, 1, 1, 1, 1, 1, 1]
    ]
    @image_12x9_a_blurred_6 = [
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [0, 1, 1, 1, 1, 1, 1, 1, 1],
      [0, 0, 1, 1, 1, 1, 1, 1, 1],
      [0, 0, 0, 1, 1, 1, 1, 1, 1],
      [0, 0, 1, 1, 1, 1, 1, 1, 1]
    ]
    @image_12x9_a_blurred_7 = [
      [1, 1, 1, 1, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [0, 1, 1, 1, 1, 1, 1, 1, 1],
      [0, 0, 1, 1, 1, 1, 1, 1, 1],
      [0, 1, 1, 1, 1, 1, 1, 1, 1]
    ]
    @image_12x9_a_blurred_8 = [
      [1, 1, 1, 1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [0, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]
    @image_2x7_a_blurred_1 = [
      [1, 1, 0, 1, 1, 1, 1],
      [1, 0, 1, 1, 1, 0, 1]
    ]
    @image_2x7_a_blurred_2 = [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1]
    ]
    @image_13x1_a_blurred_1 = [
      [0],
      [0],
      [1],
      [1],
      [1],
      [0],
      [0],
      [0],
      [0],
      [0],
      [1],
      [1],
      [1],
    ]
    @image_13x1_a_blurred_2 = [
      [0],
      [1],
      [1],
      [1],
      [1],
      [1],
      [0],
      [0],
      [0],
      [1],
      [1],
      [1],
      [1],
    ]
    @image_13x1_a_blurred_3 = [
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [0],
      [1],
      [1],
      [1],
      [1],
      [1],
    ]
    @image_13x1_a_blurred_3 = [
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
      [1],
    ]
  end

  def test_blur_distance
    # 1x1 array
    assert_equal( @image_1_0.blur(0).image_array, @image_1_0_blurred )
    assert_equal( @image_1_0.blur(1).image_array, @image_1_0_blurred )
    assert_equal( @image_1_0.blur(2).image_array, @image_1_0_blurred )
    assert_equal( @image_1_0.blur(7).image_array, @image_1_0_blurred )

    assert_equal( @image_1_1.blur(0).image_array, @image_1_1_blurred )
    assert_equal( @image_1_1.blur(1).image_array, @image_1_1_blurred )
    assert_equal( @image_1_1.blur(3).image_array, @image_1_1_blurred )
    assert_equal( @image_1_1.blur(10).image_array, @image_1_1_blurred )

    # 2x2 array
    assert_equal( @image_2_0.blur(0).image_array, @image_2_0_blurred )
    assert_equal( @image_2_0.blur(1).image_array, @image_2_0_blurred )
    assert_equal( @image_2_0.blur(2).image_array, @image_2_0_blurred )
    assert_equal( @image_2_0.blur(7).image_array, @image_2_0_blurred )

    assert_equal( @image_2_1.blur(0).image_array, @image_2_1_blurred )
    assert_equal( @image_2_1.blur(1).image_array, @image_2_1_blurred )
    assert_equal( @image_2_1.blur(3).image_array, @image_2_1_blurred )
    assert_equal( @image_2_1.blur(10).image_array, @image_2_1_blurred )

    assert_equal( @image_2.blur(0).image_array, @image_2.image_array )
    assert_equal( @image_2.blur(1).image_array, @image_2_blurred_1 )
    assert_equal( @image_2.blur(2).image_array, @image_2_blurred_2 )
    assert_equal( @image_2.blur(3).image_array, @image_2_blurred_2 )
    assert_equal( @image_2.blur(8).image_array, @image_2_blurred_2 )

    # 5x5 array
    assert_equal( @image_5_0.blur(0).image_array, @image_5_0_blurred )
    assert_equal( @image_5_0.blur(1).image_array, @image_5_0_blurred )
    assert_equal( @image_5_0.blur(2).image_array, @image_5_0_blurred )
    assert_equal( @image_5_0.blur(5).image_array, @image_5_0_blurred )
    assert_equal( @image_5_0.blur(7).image_array, @image_5_0_blurred )

    assert_equal( @image_5_1.blur(0).image_array, @image_5_1_blurred )
    assert_equal( @image_5_1.blur(1).image_array, @image_5_1_blurred )
    assert_equal( @image_5_1.blur(3).image_array, @image_5_1_blurred )
    assert_equal( @image_5_1.blur(10).image_array, @image_5_1_blurred )

    assert_equal( @image_5.blur(0).image_array, @image_5.image_array )
    assert_equal( @image_5.blur(1).image_array, @image_5_blurred_1 )
    assert_equal( @image_5.blur(2).image_array, @image_5_blurred_2 )
    assert_equal( @image_5.blur(3).image_array, @image_5_blurred_3 )
    assert_equal( @image_5.blur(4).image_array, @image_5_1_blurred )
    assert_equal( @image_5.blur(7).image_array, @image_5_1_blurred )
    assert_equal( @image_5.blur(20).image_array, @image_5_1_blurred )
    
    assert_equal( @image_5_a.blur(0).image_array, @image_5_a.image_array )
    assert_equal( @image_5_a.blur(1).image_array, @image_5_a_blurred_1 )
    assert_equal( @image_5_a.blur(2).image_array, @image_5_a_blurred_2 )
    assert_equal( @image_5_a.blur(3).image_array, @image_5_a_blurred_3 )
    assert_equal( @image_5_a.blur(4).image_array, @image_5_a_blurred_4 )
    assert_equal( @image_5_a.blur(5).image_array, @image_5_1_blurred )
    assert_equal( @image_5_a.blur(7).image_array, @image_5_1_blurred )
    
    # 12x9 array
    assert_equal( @image_12x9_0.blur(0).image_array,
      @image_12x9_0.image_array )
    assert_equal( @image_12x9_0.blur(1).image_array,
      @image_12x9_0.image_array )
    assert_equal( @image_12x9_0.blur(2).image_array,
      @image_12x9_0.image_array )
    assert_equal( @image_12x9_0.blur(5).image_array,
      @image_12x9_0.image_array )
    assert_equal( @image_12x9_0.blur(7).image_array,
      @image_12x9_0.image_array )
    assert_equal( @image_12x9_0.blur(80).image_array,
      @image_12x9_0.image_array )

    assert_equal( @image_12x9_1.blur(0).image_array,
      @image_12x9_1.image_array )
    assert_equal( @image_12x9_1.blur(1).image_array,
      @image_12x9_1.image_array )
    assert_equal( @image_12x9_1.blur(3).image_array,
      @image_12x9_1.image_array )
    assert_equal( @image_12x9_1.blur(10).image_array,
      @image_12x9_1.image_array )
    assert_equal( @image_12x9_1.blur(27).image_array,
      @image_12x9_1.image_array )

    assert_equal( @image_12x9_a.blur(0).image_array,
      @image_12x9_a.image_array )
    assert_equal( @image_12x9_a.blur(1).image_array,
      @image_12x9_a_blurred_1 )
    assert_equal( @image_12x9_a.blur(2).image_array,
      @image_12x9_a_blurred_2 )
    assert_equal( @image_12x9_a.blur(3).image_array,
      @image_12x9_a_blurred_3 )
    assert_equal( @image_12x9_a.blur(4).image_array,
      @image_12x9_a_blurred_4 )
    assert_equal( @image_12x9_a.blur(5).image_array,
      @image_12x9_a_blurred_5 )
    assert_equal( @image_12x9_a.blur(6).image_array,
      @image_12x9_a_blurred_6 )
    assert_equal( @image_12x9_a.blur(7).image_array,
      @image_12x9_a_blurred_7 )
    assert_equal( @image_12x9_a.blur(8).image_array,
      @image_12x9_a_blurred_8 )
    assert_equal( @image_12x9_a.blur(9).image_array,
      @image_12x9_1.image_array )

    # 2x7 array
    assert_equal( @image_2x7_a.blur(1).image_array, @image_2x7_a_blurred_1 )
    assert_equal( @image_2x7_a.blur(2).image_array, @image_2x7_a_blurred_2 )
    assert_equal( @image_2x7_a.blur(5).image_array, @image_2x7_a_blurred_2 )

    # 13x1 array
    assert_equal( @image_13x1_a.blur(1).image_array, @image_13x1_a_blurred_1 )
    assert_equal( @image_13x1_a.blur(2).image_array, @image_13x1_a_blurred_2 )
    assert_equal( @image_13x1_a.blur(3).image_array, @image_13x1_a_blurred_3 )
    assert_equal( @image_13x1_a.blur(4).image_array, @image_13x1_a_blurred_3 )
  end
end