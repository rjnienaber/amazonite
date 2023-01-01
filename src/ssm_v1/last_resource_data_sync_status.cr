private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum LastResourceDataSyncStatus
    Successful
    Failed
    InProgress

    def self.to_json(e : LastResourceDataSyncStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::LastResourceDataSyncStatus
      value = pull.read_string
      case value
      when "Successful" then AS::LastResourceDataSyncStatus::Successful
      when "Failed"     then AS::LastResourceDataSyncStatus::Failed
      when "InProgress" then AS::LastResourceDataSyncStatus::InProgress
      else
        raise Exception.new("unknown enum value for 'LastResourceDataSyncStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
