class DefaultController < ApplicationController
  
  def index
    @entries = Entry.approved.all(:limit => 10)
  end
end
