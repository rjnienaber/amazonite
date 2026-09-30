private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum DocumentReviewCommentType
    Comment

    def self.to_json(e : DocumentReviewCommentType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentReviewCommentType
      value = pull.read_string
      case value
      when "Comment" then AS::DocumentReviewCommentType::Comment
      else
        raise Exception.new("unknown enum value for 'DocumentReviewCommentType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DocumentReviewCommentType?
      case key
      when "Comment" then AS::DocumentReviewCommentType::Comment
      else
        nil
      end
    end
  end
end
