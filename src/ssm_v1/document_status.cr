private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum DocumentStatus
    Creating
    Active
    Updating
    Deleting
    Failed

    def self.to_json(e : DocumentStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentStatus
      value = pull.read_string
      case value
      when "Creating" then AS::DocumentStatus::Creating
      when "Active"   then AS::DocumentStatus::Active
      when "Updating" then AS::DocumentStatus::Updating
      when "Deleting" then AS::DocumentStatus::Deleting
      when "Failed"   then AS::DocumentStatus::Failed
      else
        raise Exception.new("unknown enum value for 'DocumentStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
