helpers do
  
  def nest_comments_for_view
    #get all comments
    all_comments = @topic.comments
    
    #select parent comments
    parent_comments = []
    all_comments.each do |comment|
      if comment.parent_comment.nil?
        parent_comments << comment
      end
    end

    #select child comments
    child_comments = all_comments - parent_comments
    
    #create hash of parent and child comments
    output_hash = {}
    parent_comments.each do |parent|
      output_hash[parent] = child_comments.select {|child| child.parent_comment.id == parent.id}
    end

    output_hash
  end

end
