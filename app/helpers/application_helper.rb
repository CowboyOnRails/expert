# encoding:UTF-8
module ApplicationHelper
	def menu_link(article)
  	addons = Hash[
	  	'newsposts'=> newsposts_path,
	  	'partners' => partners_path,
	  	'feedback' => new_feedback_path,
	  	'questions'=> questions_path,
	  ]
	if article
		if article.addon and addons.include?(article.addon)
	      link_to article.name, addons[article.addon]
	    else
	      link_to article.name, article_path(article) 
	    end
    end
    end

    def parse_metadata(article)    	

    	title = article.name

        if article.metaitem.present?
           title = article.metaitem.title if article.metaitem.title.present?

           description = article.metaitem.description
           content_for :description, description

           keywords = article.metaitem.keywords
           content_for :keywords, keywords
        end
   
        sitename = Location.first.sitename
       
        content_for (:title){
      	   title + ' - ' + sitename
        }

    end

    #def parse_metadata_for_addon(addon)
    #  article = Article.where(:addon=>addon).first
    #  parse_metadata (article) if article
    #end

    def sub_menu_image(article)
      if article.parent_id ==1
         image = article.cover_image       
     
      elsif article.parent_id > 1
         if article.cover_image
          image = article.cover_image
         else
           parent = Article.where(:id => article.parent_id).first
           image = parent.cover_image
         end 
      end
    end

    #def sub_menu_image_for_addon(addon)
    #  article = Article.where(:addon=>addon).first
    #  sub_menu_image(article)
    #end

    def render_sub_menu(article)
      parent = article  
      parent = Article.find(article.parent_id) if article.parent_id!=1

      render :partial =>'/shared/sub_menu', :locals => {:article => parent}
    end

    def addon_new_link(addon)
      addons={
       'newsposts' => {:name => 'Добавить новость',      :link => new_newspost_path},
       'partners'  => {:name =>'Добавить партнера',      :link => new_partner_path},
       'questions' => {:name => 'Добавить ответ', :link => new_question_path},
      }
      link_to addons[addon][:name], addons[addon][:link] if addons.include?(addon)
    end
end
