class DefaultController < ApplicationController
  
  def index
    @entries = Entry.approved.all(:limit => 10, :order => 'created_at DESC')
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def archives
    @entries = Entry.approved.paginate(:all, :include => [:comments, :votes], :page => params[:page], :per_page => 10, :order => 'created_at DESC')
    respond_to do |format|
      format.html # archives.html.erb
    end
  end
  
end
