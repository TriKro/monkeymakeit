class FunnelsController < ApplicationController
  load_and_authorize_resource

  def index
    @funnels = Funnel.all
  end

  def show
    @funnel = Funnel.find(params[:id])
  end

  def new
    @funnel = Funnel.new
  end

  # GET /funnels/1/edit
  def edit
    @funnel = Funnel.find(params[:id])
  end

  def create
    @funnel = Funnel.new(params[:funnel])

    if @funnel.save
      redirect_to(funnels_url, :notice => 'Funnel was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @funnel = Funnel.find(params[:id])

    if @funnel.update_attributes(params[:funnel])
      redirect_to(funnels_url, :notice => 'Funnel was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @funnel = Funnel.find(params[:id])
    @funnel.destroy
    redirect_to(funnels_url, :notice => 'Funnel was successfully destroyed.')
  end

end