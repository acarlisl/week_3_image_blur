=begin
  
Unit tests for the private method is_valid_index? in class Image

To test this class the method is reproduced here
  
=end

# Needed for testing
require "test/unit"

### Note: This test is designed to have the private methods copy / pasted
###  directly from the Image class
class TestCreateImage < Test::Unit::TestCase

  def setup
    @image_1_array = [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ]

    ###########################################################################
    ################## COPY / PASTE is_valid_index? HERE ######################
    ###########################################################################
    # Returns true if the 2D array index is within the boundaries of
    #  @image_array and false outherwise
    def is_valid_index?(row, column)
      # Check if the specified row is out of bounds
      if ( row < 0 ) || ( row >= @image_array.length )
        return false
      end

      # Check if the specified column is out of bounds
      if ( column < 0 ) || ( column >= @image_array[row].length )
        return false
      end

      return true
    end
    ###########################################################################
    ######################### END COPY/PASTE ##################################
    ###########################################################################

    ###########################################################################
    #################### COPY / PASTE has_neighbor? HERE ######################
    ###########################################################################
    # Returns true if the element at (row, column) in image_array has a 1
    #  at any other index orthogonally adjacent (up, right, left or down)
    # Raises an error if the passed arguments are not valid (if they are out)
    #  of bounds for image_array)
    def has_neighbor?(row, column)
      raise 'Checking for neighbor: index out of bounds' \
      unless self.is_valid_index?(row, column)
    end
    ###########################################################################
    ######################### END COPY/PASTE ##################################
    ###########################################################################
  end

  # Method tests
  def test_is_valid_index
    @image_array = Array.new(4) {Array.new(4)}
    assert( is_valid_index?(0, 0) )
    assert( is_valid_index?(3, 3) )
    assert( is_valid_index?(0, 3) )
    assert( is_valid_index?(3, 0) )
    assert( is_valid_index?(1, 2) )
    assert( is_valid_index?(0, 3) )
    assert( is_valid_index?(3, 0) )
    assert( is_valid_index?(2, 2) )

    assert( !(is_valid_index?(-1, 2)) )
    assert( !(is_valid_index?(0, 4)) )
    assert( !(is_valid_index?(-20, 0)) )
    assert( !(is_valid_index?(3, -4)) )
    assert( !(is_valid_index?(5, 2)) )
    assert( !(is_valid_index?(-2, -3)) )
    assert( !(is_valid_index?(4, 6)) )
    assert( !(is_valid_index?(-1, 4)) )
    assert( !(is_valid_index?(4, -1)) )

    @image_array = Array.new(2) {Array.new(2)}
    assert( is_valid_index?(0, 0) )
    assert( is_valid_index?(1, 0) )
    assert( is_valid_index?(0, 1) )
    assert( is_valid_index?(1, 1) )
    
    assert( !(is_valid_index?(-1, 2)) )
    assert( !(is_valid_index?(2, -1)) )
    assert( !(is_valid_index?(-1, -1)) )
    assert( !(is_valid_index?(2, 2)) )

    @image_array = Array.new(1) {Array.new(1)}
    assert( is_valid_index?(0, 0) )
    
    assert( !(is_valid_index?(-1, 0)) )
    assert( !(is_valid_index?(0, -1)) )
    assert( !(is_valid_index?(-1, -1)) )
    assert( !(is_valid_index?(1, 1)) )

    @image_array = Array.new(2) {Array.new(6)}
    assert( is_valid_index?(0, 5) )
    assert( is_valid_index?(1, 0) )
    assert( is_valid_index?(1, 5) )
    assert( is_valid_index?(0, 0) )
    assert( is_valid_index?(1, 3) )
    assert( is_valid_index?(0, 2) )
    
    assert( !(is_valid_index?(0, 6)) )
    assert( !(is_valid_index?(2, 0)) )
    assert( !(is_valid_index?(-1, 6)) )
    assert( !(is_valid_index?(1, -1)) )

    @image_array = Array.new
    assert( !(is_valid_index?(0, 0)) )
    assert( !(is_valid_index?(1, 0)) )
    assert( !(is_valid_index?(0, 2)) )
    assert( !(is_valid_index?(-1, -1)) )
  end

  def test_has_neighbor
    
  end
end