module ApplicationHelper
  def safe_url(url, link_text = nil, show_text_if_no_link = false)
    if !url.blank?
      if url[0..4] != 'http:'
           url = 'http://' + url
      end
      link_text = url unless !link_text.blank?
      return link_to(link_text, url)
    else
      show_text_if_no_link ? result = link_text : result = nil
      return result
    end
  end
end
