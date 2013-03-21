helpers do 
  def clean_link(link)
    link.sub(/http:\/\//, "").partition("/")[0]
  end
end
