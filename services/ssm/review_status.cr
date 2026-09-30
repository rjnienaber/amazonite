private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum ReviewStatus
    Approved
    NotReviewed
    Pending
    Rejected

    def self.to_json(e : ReviewStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::ReviewStatus::Approved    then "APPROVED"
              when AS::ReviewStatus::NotReviewed then "NOT_REVIEWED"
              when AS::ReviewStatus::Pending     then "PENDING"
              when AS::ReviewStatus::Rejected    then "REJECTED"
              else
                raise Exception.new("unknown enum value for 'ReviewStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ReviewStatus
      value = pull.read_string
      case value
      when "APPROVED"     then AS::ReviewStatus::Approved
      when "NOT_REVIEWED" then AS::ReviewStatus::NotReviewed
      when "PENDING"      then AS::ReviewStatus::Pending
      when "REJECTED"     then AS::ReviewStatus::Rejected
      else
        raise Exception.new("unknown enum value for 'ReviewStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ReviewStatus::Approved    then "APPROVED"
      when AS::ReviewStatus::NotReviewed then "NOT_REVIEWED"
      when AS::ReviewStatus::Pending     then "PENDING"
      when AS::ReviewStatus::Rejected    then "REJECTED"
      else
        raise Exception.new("unknown enum value for 'ReviewStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ReviewStatus?
      case key
      when "APPROVED"     then AS::ReviewStatus::Approved
      when "NOT_REVIEWED" then AS::ReviewStatus::NotReviewed
      when "PENDING"      then AS::ReviewStatus::Pending
      when "REJECTED"     then AS::ReviewStatus::Rejected
      else
        nil
      end
    end
  end
end
