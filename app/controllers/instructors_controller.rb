class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.page(params[:page]).per(10)
  end

  def show
    @instructor = Instructor.find(params[:id])
  end
end
