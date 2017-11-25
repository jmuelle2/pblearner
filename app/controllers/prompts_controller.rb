class PromptsController < ApplicationController
  def index
    @prompts = Prompt.all

    render("prompts/index.html.erb")
  end

  def show
    @prompt = Prompt.find(params[:id])

    render("prompts/show.html.erb")
  end

  def new
    @prompt = Prompt.new

    render("prompts/new.html.erb")
  end

  def create
    @prompt = Prompt.new

    @prompt.content = params[:content]
    @prompt.instructor_id = params[:instructor_id]

    save_status = @prompt.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/prompts/new", "/create_prompt"
        redirect_to("/prompts")
      else
        redirect_back(:fallback_location => "/", :notice => "Prompt created successfully.")
      end
    else
      render("prompts/new.html.erb")
    end
  end

  def edit
    @prompt = Prompt.find(params[:id])

    render("prompts/edit.html.erb")
  end

  def update
    @prompt = Prompt.find(params[:id])

    @prompt.content = params[:content]
    @prompt.instructor_id = params[:instructor_id]

    save_status = @prompt.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/prompts/#{@prompt.id}/edit", "/update_prompt"
        redirect_to("/prompts/#{@prompt.id}", :notice => "Prompt updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Prompt updated successfully.")
      end
    else
      render("prompts/edit.html.erb")
    end
  end

  def destroy
    @prompt = Prompt.find(params[:id])

    @prompt.destroy

    if URI(request.referer).path == "/prompts/#{@prompt.id}"
      redirect_to("/", :notice => "Prompt deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Prompt deleted.")
    end
  end
end
