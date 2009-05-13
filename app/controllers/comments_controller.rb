class CommentsController < ApplicationController
  
  def create
    respond_to do |format|
      if simple_captcha_valid?
        @comment = Comment.new(params[:comment])
        if @comment.save
          # ContactMailer.deliver_comment(@comment)
          format.html {
            flash[:success] = 'Your comment has been added.'
            redirect_to entry_path(entry)
          }
          format.js # RJS template
        else
          @error = 'save'
          format.html {
            flash[:error] = "You must provide your name and a comment."
            redirect_to entry_path(entry)
          }
          format.js # RJS template
        end
      else # simple_captcha error
        @error = 'captcha'
        format.html {
          flash[:error] = 'You must enter the correct verification code.'
          redirect_to entry_path(entry)
        }
        format.js # RJS template
      end
    end
  end
  
end
