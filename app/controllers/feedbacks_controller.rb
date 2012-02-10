class FeedbacksController < ApplicationController
 def new
    @feedback = Feedback.new

  end

  def create
    @feedback = Feedback.new(params[:feedback])

    if @feedback.valid?
	    if Messager.send_message(@feedback)
    	  flash[:notice] = 'Message sended'
    	else
          flash[:alert] = 'Feedback failed!'
        end        
    	render action:'new'
    else
    	flash[:alert] = 'Form is not valid'
    	render action:'new'
    end

   
  end
end
