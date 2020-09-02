class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, presence: true
    validates :summary, length: { maximun: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction),
        message: "%{value} is not a valid category" }

    validate :clickbait_approved

    def clickbait_approved
        if title
            clickbait_phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
            clickbaity = clickbait_phrases.any? { |phrase| title.include? phrase }
            if !clickbaity
                errors.add(:title, "make title more clickbait-y") 
            end
        end
    end

end



