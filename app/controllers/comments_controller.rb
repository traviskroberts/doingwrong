class CommentsController < ApplicationController
  before_filter :login_required, :only => :destroy
  
  def create
    respond_to do |format|
      if simple_captcha_valid?
        @comment = Comment.new(params[:comment])
        if @comment.save
          SiteMailer.deliver_comment(@comment)
          format.html {
            flash[:success] = 'Your comment has been added.'
            redirect_to entry_details_path(:id => entry, :slug => entry.slug)
          }
          format.js # RJS template
        else
          @error = 'save'
          logger.warn(@comment.errors.to_a)
          format.html {
            flash[:error] = "You must provide your name and a comment."
            redirect_to entry_details_path(:id => entry, :slug => entry.slug)
          }
          format.js # RJS template
        end
      else # simple_captcha error
        @error = 'captcha'
        format.html {
          flash[:error] = 'You must enter the correct verification code.'
          redirect_to entry_details_path(:id => entry, :slug => entry.slug)
        }
        format.js # RJS template
      end
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    respond_to do |format|
      format.html {
        redirect_to entry_details_path(:id => comment.entry, :slug => comment.entry.slug)
      }
      format.js{
        render :update do |page|
          page.remove dom_id(comment)
        end
      }
    end
  end
  
end
