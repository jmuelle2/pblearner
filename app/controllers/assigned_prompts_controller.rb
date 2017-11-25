class AssignedPromptsController < ApplicationController
  def index
    @assigned_prompts = AssignedPrompt.all

    render("assigned_prompts/index.html.erb")
  end

  def show
    @response = Response.new
    @assigned_prompt = AssignedPrompt.find(params[:id])

    render("assigned_prompts/show.html.erb")
  end

  def new
    @assigned_prompt = AssignedPrompt.new

    render("assigned_prompts/new.html.erb")
  end

  def create
    @assigned_prompt = AssignedPrompt.new

    @assigned_prompt.prompt_id = params[:prompt_id]
    @assigned_prompt.student_id = params[:student_id]

    save_status = @assigned_prompt.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assigned_prompts/new", "/create_assigned_prompt"
        redirect_to("/assigned_prompts")
      else
        redirect_back(:fallback_location => "/", :notice => "Assigned prompt created successfully.")
      end
    else
      render("assigned_prompts/new.html.erb")
    end
  end

  def edit
    @assigned_prompt = AssignedPrompt.find(params[:id])

    render("assigned_prompts/edit.html.erb")
  end

  def update
    @assigned_prompt = AssignedPrompt.find(params[:id])

    @assigned_prompt.prompt_id = params[:prompt_id]
    @assigned_prompt.student_id = params[:student_id]

    save_status = @assigned_prompt.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/assigned_prompts/#{@assigned_prompt.id}/edit", "/update_assigned_prompt"
        redirect_to("/assigned_prompts/#{@assigned_prompt.id}", :notice => "Assigned prompt updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Assigned prompt updated successfully.")
      end
    else
      render("assigned_prompts/edit.html.erb")
    end
  end

  def destroy
    @assigned_prompt = AssignedPrompt.find(params[:id])

    @assigned_prompt.destroy

    if URI(request.referer).path == "/assigned_prompts/#{@assigned_prompt.id}"
      redirect_to("/", :notice => "Assigned prompt deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Assigned prompt deleted.")
    end
  end
end
