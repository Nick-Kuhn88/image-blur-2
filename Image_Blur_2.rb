class Image 

  def initialize(image)
      @image = image  
  end 

  def find_one
    ones = []
    @image.each_with_index do |row, row_number|
    row.each_with_index do |item, item_number|
    if item == 1
      ones << [row_number, item_number]
        end 
      end 
    end 
    ones
  end

  def image_blur
    ones = find_one 
    @image.each_with_index do |row, row_number|
      row.each_with_index do |item, item_number|
        ones.each do |found_row_number, found_column_number|
          if row_number == found_row_number && found_column_number == item_number 
            #puts [row_number, found_row_number]
            @image[row_number][item_number - 1] = 1 unless item_number == 0
            @image[row_number][item_number + 1] = 1 unless item_number >= 3
            @image[row_number - 1][item_number] = 1 
            @image[row_number + 1][item_number] = 1
          end
        end
      end
    end 
  end

  def output_image
      @image.each do |x|
      puts x.join
      end 
  end 

  row1 = [0, 0, 0, 0]
  row2 = [0, 1, 0, 0]
  row3 = [0, 0, 0, 1]
  row4 = [0, 0, 0, 0]

  image = Image.new (
      [row1, row2, row3, row4]
  )
  image.image_blur
  image.output_image
end

