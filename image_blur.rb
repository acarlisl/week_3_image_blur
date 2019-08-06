=begin
  
Coding challenge for week 3: image blur

by Andrew Carlisle
  
=end

# An array representation of a black and white image consisting
#  of 1's and 0's.
class Image
  attr_reader :image_array

  # Initializer takes a pre-constructed 2D array
  # The argument is assumed to be a 2D array with the following properies:
  #   * The array has uniform-length rows (all sub-arrays are the same length)
  #   * The array elements are all either 1 or 0
  # Defaults to a 10x10 array initialized to all 0's
  def initialize( initial_array = Array.new(10) {Array.new(10, 0)} )
    @image_array = initial_array
  end

  # Returns a 2D array with rows of uniform length and random values of
  #  1 or 0 in each element
  # * Accepts 2 arguments for # of rows and columns
  # * Accepts 1 argument for a square array of that many rows & columns
  # * By default creates a 10 x 10 array
  # Assumes both arguments are positive integers
  def self.random_image(rows = 10, columns = rows)
    random_array = Array.new(rows) {Array.new(columns)}

    random_array.each_index do |row|
      random_array[row].each_index do |column|
        random_array[row][column] = rand(2)
      end
    end

    return random_array
  end


  # Prints a grid representation of the image to the console
  def output_image
    @image_array.each_index do |row|
      @image_array[row].each_index do |column|
        print "#{@image_array[row][column]}"
      end
      puts
    end
  end

  # Returns a new Image where all values adjacent to a '1' in the original
  #  array are also 1
  def blur
    Image.new(1)
  end


  private

  # Returns true if the element at (row, column) in image_array has a 1
  #  at any other index orthogonally adjacent (up, right, left or down)
  # Raises an error if the passed arguments are not valid (if they are out)
  #  of bounds for image_array)
  def has_neighbor?(row, column)
    raise 'Checking for neighbor: index out of bounds'
      unless self.is_valid_index?(row, column)
  end

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
end




=begin
#### Used for testing in part 1 ####
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

puts image.image_array.inspect
=end