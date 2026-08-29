private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum InvocationType
    Event
    RequestResponse
    DryRun

    def self.to_json(e : InvocationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::InvocationType
      value = pull.read_string
      case value
      when "Event"           then AL::InvocationType::Event
      when "RequestResponse" then AL::InvocationType::RequestResponse
      when "DryRun"          then AL::InvocationType::DryRun
      else
        raise Exception.new("unknown enum value for 'InvocationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::InvocationType?
      case key
      when "Event"           then AL::InvocationType::Event
      when "RequestResponse" then AL::InvocationType::RequestResponse
      when "DryRun"          then AL::InvocationType::DryRun
      else
        nil
      end
    end
  end
end
