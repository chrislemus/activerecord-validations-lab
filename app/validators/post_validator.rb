class PostValidator < ActiveModel::Validator
  def validate(record)
    title = record.title
    clickbait_words = [ "Won't Believe", "Secret", "Top [number]", "Guess"]
    includes_clickbait = false
    clickbait_words.each do |word|
      includes_clickbait = true if title && title.include?(word) 
    end 
    unless includes_clickbait
      record.errors[:title] << "not clickbait"
    end
  end
end