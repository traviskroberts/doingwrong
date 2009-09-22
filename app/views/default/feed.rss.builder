xml.instruct! :xml, :version => '1.0'
xml.rss "version" => "2.0" do
	xml.channel do
		xml.title "This is What You're Doing Wrong"
		xml.description 'Recent Entries'
		xml.link rss_feed_url(:format => 'rss')
		
		@entries.each do |entry|
			xml.item do
				xml.title "To: " + entry.to
				xml.description "This is What You're Doing Wrong:\n" + entry.message
				xml.pubDate entry.created_at.to_time.to_s(:rfc822)
				xml.link entry_details_url(:id => entry.id, :slug => entry.slug)
			end
		end
	end
end