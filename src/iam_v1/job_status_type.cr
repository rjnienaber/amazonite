private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum JobStatusType
    InProgress
    Completed
    Failed

    def self.to_json(e : JobStatusType, json : JSON::Builder) : Nil
      value = case e
              when AI::JobStatusType::InProgress then "IN_PROGRESS"
              when AI::JobStatusType::Completed  then "COMPLETED"
              when AI::JobStatusType::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'JobStatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::JobStatusType
      value = pull.read_string
      case value
      when "IN_PROGRESS" then AI::JobStatusType::InProgress
      when "COMPLETED"   then AI::JobStatusType::Completed
      when "FAILED"      then AI::JobStatusType::Failed
      else
        raise Exception.new("unknown enum value for 'JobStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::JobStatusType::InProgress then "IN_PROGRESS"
      when AI::JobStatusType::Completed  then "COMPLETED"
      when AI::JobStatusType::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'JobStatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::JobStatusType?
      case key
      when "IN_PROGRESS" then AI::JobStatusType::InProgress
      when "COMPLETED"   then AI::JobStatusType::Completed
      when "FAILED"      then AI::JobStatusType::Failed
      else
        nil
      end
    end
  end
end
