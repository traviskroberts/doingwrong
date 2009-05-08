class EntriesController < ApplicationController
  before_filter :login_required
  before_filter :admin_required, :only => [:index, :edit, :update, :destroy]
  
  def index
    @entries = Entry.paginate(:all, :page => params[:page], :per_page => 15, :order => 'created_at DESC')
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @entry = Entry.new
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @entry = Entry.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @entry = Entry.create(params[:entry])
    @entry.user = @current_user
    respond_to do |format|
      if @entry.save
        format.html {
          flash[:success] = 'Your submission has been received and will be reviewed shortly.'
          redirect_to home_path
        }
      else
        format.html {
          flash.now[:error] = 'Your submission could not be saved.'
          render :action => 'new'
        }
      end
    end
  end
  
  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      format.html {
        if @entry.update_attributes(params[:entry])
          flash[:success] = 'Entry updated!'
          redirect_to entries_path
        else
          flash[:error] = 'The entry could not be updated.'
          render :action => 'edit'
        end
      }
    end
  end
  
  def destroy
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.destroy
        format.html { redirect_to entries_path }
        format.js {
          render :update do |page|
            page.remove dom_id(@entry)
          end
        }
      else
        format.html {
          flash[:error] = 'The entry could not be deleted.'
          redirect_to entries_path
        }
        format.js {
          render :update do |page|
            page.alert 'The entry could not be deleted.'
          end
        }
      end
    end
  end
  
  def approve
    @entry = Entry.find(params[:id])
    @entry.update_attribute(:approved, true)
    respond_to do |format|
      format.html {
        flash[:success] = 'Entry approved!'
        redirect_to entries_path
      }
      format.js {
        render :update do |page|
          page.alert 'Approved!'
          page.remove "#{dom_id(@entry)}_approve_link"
        end
      }
    end
  end
  
end
