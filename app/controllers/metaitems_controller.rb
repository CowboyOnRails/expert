class MetaitemsController < ApplicationController
  before_filter :find_resource
  
  def edit
    if @resource.metaitem.present?
      @metaitem = @resource.metaitem
    else
      @metaitem = @resource.build_metaitem
    end
  end

  def update
    if @resource.metaitem.present?
      @metaitem = @resource.metaitem
      @metaitem.attributes = params[:metaitem]
    else
      @metaitem = @resource.build_metaitem(params[:metaitem])
    end

    if @metaitem.save
      flash[:notice] = "All done"
    else
      flash[:alert] = "Error"
    end

    redirect_to polymorphic_path(@resource)
  end

private

  def find_resource
    @resource_name  = request.fullpath.split('/')[1].classify.downcase
    param_id        = @resource_name + "_id"
    @resource_klass = Kernel.const_get(@resource_name.classify)

    @resource = @resource_klass.send(:find, params[param_id])
  end
end
