private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ExecutionPreviewStatus
    Pending
    InProgress
    Success
    Failed

    def self.to_json(e : ExecutionPreviewStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ExecutionPreviewStatus
      value = pull.read_string
      case value
      when "Pending"    then AS::ExecutionPreviewStatus::Pending
      when "InProgress" then AS::ExecutionPreviewStatus::InProgress
      when "Success"    then AS::ExecutionPreviewStatus::Success
      when "Failed"     then AS::ExecutionPreviewStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ExecutionPreviewStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ExecutionPreviewStatus?
      case key
      when "Pending"    then AS::ExecutionPreviewStatus::Pending
      when "InProgress" then AS::ExecutionPreviewStatus::InProgress
      when "Success"    then AS::ExecutionPreviewStatus::Success
      when "Failed"     then AS::ExecutionPreviewStatus::Failed
      else
        nil
      end
    end
  end
end
