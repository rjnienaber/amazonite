private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MacModificationTaskState
    Successful
    Failed
    InProgress
    Pending

    def self.to_json(e : MacModificationTaskState, json : JSON::Builder) : Nil
      value = case e
              when AEC::MacModificationTaskState::Successful then "successful"
              when AEC::MacModificationTaskState::Failed     then "failed"
              when AEC::MacModificationTaskState::InProgress then "in-progress"
              when AEC::MacModificationTaskState::Pending    then "pending"
              else
                raise Exception.new("unknown enum value for 'MacModificationTaskState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MacModificationTaskState
      value = pull.read_string
      case value
      when "successful"  then AEC::MacModificationTaskState::Successful
      when "failed"      then AEC::MacModificationTaskState::Failed
      when "in-progress" then AEC::MacModificationTaskState::InProgress
      when "pending"     then AEC::MacModificationTaskState::Pending
      else
        raise Exception.new("unknown enum value for 'MacModificationTaskState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MacModificationTaskState::Successful then "successful"
      when AEC::MacModificationTaskState::Failed     then "failed"
      when AEC::MacModificationTaskState::InProgress then "in-progress"
      when AEC::MacModificationTaskState::Pending    then "pending"
      else
        raise Exception.new("unknown enum value for 'MacModificationTaskState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MacModificationTaskState?
      case key
      when "successful"  then AEC::MacModificationTaskState::Successful
      when "failed"      then AEC::MacModificationTaskState::Failed
      when "in-progress" then AEC::MacModificationTaskState::InProgress
      when "pending"     then AEC::MacModificationTaskState::Pending
      else
        nil
      end
    end
  end
end
