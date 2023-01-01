private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
  end
end
