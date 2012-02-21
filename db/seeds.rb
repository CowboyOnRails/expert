# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 #Article.create([{:name=>'О компании', :position=>1})
 # Article.create(:name=>'Юридические услуги', :position =>3)  
 User.create(:email=>'admin@admin.com',:password =>'password')

 Location.create(:adress=>"Компания «Эксперт»",:phone=>'311-11-11',
     :email=>'pop-corm2@ya.ru',:copyright=>'copyright',:sitename=>'Экперт-М')

 #articles = Array.new(
#	    ['о компании','about.jpg'],['новости','news.jpg'],
 #       ['юридические услуги','legalservices.jpg'],
#	    ['экономическая безопасность','economicsecurity.jpg'],
#	    ['контрольно-ревизионные услуги','controlservices.jpg'],
#	    ['партнеры','partners.jpg'],['справка','questions.jpg'],
#	    ['обратная связь','how-to-find-us.jpg'],
#	    ['контакты','contact-us.jpg']
#	)
Article.create(:name=>'Главная страница',:parent_id=>0)
Metaitem.create(:title=>'Главная страница',:page_id=>'1',:page_type=>'article')

articles = Array.[](
	    'о компании',
	    'новости',
        'юридические услуги',
	    'экономическая безопасность',
	    'контрольно-ревизионные услуги',
	    'партнеры',
	    'справка',
	    'обратная связь',
	    'контакты'
	)
articles.each {|a| Article.create(:name=>a)}





