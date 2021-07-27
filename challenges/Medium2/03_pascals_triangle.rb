class Triangle
  attr_reader :number_of_rows

  def initialize(number_of_rows)
    @number_of_rows = number_of_rows
  end

  def populate_current_row(prev_row, current_row)
    if prev_row
      current_row << 1
      (1...prev_row.size).each do |idx|
        left = prev_row[idx - 1]
        right = prev_row[idx]
        current_row << (left + right)
      end
    end
    current_row << 1
  end

  def rows
    result = []
    (0...number_of_rows).each do |row_num|
      current_row = []
      prev_row = result[row_num - 1]
      populate_current_row(prev_row, current_row)
      result << current_row
    end
    result
  end
end
