##
# This program uses recursion to find all the magic
# squares of a 3x3 square in java.
#
# @author  Cameron Teed
# @version 1.0
# @since   2021-05-11
# frozen_string_literal: true

def print_square(print_list)
  # This function converts the array into a 3 charecter string and prints it
  first_count = 0
  new_string = String.new
  # Runs for the length of the array
  while print_list.length.to_i != first_count
    # Adds the number onto the new string
    new_string = "#{new_string}#{print_list[first_count]} "
    if (new_string.size.to_i % 3).zero?
      # Prints the new string if its a factor of 3
      puts new_string
      new_string = String.new
    end
    first_count += 1
  end
  puts '*****'
end

def solve_square(number_list, index_list, index_num)
  first_count = 0
  # This loop itterates to fill out a square of numbers
  while number_list.length.to_i != first_count
    # Checking if a slot in the square has been occupied
    if (index_list[first_count]).zero?
      number_list[first_count] = index_num
      index_list[first_count] = 1

      # Checking if the index is less than nine
      if index_num < 9
        # Calling function again to continue creating square
        solve_square(number_list, index_list, index_num + 1)
      elsif is1_magic(number_list) == true
        print_square(number_list)
        # Printing out the square that was found
      end
      # Reseting part of the square to 0 so it can be filled again
      index_list[first_count] = 0
    end
    first_count += 1
  end
end

def is1_magic(possible_square)
  # This functions checks if the array is a magic sqaure
  magic_num = 15
  row_1 = possible_square[0] + possible_square[1] + possible_square[2]
  row_2 = possible_square[3] + possible_square[4] + possible_square[5]
  row_3 = possible_square[6] + possible_square[7] + possible_square[8]
  col_1 = possible_square[0] + possible_square[3] + possible_square[6]
  col_2 = possible_square[1] + possible_square[4] + possible_square[7]
  col_3 = possible_square[2] + possible_square[5] + possible_square[8]
  diag_1 = possible_square[0] + possible_square[4] + possible_square[8]
  diag_2 = possible_square[2] + possible_square[4] + possible_square[6]

  # Returns true or false depending if its magic or not
  if row_1 == magic_num && row_2 == magic_num && row_3 == magic_num && col_1 == magic_num && col_2 == magic_num &&
     col_3 == magic_num && diag_1 == magic_num && diag_2 == magic_num
    true
  else
    false
  end
end

# Initializing the array for the magic squares
first_list = Array[1, 2, 3, 4, 5, 6, 7, 8, 9]
second_list = Array[0, 0, 0, 0, 0, 0, 0, 0, 0]
# Prints the program
puts 'All Possible Magic Squares (3x3):'
puts '*****'

# Calls the function and prints done
solve_square(first_list, second_list, 1)
puts 'Done'
