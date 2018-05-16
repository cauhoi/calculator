require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper


  def setup
    @input_right_1 = "5*3+1+6/2+9*100"
    @input_right_2 = "5*3+1+6/85+9*100"
    @input_right_3 = "-5*3+1+6/2+9/5*100/7-4-7"
    @input_wrong_1 = "5*-7+9+15"
    @input_wrong_2 = "57+9--15"
    @input_wrong_3 = "a*7-b"
    @input_with_space = " 5  * 3 +1+6/  2+  9*  100  "
  end

  def test_wrong_input_should_fail_validation
    assert check_input(@input_right_1)
    assert check_input(@input_right_2)
    assert check_input(@input_right_3)
    assert check_input(@input_with_space)

    assert_not check_input(@input_wrong_1)
    assert_not check_input(@input_wrong_2)
    assert_not check_input(@input_wrong_3)
  end
  def test_string_should_split_into_array_of_numbers_and_signs
    str = "5+8/9-5*6"
    nums,signs = split_numers_and_signs_to_array(str)
    assert_equal [5,8,9,5,6], nums
    assert_equal ["+","/","-","*"],signs

  end

  def test_calculate_string_should_return_integer_when_there_is_no_remainder
    assert_equal 919, calculate_str(@input_right_1)
    assert_equal  5,calculate_str("5+6/3-2")
  end
  def test_calculate_string_should_return_rational_number_rounded_to_two_decimal_when_there_is_remainder
    assert_equal  916.07, calculate_str(@input_right_2)
    assert_equal  3.71,calculate_str(@input_right_3)
  end

  def test_adding_space_in_between_should_not_change_result
    input_no_space = "5*3+1+6/2+9*100"
    input_with_space = " 5  * 3 +1+6/  2+  9*  100  "
    assert_equal 919, calculate_str(input_no_space)
    assert_equal 919, calculate_str(input_with_space)

  end

end