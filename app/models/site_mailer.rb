class SiteMailer < ActionMailer::Base
  
  def entry_submission(entry)
    @recipients   = "info@#{DOMAIN_NAME}"
    @from         = "submissions@#{DOMAIN_NAME}"
    @subject      = "[#{DOMAIN_NAME}] New Entry Submitted!"
    @sent_on      = Time.now
    @body[:entry] = entry
  end
  
  def comment(comment)
    @recipients     = "info@#{DOMAIN_NAME}"
    @from           = "submissions@#{DOMAIN_NAME}"
    @subject        = "[#{DOMAIN_NAME}] New Comment Posted!"
    @sent_on        = Time.now
    @body[:entry]   = comment.entry
    @body[:comment] = comment
  end
  
end
