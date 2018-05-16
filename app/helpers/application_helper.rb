module ApplicationHelper
  SIGN = ["+","-","*","/"]
  def check_input(str)
    # string can't include letters or special characters
    if str.match(/[a-zA-Z&^!@#$%]+/)
      return false
    end
    num_arr,sign_arr = split_numers_and_signs_to_array(str)
    first_char = str.strip.chars[0]
    if SIGN.include?(first_char)
      return false if ["*","/"].include?(first_char)
      # numers length should equal to sign length
      if num_arr.length == sign_arr.length
        return true
      else
        return false
      end
    else
      #  if the string begins with a number then there should be more numbers than signs
      if num_arr.length == sign_arr.length + 1
        return true
      else
        return false
      end
    end

  end

  def split_numers_and_signs_to_array(str)
    sign_arr = []
    num_arr = []

    parsed_arr = str.split(%r{(\+|\-|\/|\*)})
    parsed_arr.compact!
    parsed_arr.delete("")
    parsed_arr.each do |x|
      if SIGN.include?(x)
        sign_arr << x
      else
        num_arr << x.to_i
      end
    end
    return num_arr,sign_arr
  end

  def calculate_str(str)
    div_arr = []
    multiply_arr = []
    total = 0
    num_arr,sign_arr = split_numers_and_signs_to_array(str)

    # get each number start from the end
    num_arr.length.times do
      current_num = num_arr.pop
      current_sign = (sign_arr.pop || "+")

      case current_sign
        when "+", "-"
          #  take current number multiply by product of all number in multiply_arr, if empty multiply by 1
          sub_sum = current_num * (multiply_arr.inject(&:*) || 1)
          # multiply all numbers in the div_array, if empty then divide by 1, else take the sub_sum divide that number
          sub_sum = sub_sum.fdiv(div_arr.inject(&:*)|| 1)

          if current_sign == "+"
            total+= sub_sum
          else
            total-= sub_sum
          end

          # reset the array
          multiply_arr = []
          div_arr = []

        when "*"
          multiply_arr << current_num

        when "/"
          div_arr << current_num
      end
    end


    return (total%1).zero? ? total.to_i : total.round(2)

  end
end
