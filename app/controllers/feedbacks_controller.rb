# encoding: UTF-8
class FeedbacksController < ApplicationController
 before_filter :find_article
 skip_before_filter :authenticate_user!
 def new
    @feedback = Feedback.new

  end

  def create
    @feedback = Feedback.new(params[:feedback])
    flash[:notice]=nil
    
    if (@feedback.valid? and human?)
	    if (Messager.to_admin(@feedback).deliver and Messager.to_guest(@feedback).deliver)
    	  flash[:notice] = 'Письмо успешно отправлено'
    	else
          flash[:alert] = 'Не удалось отправить письмо'
        end 
      @feedback =Feedback.new       
    	render action:'new'
    else
    	flash[:alert] = 'Поля формы заполнены не верно'
    	render action:'new'
    end
       
   
  end
  def find_article
    @article = Article.where(:addon=>'feedback').first
  end
  def human?
    return true if @feedback.spam.blank? 
  end
end
