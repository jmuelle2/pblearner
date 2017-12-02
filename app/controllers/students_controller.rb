class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @students = @q.result(:distinct => true).includes(:assigned_prompts).page(params[:page]).per(10)

    render("students/index.html.erb")
  end

  def show
    @assigned_prompt = AssignedPrompt.new
    @student = Student.find(params[:id])

    render("students/show.html.erb")
  end

  def new
    @student = Student.new

    render("students/new.html.erb")
  end

  def create
    @student = Student.new

    @student.name = params[:name]
    @student.email = params[:email]

    save_status = @student.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/students/new", "/create_student"
        redirect_to("/students")
      else
        redirect_back(:fallback_location => "/", :notice => "Student created successfully.")
      end
    else
      render("students/new.html.erb")
    end
  end

  def edit
    @student = Student.find(params[:id])

    render("students/edit.html.erb")
  end

  def update
    @student = Student.find(params[:id])

    @student.name = params[:name]
    @student.email = params[:email]

    save_status = @student.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/students/#{@student.id}/edit", "/update_student"
        redirect_to("/students/#{@student.id}", :notice => "Student updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Student updated successfully.")
      end
    else
      render("students/edit.html.erb")
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy

    if URI(request.referer).path == "/students/#{@student.id}"
      redirect_to("/", :notice => "Student deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Student deleted.")
    end
  end
end
