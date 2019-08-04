=begin
  
Coding challenge for week 3: image blur

by Andrew Carlisle
  
=end

# An array representation of a black and white image consisting
#  of 1's and 0's.
class Image
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
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image