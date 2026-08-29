private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum LastUpdateStatus
    Successful
    Failed
    InProgress

    def self.to_json(e : LastUpdateStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::LastUpdateStatus
      value = pull.read_string
      case value
      when "Successful" then AL::LastUpdateStatus::Successful
      when "Failed"     then AL::LastUpdateStatus::Failed
      when "InProgress" then AL::LastUpdateStatus::InProgress
      else
        raise Exception.new("unknown enum value for 'LastUpdateStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::LastUpdateStatus?
      case key
      when "Successful" then AL::LastUpdateStatus::Successful
      when "Failed"     then AL::LastUpdateStatus::Failed
      when "InProgress" then AL::LastUpdateStatus::InProgress
      else
        nil
      end
    end
  end
end
