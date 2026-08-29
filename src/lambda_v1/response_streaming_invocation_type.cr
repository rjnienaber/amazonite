private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum ResponseStreamingInvocationType
    RequestResponse
    DryRun

    def self.to_json(e : ResponseStreamingInvocationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::ResponseStreamingInvocationType
      value = pull.read_string
      case value
      when "RequestResponse" then AL::ResponseStreamingInvocationType::RequestResponse
      when "DryRun"          then AL::ResponseStreamingInvocationType::DryRun
      else
        raise Exception.new("unknown enum value for 'ResponseStreamingInvocationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::ResponseStreamingInvocationType?
      case key
      when "RequestResponse" then AL::ResponseStreamingInvocationType::RequestResponse
      when "DryRun"          then AL::ResponseStreamingInvocationType::DryRun
      else
        nil
      end
    end
  end
end
