private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum DocumentReviewAction
    SendForReview
    UpdateReview
    Approve
    Reject

    def self.to_json(e : DocumentReviewAction, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentReviewAction
      value = pull.read_string
      case value
      when "SendForReview" then AS::DocumentReviewAction::SendForReview
      when "UpdateReview"  then AS::DocumentReviewAction::UpdateReview
      when "Approve"       then AS::DocumentReviewAction::Approve
      when "Reject"        then AS::DocumentReviewAction::Reject
      else
        raise Exception.new("unknown enum value for 'DocumentReviewAction' when deserializing from json: '#{value}'")
      end
    end
  end
end
