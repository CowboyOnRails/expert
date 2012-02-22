class NewspostsController < ApplicationController
  # GET /newsposts
  # GET /newsposts.json
  before_filter :find_article
  def index
    @page = params[:page]
    @newsposts = Newspost.paginate(:page=>@page,:per_page=>1).order('created_at DESC')     
  end

  # GET /newsposts/1
  # GET /newsposts/1.json
  def show
    @newspost = Newspost.find(params[:id])
    @metaitem = @newspost.metaitem

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newspost }
    end
  end

  # GET /newsposts/new
  # GET /newsposts/new.json
  def new
    @newspost = Newspost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newspost }
    end
  end

  # GET /newsposts/1/edit
  def edit
    @newspost = Newspost.find(params[:id])
  end

  # POST /newsposts
  # POST /newsposts.json
  def create
    @newspost = Newspost.new(params[:newspost])

    respond_to do |format|
      if @newspost.save
        format.html { redirect_to @newspost, notice: 'Newspost was successfully created.' }
        format.json { render json: @newspost, status: :created, location: @newspost }
      else
        format.html { render action: "new" }
        format.json { render json: @newspost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /newsposts/1
  # PUT /newsposts/1.json
  def update
    @newspost = Newspost.find(params[:id])

    respond_to do |format|
      if @newspost.update_attributes(params[:newspost])
        format.html { redirect_to @newspost, notice: 'Newspost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @newspost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsposts/1
  # DELETE /newsposts/1.json
  def destroy
    @newspost = Newspost.find(params[:id])

    @newspost.metaitem.destroy if @newspost.metaitem.present?
    @newspost.destroy

    respond_to do |format|
      format.html { redirect_to newsposts_path }
      format.json { head :no_content }
    end
  end

  def find_article
    @article = Article.where(:addon=>'newsposts').first
  end
end
