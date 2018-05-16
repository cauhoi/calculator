class CalculatorController < ApplicationController
  include ApplicationHelper
  def index
  end
  def solve
    string_input = params[:user_input]
    if !check_input(string_input)
      flash[:error] = "Input string is not valid, please make sure the string doesn't have letters, special characters or having extra signs"
      redirect_to calculator_index_path and return
    end


    @solution = calculate_str(string_input)
    @original_input = string_input
    respond_to do |format|
      # format.js {render js: "$('#solution').html('Solution: #{solution.to_s}')"}
      format.js {}
    end

  end

end
